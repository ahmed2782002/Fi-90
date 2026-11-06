import 'dart:math';

import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/utils/answer_matcher.dart';
import 'package:fii90/core/utils/scheduler.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/comeback_round/mock_model/comeback_question.dart';
import 'package:fii90/feature/comeback_round/presentation/view_model/comeback_state.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComebackCubit extends Cubit<ComebackState> {
  ComebackCubit({
    required int question,
    required this.skill,
    required this.oppKey,
    required this.meScore,
    required this.oppScore,
  }) : question = ComebackQuestion.mock[_order[question % _order.length]],
       super(const ComebackState()) {
    _aiAt = 6 + _random.nextInt(7);
    _scheduler.every(const Duration(seconds: 1), _tick);
  }

  static const totalSeconds = 40;

  /// Clubs are revealed across this window, leaving the rest for last guesses.
  static const _revealSeconds = 32;

  /// Shuffled once per app run so each match draws different players
  /// without repeating one inside the same match.
  static final _order = List.generate(ComebackQuestion.mock.length, (i) => i)
    ..shuffle();

  final ComebackQuestion question;
  final double skill;
  final String oppKey;
  final int meScore;
  final int oppScore;
  final input = TextEditingController();
  final _scheduler = Scheduler();
  final _random = Random();
  late int _aiAt;

  /// Sides whose guess is being checked. Both players may have one in flight;
  /// checks resolve in submit order, so the first correct answer wins.
  final _pending = <MatchSide>{};

  int get _interval => max(2, _revealSeconds ~/ max(1, question.clubs.length - 1));

  int get points => 45 - 5 * state.revealed;

  int get secondsLeft => max(0, totalSeconds - state.elapsed);

  double get nextClubProgress => state.revealed < question.clubs.length
      ? (state.elapsed % _interval) / _interval
      : 1;

  /// Each player gets only [maxAttempts] guesses per question.
  static const maxAttempts = 2;

  int attemptsUsed(MatchSide side) =>
      state.guesses.where((g) => g.side == side).length;

  int attemptsLeft(MatchSide side) => max(0, maxAttempts - attemptsUsed(side));

  bool get _bothOut =>
      attemptsLeft(MatchSide.me) == 0 && attemptsLeft(MatchSide.opp) == 0;

  bool get canType =>
      !state.done &&
      !_pending.contains(MatchSide.me) &&
      attemptsLeft(MatchSide.me) > 0;

  void _tick() {
    if (state.done || _pending.isNotEmpty) return;
    final k = state.elapsed + 1;
    final revealed =
        k % _interval == 0 && state.revealed < question.clubs.length
        ? state.revealed + 1
        : state.revealed;
    emit(state.copyWith(elapsed: k, revealed: revealed));
    if (k >= totalSeconds) return _finish(null);
    if (k < _aiAt || attemptsLeft(MatchSide.opp) == 0) return;
    final ok = _random.nextDouble() < skill * (.55 + .1 * revealed);
    final used = state.guesses.map((g) => g.text).toSet();
    final wrong = question.wrong.where((w) => !used.contains(w)).toList();
    _guess(MatchSide.opp, ok || wrong.isEmpty ? question.name.ar : wrong.first);
  }

  void submit() {
    final value = input.text.trim();
    if (!canType || value.isEmpty) return;
    input.clear();
    _guess(MatchSide.me, value);
  }

  void _guess(MatchSide who, String text) {
    if (state.done || _pending.contains(who) || attemptsLeft(who) == 0) {
      return;
    }
    _pending.add(who);
    if (who == MatchSide.me) emit(state.copyWith(verifying: who));
    _scheduler.after(650, () {
      _pending.remove(who);
      if (state.done) return;
      if (AnswerMatcher.matches(text, question.aliases)) {
        emit(state.copyWith(clearVerifying: true));
        return _finish(who);
      }
      _aiAt = state.elapsed + 3 + _random.nextInt(5);
      final guesses = [...state.guesses, (text: text, side: who)];
      final lastTry = guesses.where((g) => g.side == who).length >= maxAttempts;
      emit(
        state.copyWith(
          clearVerifying: who == MatchSide.me,
          guesses: guesses,
          toast: who == MatchSide.me
              ? ToastMessage(
                  lastTry
                      ? AppStrings.comebackLastWrong
                      : AppStrings.wrongBothRetry,
                  kind: ToastKind.bad,
                )
              : ToastMessage(
                  AppStrings.oppWrongGuess,
                  kind: ToastKind.bad,
                  args: [oppKey, text],
                  translateArgs: true,
                ),
        ),
      );
      // Both players burned their two attempts → draw, nobody scores.
      if (_bothOut) _finish(null);
    });
  }

  void _finish(MatchSide? winner) {
    final pts = winner == null ? 0 : points;
    final mine = winner == MatchSide.me ? meScore : oppScore;
    final theirs = winner == MatchSide.me ? oppScore : meScore;
    emit(
      state.copyWith(
        done: true,
        result: (
          winner: winner,
          points: pts,
          flip: winner != null && mine + pts > theirs,
        ),
        score: winner == null ? null : (side: winner, points: pts),
      ),
    );
    _scheduler.after(4200, () {
      emit(
        state.copyWith(
          finished: (
            winner: winner,
            points: pts,
            detailKey: winner == null
                ? AppStrings.nobodyKnew
                : AppStrings.knewFromClubs,
            args: ['${state.revealed}'],
          ),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _scheduler.cancel();
    input.dispose();
    return super.close();
  }
}
