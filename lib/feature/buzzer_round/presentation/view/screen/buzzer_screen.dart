import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/feature/buzzer_round/presentation/view/widgets/buzzer_answer_zone.dart';
import 'package:fii90/feature/buzzer_round/presentation/view/widgets/buzzer_bell_zone.dart';
import 'package:fii90/feature/buzzer_round/presentation/view/widgets/buzzer_question_card.dart';
import 'package:fii90/feature/buzzer_round/presentation/view/widgets/buzzer_result.dart';
import 'package:fii90/feature/buzzer_round/presentation/view_model/buzzer_cubit.dart';
import 'package:fii90/feature/buzzer_round/presentation/view_model/buzzer_state.dart';
import 'package:fii90/feature/match/presentation/view/widgets/round_frame.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuzzerScreen extends StatelessWidget {
  const BuzzerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final match = context.read<MatchCubit>();
    return BlocProvider(
      create: (_) => BuzzerCubit(
        question: match.state.question,
        skill: match.skill,
        oppKey: match.oppNameKey,
      ),
      child: BlocConsumer<BuzzerCubit, BuzzerState>(
        listener: (context, state) {
          final toast = state.toast, score = state.score, done = state.finished;
          if (toast != null) AppToast.show(context, toast);
          if (score != null) match.addScore(score.side, score.points);
          if (done != null) {
            match.finishQuestion(
              done.winner,
              done.winner == null ? 0 : 15,
              done.detailKey,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<BuzzerCubit>();
          final me = context.tr(AppStrings.mockPlayerAhmed);
          final opp = context.tr(match.oppNameKey);
          final reveal = cubit.question.reveal.of(context);
          final phase = state.phase;
          final (statusKey, statusColor) = cubit.status;
          final out = cubit.outcome;
          final sub = out.sub;
          return RoundFrame(
            turn: cubit.turn,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppGradients.fade(
                  AppColors.m3,
                  x: .5,
                  y: .66,
                  rx: .7,
                  ry: .45,
                  alpha: .12,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BuzzerQuestionCard(
                      progress:
                          '${match.state.question + 1}/${match.state.mode.questions}',
                      question: cubit.question.text.of(context),
                      countdown: phase == BuzzerPhase.ready
                          ? state.count
                          : null,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 32,
                      child: Text(
                        statusKey.isEmpty
                            ? ''
                            : context.tr(statusKey, args: [opp]),
                        textAlign: TextAlign.center,
                        style: AppText.bellStatus(statusColor),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: phase.bellZone
                          ? BuzzerBellZone(
                              phase: phase,
                              opponent: opp,
                              seconds: state.seconds,
                              gap: state.gap,
                              onPress: cubit.press,
                            )
                          : phase.answerZone
                          ? SingleChildScrollView(
                              child: BuzzerAnswerZone(
                                controller: cubit.input,
                                seconds: state.answerSeconds,
                                onSend: cubit.submit,
                                verifying: phase == BuzzerPhase.verify,
                                reboundFrom: state.rebound ? opp : null,
                              ),
                            )
                          : BuzzerResult(
                              mark: out.mark,
                              title: context.tr(out.title, args: [opp]),
                              subtitle: sub == null
                                  ? ''
                                  : context.tr(
                                      sub,
                                      args: cubit.outcomeArgs(me, opp, reveal),
                                    ),
                              color: out.color,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
