import 'dart:async';
import 'dart:math';

import 'package:fii90/core/audio/app_sfx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/utils/answer_matcher.dart';
import 'package:fii90/core/utils/scheduler.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/buzzer_round/mock_model/buzzer_question.dart';
import 'package:fii90/feature/buzzer_round/presentation/view_model/buzzer_state.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuzzerCubit extends Cubit<BuzzerState> {
  BuzzerCubit({
    required int question,
    required this.skill,
    required this.oppKey,
  }) : question = BuzzerQuestion.mock[question % BuzzerQuestion.mock.length],
       super(const BuzzerState()) {
    _scheduler.every(const Duration(seconds: 1), _tick);
  }

  final BuzzerQuestion question;
  final double skill;
  final String oppKey;
  final input = TextEditingController();
  final _scheduler = Scheduler();
  final _random = Random();
  final _watch = Stopwatch();
  Timer? _oppTimer;
  int _oppAt = 0;

  MatchSide? get turn => switch (state.phase) {
    BuzzerPhase.sending ||
    BuzzerPhase.meFirst ||
    BuzzerPhase.answer ||
    BuzzerPhase.verify => MatchSide.me,
    BuzzerPhase.oppFirst || BuzzerPhase.oppAnswer => MatchSide.opp,
    _ => null,
  };

  (String, Color) get status => switch (state.phase) {
    BuzzerPhase.ready => (AppStrings.getReady, AppColors.mu),
    BuzzerPhase.active => (AppStrings.pressBellNow, AppColors.m3Ink),
    BuzzerPhase.sending => (AppStrings.serverDeciding, AppColors.mu),
    BuzzerPhase.meFirst => (AppStrings.youAreFirst, AppColors.meInk),
    BuzzerPhase.oppFirst => (AppStrings.oppPressedFirst, AppColors.opInk),
    BuzzerPhase.oppAnswer => (AppStrings.oppAnsweringNow, AppColors.opInk),
    _ => ('', AppColors.mu),
  };

  ({String mark, String title, String? sub, Color color}) get outcome =>
      switch (state.phase) {
        BuzzerPhase.ok => (
          mark: '✓',
          title: AppStrings.correctAnswerBang,
          sub: AppStrings.gainedReveal,
          color: AppColors.okInk,
        ),
        BuzzerPhase.oppOk => (
          mark: '✓',
          title: AppStrings.oppAnsweredRight,
          sub: AppStrings.gainedAnswer,
          color: AppColors.opInk,
        ),
        BuzzerPhase.oppBad => (
          mark: '✕',
          title: AppStrings.oppWrong,
          sub: AppStrings.yourChanceNow,
          color: AppColors.meInk,
        ),
        BuzzerPhase.nobody => (
          mark: '—',
          title: AppStrings.nobodyCorrect,
          sub: AppStrings.theAnswer,
          color: AppColors.mu,
        ),
        _ => (
          mark: '✕',
          title: state.phase == BuzzerPhase.timeout
              ? AppStrings.timeUp
              : AppStrings.wrongAnswer,
          sub: state.oppTried ? null : AppStrings.chanceWentTo,
          color: AppColors.badInk,
        ),
      };

  List<String> outcomeArgs(String me, String opp, String reveal) =>
      switch (state.phase) {
        BuzzerPhase.ok => [me, reveal],
        BuzzerPhase.oppOk => [opp, reveal],
        BuzzerPhase.nobody => [reveal],
        _ => [opp],
      };

  (int, int) get _oppWindow => skill <= .4
      ? (3200, 5200)
      : skill >= .88
      ? (1300, 2300)
      : (2000, 3600);

  void _tick() {
    switch (state.phase) {
      case BuzzerPhase.ready:
        final c = state.count - 1;
        if (c > 0) return emit(state.copyWith(count: c));
        emit(state.copyWith(phase: BuzzerPhase.active, count: 0, seconds: 8));
        _watch.start();
        final (min, max) = _oppWindow;
        _oppAt = min + _random.nextInt(max - min);
        _oppTimer = Timer(Duration(milliseconds: _oppAt), _oppPress);
      case BuzzerPhase.active:
        final t = state.seconds - 1;
        emit(state.copyWith(seconds: t));
        if (t <= 0) _nobody();
      case BuzzerPhase.answer:
        final t = state.answerSeconds - 1;
        emit(state.copyWith(answerSeconds: t));
        if (t <= 0) _resolve(false, timeout: true);
      default:
    }
  }

  void press() {
    if (state.phase.oppSide) {
      emit(
        state.copyWith(
          toast: ToastMessage(
            AppStrings.tooLateToast,
            kind: ToastKind.bad,
            args: [oppKey],
            translateArgs: true,
          ),
        ),
      );
      return;
    }
    if (state.phase != BuzzerPhase.active) return;
    AppSfx.bell();
    _oppTimer?.cancel();
    final gap = max(.03, (_oppAt - _watch.elapsedMilliseconds) / 1000);
    emit(state.copyWith(phase: BuzzerPhase.sending));
    _scheduler.after(
      380,
      () =>
          emit(state.copyWith(phase: BuzzerPhase.meFirst, gap: min(gap, 9.99))),
    );
    _scheduler.after(
      1700,
      () => emit(state.copyWith(phase: BuzzerPhase.answer, answerSeconds: 7)),
    );
  }

  void _oppPress() {
    if (state.phase != BuzzerPhase.active) return;
    emit(state.copyWith(phase: BuzzerPhase.oppFirst, oppTried: true));
    _scheduler.after(
      1100,
      () => emit(state.copyWith(phase: BuzzerPhase.oppAnswer)),
    );
    _scheduler.after(2600, () {
      if (_random.nextDouble() < skill) return _oppCorrect();
      emit(state.copyWith(phase: BuzzerPhase.oppBad));
      _scheduler.after(
        1800,
        () => emit(
          state.copyWith(
            phase: BuzzerPhase.answer,
            answerSeconds: 7,
            rebound: true,
          ),
        ),
      );
    });
  }

  void _oppCorrect() {
    emit(
      state.copyWith(
        phase: BuzzerPhase.oppOk,
        score: (side: MatchSide.opp, points: 15),
      ),
    );
    _scheduler.after(2600, () => _done(MatchSide.opp));
  }

  void submit() {
    if (state.phase != BuzzerPhase.answer) return;
    final value = input.text.trim();
    if (value.isEmpty) return;
    emit(state.copyWith(phase: BuzzerPhase.verify));
    _scheduler.after(
      650,
      () => _resolve(AnswerMatcher.matches(value, question.aliases)),
    );
  }

  void _resolve(bool ok, {bool timeout = false}) {
    if (ok) {
      emit(
        state.copyWith(
          phase: BuzzerPhase.ok,
          score: (side: MatchSide.me, points: 15),
        ),
      );
      _scheduler.after(2600, () => _done(MatchSide.me));
      return;
    }
    input.clear();
    emit(
      state.copyWith(phase: timeout ? BuzzerPhase.timeout : BuzzerPhase.bad),
    );
    if (state.oppTried) {
      _scheduler.after(1500, _nobody);
      return;
    }
    _scheduler.after(1700, () {
      emit(state.copyWith(phase: BuzzerPhase.oppAnswer, oppTried: true));
      _scheduler.after(
        2200,
        () => _random.nextDouble() < skill ? _oppCorrect() : _nobody(),
      );
    });
  }

  void _nobody() {
    _oppTimer?.cancel();
    emit(state.copyWith(phase: BuzzerPhase.nobody));
    _scheduler.after(3200, () => _done(null));
  }

  void _done(MatchSide? winner) => emit(
    state.copyWith(
      finished: (
        winner: winner,
        detailKey: winner == null
            ? AppStrings.nobodyCorrect
            : AppStrings.fastestCorrect,
      ),
    ),
  );

  @override
  Future<void> close() {
    _scheduler.cancel();
    _oppTimer?.cancel();
    input.dispose();
    return super.close();
  }
}
