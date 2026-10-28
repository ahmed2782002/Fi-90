import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/final_result/presentation/view/widgets/final_score_card.dart';
import 'package:fii90/feature/final_result/presentation/view/widgets/round_summary_row.dart';
import 'package:fii90/feature/final_result/presentation/view/widgets/xp_card.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinalResultScreen extends StatelessWidget {
  const FinalResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MatchCubit>();
    final state = cubit.state;
    final me = context.tr(AppStrings.mockPlayerAhmed);
    final opp = context.tr(cubit.oppNameKey);
    final glow = cubit.won
        ? AppColors.gold
        : cubit.lost
        ? AppColors.bad
        : AppColors.pri;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppGradients.fade(
          glow,
          x: .5,
          y: .12,
          rx: .8,
          ry: .35,
          alpha: .24,
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 21, 18, 40),
          children: [
            Text(
              'FULL TIME',
              textAlign: TextAlign.center,
              style: AppText.fullTime,
            ),
            const SizedBox(height: 4),
            Enter(
              fx: Fx.pop,
              child: Text(
                context.tr(
                  cubit.won
                      ? AppStrings.matchWin
                      : cubit.lost
                      ? AppStrings.matchLoss
                      : AppStrings.matchDraw,
                ),
                textAlign: TextAlign.center,
                style: AppText.display(
                  48,
                  color: cubit.won
                      ? AppColors.goldInk
                      : cubit.lost
                      ? AppColors.badInk
                      : AppColors.tx2,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              context.tr(
                cubit.won
                    ? AppStrings.matchWinHint
                    : cubit.lost
                    ? AppStrings.matchLossHint
                    : AppStrings.matchDrawHint,
              ),
              textAlign: TextAlign.center,
              style: AppText.detailLine,
            ),
            const SizedBox(height: 14),
            FinalScoreCard(
              meName: me,
              meScore: state.meScore,
              oppName: opp,
              oppInitial: cubit.initialOf(opp),
              oppScore: state.oppScore,
            ),
            const SizedBox(height: 14),
            XpCard(
              title: context.tr(AppStrings.experience),
              xp: cubit.earnedXp,
              progress: ((1240 + cubit.earnedXp) / 1500).clamp(0, 1),
              rankLine: context.tr(AppStrings.rankLine),
              coins: cubit.won ? 10 : null,
            ),
            for (final r in state.rounds) ...[
              const SizedBox(height: 6),
              RoundSummaryRow(
                mode: context.tr(r.mode.nameKey),
                accent: r.mode.accent,
                detail: context.tr(
                  r.detailKey,
                  args: r.translateArgs
                      ? [for (final a in r.detailArgs) context.tr(a)]
                      : r.detailArgs,
                ),
                winner: r.winner == null
                    ? '—'
                    : r.winner == MatchSide.me
                    ? me
                    : opp,
                winnerColor: r.winner?.ink ?? AppColors.mu,
                points: r.winner == null ? '0' : '+${r.points}',
              ),
            ],
            const SizedBox(height: 18),
            PrimaryButton(
              label: context.tr(AppStrings.rematch),
              onTap: cubit.rematch,
            ),
            const SizedBox(height: 10),
            PressScale(
              onTap: cubit.cancel,
              child: Container(
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.s1,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.line2),
                ),
                child: Text(
                  context.tr(AppStrings.navHome),
                  style: AppText.secondaryButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
