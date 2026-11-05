import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view/widgets/round_frame.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/trivia_board_section.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/my_answer_bar.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/opponent_turn_bar.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/strikes_header.dart';
import 'package:fii90/feature/trivia_round/presentation/view/widgets/trivia_end_overlay.dart';
import 'package:fii90/feature/trivia_round/presentation/view_model/trivia_cubit.dart';
import 'package:fii90/feature/trivia_round/presentation/view_model/trivia_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TriviaScreen extends StatelessWidget {
  const TriviaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final match = context.read<MatchCubit>();
    return BlocProvider(
      create: (_) => TriviaCubit(
        question: match.trivia[match.state.question],
        skill: match.skill,
        oppKey: match.oppNameKey,
      ),
      child: BlocConsumer<TriviaCubit, TriviaState>(
        listener: (context, state) {
          final toast = state.toast, score = state.score, done = state.finished;
          if (toast != null) AppToast.show(context, toast);
          if (score != null) match.addScore(score.side, score.points);
          if (done != null) {
            match.finishQuestion(
              done.winner,
              done.winner == null ? 0 : 20,
              done.detailKey,
              args: done.args,
              translateArgs: true,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<TriviaCubit>();
          final me = context.tr(AppStrings.mockPlayerAhmed);
          final opp = context.tr(match.oppNameKey);
          final fb = state.feedback;
          final over = state.phase == TriviaPhase.over;
          return RoundFrame(
            turn: cubit.turn,
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, _) {
                    // Scaffold strips viewInsets from the body's MediaQuery,
                    // so read the keyboard height from the View directly.
                    final keyboard = View.of(context).viewInsets.bottom > 0;
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                        16.w,
                        4.h,
                        16.w,
                        keyboard ? 8.h : 28.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Same child count in both modes so the answer field
                          // keeps its state (and focus) when the keyboard opens.
                          if (keyboard)
                            const SizedBox.shrink()
                          else
                            StrikesHeader(
                              meStrikes: state.strikes[MatchSide.me]!,
                              oppStrikes: state.strikes[MatchSide.opp]!,
                              mePass: (
                                used: state.passUsed.contains(MatchSide.me),
                                ready: state.passReady(MatchSide.me),
                              ),
                              oppPass: (
                                used: state.passUsed.contains(MatchSide.opp),
                                ready: state.passReady(MatchSide.opp),
                              ),
                              question: match.state.question,
                            ),
                          SizedBox(height: keyboard ? 0 : 12.h),
                          Expanded(
                            child: TriviaBoardSection(
                              question: match.state.question,
                              total: match.state.mode.questions,
                              compact: keyboard,
                            ),
                          ),
                          if (cubit.myTurn) ...[
                            SizedBox(height: 12.h),
                            MyAnswerBar(
                              controller: cubit.input,
                              onSend: cubit.submit,
                              onPass: cubit.pass,
                              block: cubit.passBlock(MatchSide.me),
                              strikes: state.strikes[MatchSide.me]!,
                            ),
                          ] else if (cubit.oppTurn) ...[
                            SizedBox(height: 12.h),
                            OpponentTurnBar(
                              title: context.tr(
                                AppStrings.oppTurnOf,
                                args: [opp],
                              ),
                              initial: match.initialOf(opp),
                              status: context.tr(
                                state.typing
                                    ? AppStrings.typing
                                    : AppStrings.thinking,
                              ),
                              typing: state.typing,
                              waitLabel: context.tr(AppStrings.waitYourTurn),
                              note: state.lastPassBy == MatchSide.me
                                  ? context.tr(AppStrings.youPassedHeMust)
                                  : null,
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
                if (over && fb != null)
                  Positioned.fill(
                    child: TriviaEndOverlay(
                      knockedOut: fb.kind == FeedbackKind.out,
                      loser: fb.who == MatchSide.me ? me : opp,
                      winner: fb.winner == null
                          ? null
                          : fb.winner == MatchSide.me
                          ? me
                          : opp,
                      winnerColor: fb.winner?.ink ?? AppColors.mu,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
