import 'dart:math';

import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/utils/answer_matcher.dart';
import 'package:fii90/core/utils/scheduler.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/trivia_round/mock_model/trivia_question.dart';
import 'package:fii90/feature/trivia_round/presentation/view_model/trivia_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum PassBlock { chain, used, locked }

class TriviaCubit extends Cubit<TriviaState> {
  TriviaCubit({
    required int question,
    required this.skill,
    required this.oppKey,
  }) : question = TriviaQuestion.mock[question % TriviaQuestion.mock.length],
       super(const TriviaState()) {
    _scheduler.every(const Duration(seconds: 1), _tick);
    _scheduler.after(1500, _turn);
  }

  final TriviaQuestion question;
  final double skill;
  final String oppKey;
  final input = TextEditingController();
  final _scheduler = Scheduler();
  final _random = Random();

  bool get myTurn =>
      state.phase == TriviaPhase.turn && state.current == MatchSide.me;

  bool get oppTurn =>
      state.phase == TriviaPhase.turn && state.current == MatchSide.opp;

  MatchSide? get turn =>
      const [TriviaPhase.turn, TriviaPhase.verify].contains(state.phase)
      ? state.current
      : null;

  bool get mustAnswer => myTurn && state.lastPassBy == MatchSide.opp;

  PassBlock? passBlock(MatchSide who) {
    if (state.lastPassBy != null && state.lastPassBy != who) {
      return PassBlock.chain;
    }
    if (state.passUsed.contains(who)) return PassBlock.used;
    if (state.strikes[who]! < 2) return PassBlock.locked;
    return null;
  }

  void _tick() {
    if (state.phase != TriviaPhase.turn) return;
    final t = state.seconds - 1;
    emit(state.copyWith(seconds: t));
    if (t <= 0 && state.current == MatchSide.me) _answer('', timeout: true);
  }

  void _turn() {
    emit(
      state.copyWith(
        phase: TriviaPhase.turn,
        seconds: 20,
        typing: false,
        oppText: '',
        clearFeedback: true,
        toast:
            state.current == MatchSide.me && state.lastPassBy == MatchSide.opp
            ? const ToastMessage(
                AppStrings.oppPassedToast,
                kind: ToastKind.warn,
              )
            : null,
      ),
    );
    input.clear();
    if (state.current == MatchSide.opp) _ai();
  }

  void submit() {
    if (!myTurn) return;
    final value = input.text.trim();
    if (value.isEmpty) {
      emit(
        state.copyWith(
          toast: const ToastMessage(
            AppStrings.typeAnswerFirst,
            kind: ToastKind.warn,
          ),
        ),
      );
      return;
    }
    _verify(MatchSide.me, '');
    _scheduler.after(750, () => _answer(value));
  }

  void pass() {
    if (!myTurn) return;
    _pass(MatchSide.me);
  }

  void _verify(MatchSide who, String text) => emit(
    state.copyWith(
      phase: TriviaPhase.verify,
      typing: false,
      oppText: text,
      feedback: (
        kind: FeedbackKind.verify,
        who: who,
        answer: null,
        text: text,
        unlock: false,
        winner: null,
      ),
    ),
  );

  void _ai() {
    _scheduler.after(700, () => emit(state.copyWith(typing: true)));
    _scheduler.after(2300 + _random.nextInt(1200), () {
      if (!oppTurn) return;
      if (passBlock(MatchSide.opp) == null && _random.nextDouble() < .55) {
        return _pass(MatchSide.opp);
      }
      final used = state.submitted.map((s) => s.index).toSet();
      final pool = [
        for (var i = 0; i < question.answers.length; i++)
          if (!used.contains(i)) i,
      ];
      final ok = _random.nextDouble() < skill && pool.isNotEmpty;
      final text = ok
          ? question.answers[pool[_random.nextInt(pool.length)]].name.ar
          : question.wrong[_random.nextInt(question.wrong.length)].ar;
      _verify(MatchSide.opp, text);
      _scheduler.after(850, () => _answer(text));
    });
  }

  void _pass(MatchSide who) {
    final block = passBlock(who);
    if (block != null) {
      emit(
        state.copyWith(
          toast: ToastMessage(
            switch (block) {
              PassBlock.chain => AppStrings.passChainToast,
              PassBlock.used => AppStrings.passUsedToast,
              PassBlock.locked => AppStrings.passLockedToast,
            },
            kind: ToastKind.bad,
            args: ['${state.strikes[who]}'],
          ),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        phase: TriviaPhase.result,
        passUsed: {...state.passUsed, who},
        lastPassBy: who,
        current: who.other,
        feedback: (
          kind: FeedbackKind.pass,
          who: who,
          answer: null,
          text: '',
          unlock: false,
          winner: null,
        ),
      ),
    );
    _scheduler.after(1700, _turn);
  }

  void _answer(String text, {bool timeout = false}) {
    final who = state.current;
    final index = timeout ? -1 : AnswerMatcher.indexIn(text, question.bank);
    if (index >= 0 && state.submitted.any((s) => s.index == index)) {
      input.clear();
      emit(
        state.copyWith(
          phase: TriviaPhase.turn,
          feedback: (
            kind: FeedbackKind.dup,
            who: who,
            answer: index,
            text: text,
            unlock: false,
            winner: null,
          ),
        ),
      );
      _scheduler.after(1300, () {
        if (state.feedback?.kind == FeedbackKind.dup) {
          emit(state.copyWith(clearFeedback: true));
        }
      });
      return;
    }
    index >= 0 ? _correct(who, index, text) : _wrong(who, text, timeout);
  }

  void _correct(MatchSide who, int index, String text) {
    final submitted = [...state.submitted, (index: index, side: who)];
    if (submitted.length < question.answers.length) {
      emit(
        state.copyWith(
          phase: TriviaPhase.result,
          submitted: submitted,
          clearLastPass: true,
          current: who.other,
          feedback: (
            kind: FeedbackKind.ok,
            who: who,
            answer: index,
            text: text,
            unlock: false,
            winner: null,
          ),
        ),
      );
      _scheduler.after(1300, _turn);
      return;
    }
    final me = state.strikes[MatchSide.me]!,
        opp = state.strikes[MatchSide.opp]!;
    final winner = me < opp
        ? MatchSide.me
        : opp < me
        ? MatchSide.opp
        : null;
    emit(
      state.copyWith(
        phase: TriviaPhase.result,
        submitted: submitted,
        feedback: (
          kind: FeedbackKind.exhausted,
          who: who,
          answer: index,
          text: text,
          unlock: false,
          winner: winner,
        ),
      ),
    );
    _end(winner, AppStrings.answersExhausted, const []);
  }

  void _wrong(MatchSide who, String text, bool timeout) {
    final strikes = state.strikes[who]! + 1;
    final unlock = strikes == 2 && !state.passUsed.contains(who);
    final out = strikes >= 3;
    emit(
      state.copyWith(
        phase: TriviaPhase.result,
        strikes: {...state.strikes, who: strikes},
        clearLastPass: true,
        current: out ? null : who.other,
        feedback: (
          kind: out
              ? FeedbackKind.out
              : timeout
              ? FeedbackKind.timeout
              : FeedbackKind.bad,
          who: who,
          answer: null,
          text: timeout ? '' : text,
          unlock: unlock,
          winner: out ? who.other : null,
        ),
      ),
    );
    input.clear();
    out
        ? _end(who.other, AppStrings.reachedThreeStrikes, [
            who == MatchSide.me ? AppStrings.mockPlayerAhmed : oppKey,
          ])
        : _scheduler.after(1700, _turn);
  }

  void _end(MatchSide? winner, String detailKey, List<String> args) {
    _scheduler.after(1500, () {
      emit(
        state.copyWith(
          phase: TriviaPhase.over,
          score: winner == null ? null : (side: winner, points: 20),
        ),
      );
    });
    _scheduler.after(4800, () {
      emit(
        state.copyWith(
          finished: (winner: winner, detailKey: detailKey, args: args),
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
