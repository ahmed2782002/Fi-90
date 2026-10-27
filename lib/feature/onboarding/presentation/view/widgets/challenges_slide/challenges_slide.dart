import 'dart:math' as math;

import 'package:fii90/core/animation/app_curves.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/stage_app/dot.dart';
import 'package:fii90/core/widgets/stage_app/info_chip.dart';
import 'package:fii90/core/widgets/stage_app/stage_glow.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/challenges_slide/mode_card.dart';
import 'package:flutter/material.dart';

class ChallengesSlide extends StatelessWidget {
  const ChallengesSlide({super.key});

  static const _cards = [
    (n: '4', icon: AppIcons.swap, color: AppColors.m4, ink: AppColors.m4Ink, dx: -134.0, top: 34.0, deg: -12.0, delay: 350),
    (n: '3', icon: AppIcons.bell, color: AppColors.m3, ink: AppColors.m3Ink, dx: -79.0, top: 8.0, deg: -4.0, delay: 260),
    (n: '2', icon: AppIcons.gavel, color: AppColors.gold, ink: AppColors.goldInk, dx: -25.0, top: 8.0, deg: 4.0, delay: 170),
    (n: '1', icon: AppIcons.brain, color: AppColors.cy, ink: AppColors.priInk, dx: 30.0, top: 34.0, deg: 12.0, delay: 80),
  ];

  static const _chips = [
    (label: 'ماذا تعرف؟', color: AppColors.cy, delay: 500),
    (label: 'المزاد', color: AppColors.gold, delay: 580),
    (label: 'الجرس', color: AppColors.m3, delay: 660),
    (label: 'التعويض', color: AppColors.m4, delay: 740),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) => Stack(
        children: [
          const Positioned.fill(child: StageGlow()),
          for (final c in _cards)
            Positioned(
              left: box.maxWidth / 2 + c.dx,
              top: c.top,
              child: Enter(
                fx: Fx.riseIn,
                duration: const Duration(milliseconds: 600),
                delay: Duration(milliseconds: c.delay),
                curve: AppCurves.spring,
                child: Transform.rotate(
                  angle: c.deg * math.pi / 180,
                  alignment: const Alignment(0, 1.4),
                  child: ModeCard(number: c.n, icon: c.icon, color: c.color, ink: c.ink),
                ),
              ),
            ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 14,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final c in _chips)
                  Enter(
                    fx: Fx.pop,
                    duration: const Duration(milliseconds: 400),
                    delay: Duration(milliseconds: c.delay),
                    child: InfoChip(
                      label: c.label,
                      leading: Dot(c.color),
                      style: AppText.chip,
                      border: c.color,
                      borderWidth: 1.5,
                      glow: c.color,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
