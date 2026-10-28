import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/utils/scheduler.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/match/mock_model/match_mode.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view_model/match_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchCubit extends Cubit<MatchState> {
  MatchCubit({
    required List<MatchMode> modes,
    bool vsAi = false,
    AiLevel aiLevel = AiLevel.normal,
    bool fromRoom = false,
  }) : super(
         MatchState(
           modes: modes,
           vsAi: vsAi,
           aiLevel: aiLevel,
           stage: fromRoom ? MatchStage.vs : MatchStage.search,
           found: vsAi,
           searchSeconds: vsAi ? 2 : 0,
         ),
       ) {
    _scheduler.every(const Duration(seconds: 1), _tick);
    if (vsAi) _scheduler.after(2200, () => _go(MatchStage.vs));
  }

  final _scheduler = Scheduler();
  final _deltaTimer = Scheduler();

  double get skill => state.vsAi ? state.aiLevel.skill : AiLevel.normal.skill;

  String get oppNameKey =>
      state.vsAi ? AppStrings.aiName : AppStrings.mockPlayerOmar;

  String get oppLevelKey =>
      state.vsAi ? state.aiLevel.labelKey : AppStrings.oppLevel;

  String initialOf(String name) => state.vsAi ? name : name.characters.first;

  bool get isLastRound => state.roundIndex + 1 >= state.modes.length;

  MatchMode? get nextMode =>
      isLastRound ? null : state.modes[state.roundIndex + 1];

  bool get won => state.meScore > state.oppScore;

  bool get lost => state.meScore < state.oppScore;

  int get earnedXp => won
      ? 120
      : lost
      ? 45
      : 70;

  void _go(MatchStage stage) => emit(state.copyWith(stage: stage));

  void _tick() {
    switch (state.stage) {
      case MatchStage.search when !state.found:
        final t = state.searchSeconds + 1;
        emit(state.copyWith(searchSeconds: t, found: t >= 3));
        if (t >= 3) _scheduler.after(2200, () => _go(MatchStage.vs));
      case MatchStage.vs:
        final c = state.vsCount - 1;
        c < 0 ? _openIntro() : emit(state.copyWith(vsCount: c));
      case MatchStage.intro:
        final c = state.introCount - 1;
        c <= 0 ? startRound() : emit(state.copyWith(introCount: c));
      default:
    }
  }

  void _openIntro() =>
      emit(state.copyWith(stage: MatchStage.intro, introCount: 4));

  void cancel() => _go(MatchStage.exit);

  void startRound() => emit(
    state.copyWith(
      stage: MatchStage.round,
      question: 0,
      questionWins: const [],
      roundKey: state.roundKey + 1,
    ),
  );

  void addScore(MatchSide side, int amount) {
    emit(
      state.copyWith(
        meScore: state.meScore + (side == MatchSide.me ? amount : 0),
        oppScore: state.oppScore + (side == MatchSide.opp ? amount : 0),
        delta: (side: side, amount: amount),
      ),
    );
    _deltaTimer.cancel();
    _deltaTimer.after(1600, () => emit(state.copyWith(clearDelta: true)));
  }

  void finishQuestion(
    MatchSide? winner,
    int points,
    String detailKey, {
    List<String> args = const [],
    bool translateArgs = false,
  }) {
    final total = state.mode.questions;
    if (total == 1) {
      return _closeRound(winner, points, detailKey, args, translateArgs);
    }
    final wins = [...state.questionWins, (winner: winner, points: points)];
    if (wins.length < total) {
      emit(
        state.copyWith(
          question: wins.length,
          questionWins: wins,
          roundKey: state.roundKey + 1,
          toast: ToastMessage(
            AppStrings.questionOf,
            kind: ToastKind.info,
            args: ['${wins.length + 1}', '$total'],
          ),
        ),
      );
      return;
    }
    final me = wins.where((w) => w.winner == MatchSide.me).length;
    final opp = wins.where((w) => w.winner == MatchSide.opp).length;
    final side = me > opp
        ? MatchSide.me
        : opp > me
        ? MatchSide.opp
        : null;
    final pts = wins
        .where((w) => w.winner == side)
        .fold(0, (a, w) => a + w.points);
    _closeRound(side, pts, AppStrings.wonQuestions, [
      '$me',
      '$opp',
      '$total',
    ], false);
  }

  void _closeRound(
    MatchSide? winner,
    int points,
    String detailKey,
    List<String> args,
    bool translateArgs,
  ) {
    final result = RoundResult(
      mode: state.mode,
      winner: winner,
      points: points,
      detailKey: detailKey,
      detailArgs: args,
      translateArgs: translateArgs,
    );
    emit(
      state.copyWith(
        stage: MatchStage.roundResult,
        rounds: [...state.rounds, result],
        questionWins: const [],
      ),
    );
  }

  void next() => isLastRound
      ? emit(
          state.copyWith(
            stage: MatchStage.finished,
            toast: won ? const ToastMessage(AppStrings.winCoinsToast) : null,
          ),
        )
      : emit(
          state.copyWith(
            stage: MatchStage.intro,
            roundIndex: state.roundIndex + 1,
            introCount: 4,
          ),
        );

  void rematch() => emit(
    MatchState(
      modes: state.modes,
      vsAi: state.vsAi,
      aiLevel: state.aiLevel,
      stage: MatchStage.vs,
      roundKey: state.roundKey + 1,
    ),
  );

  @override
  Future<void> close() {
    _scheduler.cancel();
    _deltaTimer.cancel();
    return super.close();
  }
}
