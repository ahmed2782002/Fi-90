import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/match_app/points_badge.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:fii90/feature/round_result/presentation/view/widgets/round_progress.dart';
import 'package:fii90/feature/round_result/presentation/view/widgets/round_scores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundResultScreen extends StatelessWidget {
  const RoundResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MatchCubit>();
    final state = context.watch<MatchCubit>().state;
    final result = state.rounds.last;
    final winner = result.winner;
    final me = context.tr(AppStrings.mockPlayerAhmed);
    final opp = context.tr(cubit.oppNameKey);
    final next = cubit.nextMode;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppGradients.fade(
          result.mode.accent,
          x: .5,
          y: .22,
          rx: .8,
          ry: .4,
          alpha: .2,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 19.h, 20.w, 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.tint(result.mode.accent, .16),
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                    child: Text(
                      context.tr(result.mode.nameKey),
                      style: AppText.modeTag(result.mode.ink),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    context.tr(
                      AppStrings.endOfRound,
                      args: ['${state.roundIndex + 1}'],
                    ),
                    style: AppText.meta,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (winner != null) ...[
                      Enter(
                        fx: Fx.pop,
                        child: Text(
                          context.tr(
                            AppStrings.wonTheRound,
                            args: [winner == MatchSide.me ? me : opp],
                          ),
                          textAlign: TextAlign.center,
                          style: AppText.display(32),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      PointsBadge(label: '+${result.points}', size: 24.r),
                    ] else
                      Text(
                        context.tr(AppStrings.noPointsRound),
                        style: AppText.noPoints,
                      ),
                    SizedBox(height: 8.h),
                    Text(
                      context.tr(
                        result.detailKey,
                        args: result.translateArgs
                            ? [for (final a in result.detailArgs) context.tr(a)]
                            : result.detailArgs,
                      ),
                      style: AppText.detailLine,
                    ),
                    SizedBox(height: 20.h),
                    RoundScores(
                      meName: me,
                      meScore: state.meScore,
                      oppName: opp,
                      oppInitial: cubit.initialOf(opp),
                      oppScore: state.oppScore,
                      aheadLabel: context.tr(AppStrings.ahead),
                    ),
                    SizedBox(height: 20.h),
                    RoundProgress(
                      modes: state.modes,
                      current: state.roundIndex,
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                label: next == null
                    ? context.tr(AppStrings.finalResult)
                    : context.tr(
                        AppStrings.nextRound,
                        args: [context.tr(next.nameKey)],
                      ),
                onTap: cubit.next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
