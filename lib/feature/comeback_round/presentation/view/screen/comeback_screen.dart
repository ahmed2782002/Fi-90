import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/match_app/answer_input.dart';
import 'package:fii90/core/widgets/match_app/spin_ring.dart';
import 'package:fii90/feature/comeback_round/presentation/view/widgets/club_timeline.dart';
import 'package:fii90/feature/comeback_round/presentation/view/widgets/comeback_done_overlay.dart';
import 'package:fii90/feature/comeback_round/presentation/view/widgets/comeback_header.dart';
import 'package:fii90/feature/comeback_round/presentation/view/widgets/guess_chips.dart';
import 'package:fii90/feature/comeback_round/presentation/view_model/comeback_cubit.dart';
import 'package:fii90/feature/comeback_round/presentation/view_model/comeback_state.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view/widgets/round_frame.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComebackScreen extends StatelessWidget {
  const ComebackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final match = context.read<MatchCubit>();
    final m = match.state;
    return BlocProvider(
      create: (_) => ComebackCubit(
        question: m.question,
        skill: match.skill,
        oppKey: match.oppNameKey,
        meScore: m.meScore,
        oppScore: m.oppScore,
      ),
      child: BlocConsumer<ComebackCubit, ComebackState>(
        listener: (context, state) {
          final toast = state.toast, score = state.score, done = state.finished;
          if (toast != null) AppToast.show(context, toast);
          if (score != null) match.addScore(score.side, score.points);
          if (done != null) {
            match.finishQuestion(
              done.winner,
              done.points,
              done.detailKey,
              args: done.args,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ComebackCubit>();
          final me = context.tr(AppStrings.mockPlayerAhmed);
          final opp = context.tr(match.oppNameKey);
          final result = state.result;
          final winner = result?.winner;
          return RoundFrame(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ComebackHeader(
                        progress: '${m.question + 1}/${m.mode.questions}',
                        points: cubit.points,
                        nextClub: cubit.nextClubProgress,
                        secondsLeft: cubit.secondsLeft,
                        playing: !state.done,
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ClubTimeline(
                          question: cubit.question,
                          revealed: state.done
                              ? cubit.question.clubs.length
                              : state.revealed,
                          done: state.done,
                        ),
                      ),
                      if (state.guesses.isNotEmpty) ...[
                        const SizedBox(height: 10),
                        GuessChips(
                          guesses: [
                            for (final g in state.guesses)
                              (text: g.text, color: g.side.fill),
                          ],
                        ),
                      ],
                      const SizedBox(height: 10),
                      if (cubit.canType)
                        AnswerInput(
                          controller: cubit.input,
                          hint: context.tr(AppStrings.knowHimHint),
                          sendLabel: context.tr(AppStrings.send),
                          onSend: cubit.submit,
                          accent: AppColors.m4,
                          solidButton: AppColors.m4,
                        ),
                      if (state.verifying != null)
                        Row(
                          children: [
                            const SpinRing(
                              size: 14,
                              color: AppColors.m4Glow,
                              width: 2,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              context.tr(AppStrings.verifying),
                              style: AppText.statusLine,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                if (state.done && result != null)
                  Positioned.fill(
                    child: ComebackDoneOverlay(
                      player: cubit.question.name.of(context),
                      meta: context.tr(
                        AppStrings.stations,
                        args: [
                          cubit.question.meta.of(context),
                          '${cubit.question.clubs.length}',
                        ],
                      ),
                      revealed: state.revealed,
                      points: result.points,
                      flip: result.flip,
                      winner: winner == null
                          ? null
                          : winner == MatchSide.me
                          ? me
                          : opp,
                      winnerColor: winner?.ink,
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
