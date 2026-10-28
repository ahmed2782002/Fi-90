import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/match_app/points_badge.dart';
import 'package:flutter/material.dart';

class TriviaEndOverlay extends StatelessWidget {
  const TriviaEndOverlay({
    super.key,
    required this.knockedOut,
    required this.loser,
    this.winner,
    this.winnerColor,
  });

  final bool knockedOut;
  final String loser;
  final String? winner;
  final Color? winnerColor;

  @override
  Widget build(BuildContext context) {
    final name = winner;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.bg,
        gradient: knockedOut
            ? AppGradients.ellipse(
                x: .5,
                y: .42,
                rx: .7,
                ry: .45,
                colors: [
                  AppColors.mix(AppColors.bad, .22, AppColors.bg),
                  AppColors.bg,
                ],
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (knockedOut) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < 3; i++)
                  Enter(
                    fx: Fx.pop,
                    delay: Duration(milliseconds: i * 120),
                    child: Container(
                      width: 46,
                      height: 46,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.bad,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '✕',
                        style: AppText.feedbackMark(AppColors.white),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(context.tr(AppStrings.threeStrikes), style: AppText.knockout),
            const SizedBox(height: 12),
            Text(
              context.tr(AppStrings.leftTheQuestion, args: [loser]),
              style: AppText.cardHeading,
            ),
          ] else
            Text(
              context.tr(AppStrings.allAnswersUsed),
              textAlign: TextAlign.center,
              style: AppText.exhaustedTitle,
            ),
          const SizedBox(height: 12),
          if (name != null) ...[
            Text(
              context.tr(
                knockedOut
                    ? AppStrings.wonTheRound
                    : AppStrings.wonFewerStrikes,
                args: [name],
              ),
              style: AppText.feedbackTitle(winnerColor ?? AppColors.tx, 16),
            ),
            const SizedBox(height: 12),
            const PointsBadge(label: '+20'),
          ] else
            Text(context.tr(AppStrings.drawNoPoints), style: AppText.pageIntro),
        ],
      ),
    );
  }
}
