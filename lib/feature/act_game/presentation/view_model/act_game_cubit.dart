import 'dart:math';

import 'package:fii90/core/utils/scheduler.dart';
import 'package:fii90/feature/act_game/mock_model/act_card.dart';
import 'package:fii90/feature/act_game/presentation/view_model/act_game_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActGameCubit extends Cubit<ActGameState> {
  ActGameCubit({required this.names, required this.members})
    : super(
        ActGameState(
          deck: [
            for (final c in ([...ActCard.mock]..shuffle()).take(10))
              (card: c, result: null),
          ],
        ),
      ) {
    _scheduler.every(const Duration(seconds: 1), _tick);
  }

  static const actSeconds = 60;
  static const miss = -1;

  final List<String> names;
  final List<List<String>> members;
  final _scheduler = Scheduler();
  final _random = Random();

  DeckCard? get picked => state.pick < 0 ? null : state.deck[state.pick];

  String get actorName {
    final team = members[state.turn];
    return team.isEmpty
        ? names[state.turn]
        : team[state.actor[state.turn] % team.length];
  }

  int get cardsLeft => state.deck.where((c) => c.result == null).length;

  int get guessed =>
      state.deck.where((c) => c.result != null && c.result != miss).length;

  void pick(int index) {
    if (state.step != ActStep.pick ||
        state.shuffling ||
        state.deck[index].result != null) {
      return;
    }
    emit(state.copyWith(step: ActStep.peek, pick: index, shown: false));
  }

  void shuffle() {
    if (state.step != ActStep.pick || state.shuffling) return;
    emit(state.copyWith(shuffling: true, shuffles: state.shuffles + 1));
    _scheduler.after(850, () {
      final free = [
        for (final (i, c) in state.deck.indexed)
          if (c.result == null) i,
      ];
      final values = [for (final i in free) state.deck[i]]..shuffle(_random);
      final deck = [...state.deck];
      for (final (n, i) in free.indexed) {
        deck[i] = values[n];
      }
      emit(state.copyWith(deck: deck, shuffling: false));
    });
  }

  void reveal() => emit(state.copyWith(shown: true));

  void startActing() =>
      emit(state.copyWith(step: ActStep.act, seconds: actSeconds));

  void judge(bool ok) => _result(ok, timeout: false);

  void _tick() {
    if (state.step != ActStep.act) return;
    final t = state.seconds - 1;
    t <= 0 ? _result(false, timeout: true) : emit(state.copyWith(seconds: t));
  }

  void _result(bool ok, {required bool timeout}) {
    final current = picked;
    if (current == null) return;
    final deck = [...state.deck]
      ..[state.pick] = (card: current.card, result: ok ? state.turn : miss);
    final scores = [...state.scores];
    if (ok) scores[state.turn] += current.card.level;
    final actor = [...state.actor]..[state.turn] += 1;
    emit(
      state.copyWith(
        deck: deck,
        scores: scores,
        actor: actor,
        turn: 1 - state.turn,
        step: ActStep.pick,
        pick: -1,
        shown: false,
        notice: (
          card: current.card,
          team: state.turn,
          ok: ok,
          timeout: timeout,
        ),
      ),
    );
    if (deck.every((c) => c.result != null)) {
      _scheduler.after(1000, () => emit(state.copyWith(finished: true)));
    }
  }

  @override
  Future<void> close() {
    _scheduler.cancel();
    return super.close();
  }
}
