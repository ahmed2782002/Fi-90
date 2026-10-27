import 'dart:math' as math;

import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/top_gloss.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.name,
    required this.initial,
    required this.level,
    required this.color,
    required this.onColor,
    required this.angle,
  });

  final String name;
  final String initial;
  final String level;
  final Color color;
  final Color onColor;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * math.pi / 180,
      child: Container(
        width: 132,
        height: 186,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: color, width: 1.5),
          gradient: LinearGradient(
            begin: const Alignment(-.17, -.98),
            end: const Alignment(.17, .98),
            colors: [AppColors.mix(color, .3, AppColors.s1), AppColors.s1],
            stops: const [0, .7],
          ),
          boxShadow: [
            BoxShadow(color: AppColors.tint(color, .35), blurRadius: 22),
            ...AppShadows.sh2,
          ],
        ),
        child: Stack(
          children: [
            const TopGloss(fraction: .5, alpha: .12),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.tint(color, .4),
                          offset: const Offset(0, 8),
                          blurRadius: 18,
                        ),
                      ],
                    ),
                    child: Text(initial,
                        style: AppText.cardInitial.copyWith(color: onColor)),
                  ),
                  const SizedBox(height: 8),
                  Text(name, style: AppText.cardName),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.s2,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(level, style: AppText.tag),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
