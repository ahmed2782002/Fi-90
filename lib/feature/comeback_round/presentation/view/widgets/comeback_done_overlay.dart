import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/match_app/points_badge.dart';
import 'package:flutter/material.dart';

class ComebackDoneOverlay extends StatelessWidget {
  const ComebackDoneOverlay({
    super.key,
    required this.player,
    required this.meta,
    required this.revealed,
    required this.points,
    required this.flip,
    this.winner,
    this.winnerColor,
  });

  final String player;
  final String meta;
  final int revealed;
  final int points;
  final bool flip;
  final String? winner;
  final Color? winnerColor;

  @override
  Widget build(BuildContext context) {
    final who = winner;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.bg,
        gradient: AppGradients.ellipse(
          x: .5,
          y: .38,
          rx: .6,
          ry: .4,
          colors: [
            AppColors.mix(AppColors.m4, .28, AppColors.bg),
            AppColors.bg,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Enter(
            fx: Fx.pop,
            duration: const Duration(milliseconds: 600),
            child: Container(
              width: 128,
              height: 128,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.s1,
                borderRadius: BorderRadius.circular(42),
                border: Border.all(color: AppColors.m4, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.tint(AppColors.m4, .4),
                    blurRadius: 60,
                  ),
                ],
              ),
              child: Text(
                player.characters.first,
                style: AppText.bigInitial(52, AppColors.m4Ink),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(player, textAlign: TextAlign.center, style: AppText.display(32)),
          const SizedBox(height: 12),
          Text(meta, style: AppText.detailLine),
          const SizedBox(height: 12),
          if (who != null) ...[
            Text(
              context.tr(AppStrings.knewFromWho, args: [who, '$revealed']),
              style: AppText.feedbackTitle(winnerColor ?? AppColors.tx, 16),
            ),
            const SizedBox(height: 12),
            PointsBadge(label: '+$points'),
            const SizedBox(height: 12),
            flip
                ? Enter(
                    fx: Fx.pop,
                    delay: const Duration(milliseconds: 500),
                    child: Text(
                      context.tr(AppStrings.flippedMatch),
                      style: AppText.display(26),
                    ),
                  )
                : Text(
                    context.tr(AppStrings.comebackNoFlip),
                    style: AppText.pageIntro,
                  ),
          ] else
            Text(
              context.tr(AppStrings.comebackLost),
              style: AppText.feedbackTitle(AppColors.badInk, 21),
            ),
        ],
      ),
    );
  }
}
