import 'dart:math';

import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/utils/scheduler.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_pair.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_state.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/match_simulator.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuctionCubit extends Cubit<AuctionState> {
  AuctionCubit({required this.skill}) : super(const AuctionState()) {
    _scheduler.every(const Duration(seconds: 1), _tick);
  }

  static const turnSeconds = 10;

  final double skill;
  final _scheduler = Scheduler();
  final _random = Random();

  List<AuctionPair> get pairs =>
      state.size == 11 ? AuctionPair.eleven : AuctionPair.five;

  AuctionPair get pair => pairs[state.pair.clamp(0, pairs.length - 1)];

  AuctionPlayer get hidden => AuctionPlayer.all[pair.a]!;

  AuctionPlayer get revealed =>
      AuctionPlayer.all[state.phase == AuctionPhase.revealOther
          ? pair.b
          : pair.a]!;

  bool get canRaise => state.price + 1 <= state.budget[MatchSide.me]!;

  double get timerProgress => switch (state.phase) {
    AuctionPhase.bid => state.seconds / turnSeconds,
    AuctionPhase.clues => 1,
    _ => 0,
  };

  BidMode get bidMode => switch (state.phase) {
    AuctionPhase.bid =>
      state.turn == MatchSide.me ? BidMode.mine : BidMode.theirs,
    AuctionPhase.revealTaker || AuctionPhase.revealOther => BidMode.revealing,
    _ => BidMode.waiting,
  };

  bool get urgent => state.phase == AuctionPhase.bid && state.seconds <= 3;

  bool get inMatch =>
      state.phase == AuctionPhase.match || state.phase == AuctionPhase.fullTime;

  int get freeComparison =>
      AuctionPlayer.all[pair.b]!.rating.compareTo(hidden.rating);

  List<List<String>> get rows => state.size == 11
      ? const [
          ['FW3', 'FW2', 'FW1'],
          ['MF1', 'MF3', 'MF2'],
          ['DF2', 'DF1', 'DF3', 'DF4'],
          ['GK'],
        ]
      : const [
          ['FW'],
          ['MF1', 'MF2'],
          ['DF'],
          ['GK'],
        ];

  int playerCount(MatchSide side) => state.teams[side]!.values
      .where((s) => AuctionPlayer.all[s.player]!.role != PlayerRole.co)
      .length;

  MatchSide? get turn => state.phase == AuctionPhase.bid ? state.turn : null;

  int average(MatchSide side) {
    final players = [
      for (final s in state.teams[side]!.values)
        if (AuctionPlayer.all[s.player]!.role != PlayerRole.co)
          AuctionPlayer.all[s.player]!.rating,
    ];
    return players.isEmpty
        ? 0
        : (players.reduce((a, b) => a + b) / players.length).round();
  }

  List<MatchEvent> get shownEvents => [
    for (final e in state.sim?.events ?? const <MatchEvent>[])
      if (state.phase == AuctionPhase.fullTime || e.minute <= state.minute) e,
  ];

  int goals(MatchSide side) =>
      shownEvents.where((e) => e.goal && e.side == side).length;

  void pickSize(int size) {
    if (state.phase != AuctionPhase.setup) return;
    final budget = size == 11 ? 250 : 100;
    emit(
      state.copyWith(
        size: size,
        budget: {MatchSide.me: budget, MatchSide.opp: budget},
      ),
    );
    _scheduler.after(350, () => _lot(0));
  }

  void _lot(int index) {
    final turn = index.isOdd ? MatchSide.opp : MatchSide.me;
    emit(
      state.copyWith(
        pair: index,
        phase: AuctionPhase.clues,
        clues: 0,
        price: 1,
        clearHolder: true,
        turn: turn,
        seconds: turnSeconds,
        flip: 0,
      ),
    );
    for (final n in [1, 2, 3]) {
      _scheduler.after(700 + n * 1100, () => emit(state.copyWith(clues: n)));
    }
    _scheduler.after(4700, () {
      emit(state.copyWith(phase: AuctionPhase.bid, seconds: turnSeconds));
      if (turn == MatchSide.opp) _ai();
    });
  }

  void _tick() {
    if (state.phase != AuctionPhase.bid) return;
    final t = state.seconds - 1;
    emit(state.copyWith(seconds: t));
    if (t > 0 || state.turn != MatchSide.me) return;
    emit(
      state.copyWith(
        toast: const ToastMessage(
          AppStrings.timeUpAutoPass,
          kind: ToastKind.warn,
        ),
      ),
    );
    _pass(MatchSide.me);
  }

  void raise() => _raise(MatchSide.me);

  void pass() => _pass(MatchSide.me);

  void _raise(MatchSide who) {
    if (state.phase != AuctionPhase.bid || state.turn != who) return;
    final next = state.price + 1;
    if (next > state.budget[who]!) {
      if (who == MatchSide.me) {
        emit(
          state.copyWith(
            toast: const ToastMessage(
              AppStrings.budgetShort,
              kind: ToastKind.warn,
            ),
          ),
        );
      }
      return;
    }
    emit(
      state.copyWith(
        price: next,
        holder: who,
        turn: who.other,
        seconds: turnSeconds,
      ),
    );
    if (who.other == MatchSide.opp) _ai();
  }

  void _pass(MatchSide who) {
    if (state.phase != AuctionPhase.bid || state.turn != who) return;
    final taker = who.other;
    final slot = pair.slot;
    emit(
      state.copyWith(
        phase: AuctionPhase.revealTaker,
        clearTurn: true,
        teams: {
          ...state.teams,
          taker: {
            ...state.teams[taker]!,
            slot: (player: pair.a, price: state.price),
          },
        },
        budget: {...state.budget, taker: state.budget[taker]! - state.price},
        last: (taker: taker, other: who, price: state.price),
      ),
    );
    _scheduler.after(2800, () => emit(state.copyWith(flip: 1)));
    _scheduler.after(3150, () {
      emit(
        state.copyWith(
          flip: 2,
          phase: AuctionPhase.revealOther,
          teams: {
            ...state.teams,
            who: {...state.teams[who]!, slot: (player: pair.b, price: 0)},
          },
        ),
      );
    });
    _scheduler.after(3230, () => emit(state.copyWith(flip: 0)));
    _scheduler.after(
      6200,
      () =>
          state.pair + 1 < pairs.length ? _lot(state.pair + 1) : _startMatch(),
    );
  }

  void _ai() {
    _scheduler.after(1000 + _random.nextInt(900), () {
      if (state.phase != AuctionPhase.bid || state.turn != MatchSide.opp) {
        return;
      }
      final scale = state.size == 11 ? 1.25 : 1.0;
      final guess = hidden.rating + (_random.nextDouble() * 8 - 4);
      final value =
          1 +
          ((guess - 78) * (1.1 + skill * .8) + (_random.nextDouble() * 6 - 3)) *
              scale;
      state.price + 1 <= min(value, state.budget[MatchSide.opp]!.toDouble())
          ? _raise(MatchSide.opp)
          : _pass(MatchSide.opp);
    });
  }

  void _startMatch() {
    final sim = MatchSimulator(_random)
        .simulate(state.teams[MatchSide.me]!, state.teams[MatchSide.opp]!);
    emit(state.copyWith(phase: AuctionPhase.match, sim: sim, minute: 0));
    for (var i = 1; i <= 90; i++) {
      _scheduler.after(600 + i * 120, () => emit(state.copyWith(minute: i)));
    }
    _scheduler.after(600 + 91 * 120, _fullTime);
  }

  void skip() {
    _scheduler.clearTimers();
    _fullTime();
  }

  void _fullTime() {
    final sim = state.sim;
    if (sim == null || state.phase == AuctionPhase.fullTime) return;
    emit(
      state.copyWith(
        phase: AuctionPhase.fullTime,
        minute: 90,
        score: (side: sim.winner, points: 25),
      ),
    );
    final pens = sim.penalties;
    final detail =
        '${sim.goalsMe} – ${sim.goalsOpp}${pens == null ? '' : ' (${pens.me}–${pens.opp})'}';
    _scheduler.after(
      4500,
      () =>
          emit(state.copyWith(finished: (winner: sim.winner, detail: detail))),
    );
  }

  @override
  Future<void> close() {
    _scheduler.cancel();
    return super.close();
  }
}
