import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class FullTimeCard extends StatelessWidget {
  const FullTimeCard({
    super.key,
    required this.winner,
    required this.color,
    required this.points,
    required this.penalties,
  });

  final String winner;
  final Color color;
  final int points;
  final bool penalties;

  @override
  Widget build(BuildContext context) {
    return Enter(
      fx: Fx.pop,
      duration: const Duration(milliseconds: 400),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: color, width: 1.5),
          boxShadow: AppShadows.sh1,
        ),
        child: Column(
          children: [
            Text(
              context.tr(AppStrings.wonTheMatch, args: [winner]),
              textAlign: TextAlign.center,
              style: AppText.fullTimeWinner(color),
            ),
            const SizedBox(height: 8),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.skewX(-.1763),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: AppColors.stk, spreadRadius: 2)],
                ),
                child: Text(
                  '+$points',
                  textDirection: TextDirection.ltr,
                  style: AppText.fullTimePoints,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.tr(
                penalties
                    ? AppStrings.decidedOnPenalties
                    : AppStrings.aiCalculatedResult,
              ),
              textAlign: TextAlign.center,
              style: AppText.caption,
            ),
          ],
        ),
      ),
    );
  }
}
