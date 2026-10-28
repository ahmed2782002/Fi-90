import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/answer_board.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/board_feedback.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/feedback_panel.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/question_timer_card.dart';
import 'package:fii90/feature/trivia_round/presentation/view_model/trivia_cubit.dart';
import 'package:fii90/feature/trivia_round/presentation/view_model/trivia_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriviaBoardSection extends StatelessWidget {
  const TriviaBoardSection({
    super.key,
    required this.question,
    required this.total,
  });

  final int question;
  final int total;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TriviaCubit>();
    final state = cubit.state;
    final match = context.read<MatchCubit>();
    final me = context.tr(AppStrings.mockPlayerAhmed);
    final opp = context.tr(match.oppNameKey);
    String nameOf(MatchSide side) => side == MatchSide.me ? me : opp;
    final fb = state.feedback;
    final answer = fb?.answer;
    final urgent = state.phase == TriviaPhase.turn && state.seconds <= 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        QuestionTimerCard(
          tag: context.tr(
            AppStrings.triviaTag,
            args: ['${question + 1}/$total'],
          ),
          question: cubit.question.text.of(context),
          seconds: state.seconds,
          total: 20,
          ringColor: urgent ? AppColors.bad : state.current.fill,
          urgent: urgent,
        ),
        const SizedBox(height: 12),
        Expanded(
          child: AnswerBoard(
            title: context.tr(
              AppStrings.onTheBoard,
              args: ['${state.submitted.length}'],
            ),
            emptyHint: context.tr(AppStrings.boardEmptyHint),
            answers: [
              for (final s in state.submitted)
                (
                  name: cubit.question.answers[s.index].name.of(context),
                  dot: s.side.fill,
                ),
            ],
            overlay: state.phase == TriviaPhase.fresh
                ? FeedbackPanel(
                    background: AppColors.glass,
                    lines: [
                      (
                        text: context.tr(AppStrings.newQuestion),
                        style: AppText.newQuestion,
                      ),
                      (
                        text: context.tr(AppStrings.startsFirst, args: [me]),
                        style: AppText.meta,
                      ),
                    ],
                  )
                : fb == null || state.phase == TriviaPhase.over
                ? null
                : BoardFeedback(
                    kind: fb.kind,
                    who: nameOf(fb.who),
                    whoColor: fb.who.ink,
                    to: nameOf(fb.who.other),
                    strikes: state.strikes[fb.who]!,
                    unlock: fb.unlock,
                    text: fb.text,
                    answer: answer == null
                        ? null
                        : cubit.question.answers[answer].name.of(context),
                    fromOpponent: fb.who == MatchSide.opp,
                  ),
          ),
        ),
        if (cubit.mustAnswer) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.tint(AppColors.gold, .14),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.tint(AppColors.gold, .45)),
            ),
            child: Text(
              context.tr(AppStrings.oppPassedNotice, args: [opp]),
              style: AppText.passHint(AppColors.goldInk),
            ),
          ),
        ],
      ],
    );
  }
}
