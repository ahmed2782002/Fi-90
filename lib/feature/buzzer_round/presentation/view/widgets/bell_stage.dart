import 'dart:math' as math;

import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:flutter/material.dart';

class BellStage extends StatelessWidget {
  const BellStage({
    super.key,
    required this.label,
    required this.labelColor,
    required this.labelInk,
    required this.glow,
    required this.live,
    required this.pressed,
    required this.dimmed,
    required this.onPress,
    required this.semanticLabel,
  });

  final String label;
  final Color labelColor;
  final Color labelInk;
  final Color glow;
  final bool live;
  final bool pressed;
  final bool dimmed;
  final VoidCallback onPress;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final bell = AnimatedScale(
      scale: pressed ? .95 : 1,
      alignment: Alignment.bottomCenter,
      duration: const Duration(milliseconds: 120),
      child: ColorFiltered(
        colorFilter: ColorFilter.matrix(
          dimmed ? AppColors.dimMatrix : AppColors.identityMatrix,
        ),
        child: Image.asset(AppImages.bell3d, width: 236),
      ),
    );
    return SizedBox(
      width: 320,
      height: 300,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 10,
            width: 300,
            height: 250,
            child: Opacity(
              opacity: .55,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: AppGradients.closestSide([
                    glow,
                    AppColors.tint(glow, 0),
                  ]),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 6,
            height: 86,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppColors.tableBase,
                borderRadius: const BorderRadius.all(
                  Radius.elliptical(150, 43),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 18,
            height: 80,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppColors.tableTop,
                borderRadius: const BorderRadius.all(
                  Radius.elliptical(150, 40),
                ),
                border: Border.all(color: AppColors.neon, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.tint(AppColors.neon, .35),
                    blurRadius: 18,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Semantics(
              button: true,
              label: semanticLabel,
              child: GestureDetector(
                onTap: onPress,
                child: live
                    ? Loop(
                        period: const Duration(milliseconds: 1600),
                        builder: (context, t, child) => Transform.rotate(
                          angle: t < .32
                              ? math.sin(t / .32 * math.pi * 2) * .035
                              : 0,
                          alignment: Alignment.bottomCenter,
                          child: child,
                        ),
                        child: bell,
                      )
                    : bell,
              ),
            ),
          ),
          Positioned(
            bottom: -2,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: labelColor,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(label, style: AppText.bellLabel(labelInk)),
            ),
          ),
        ],
      ),
    );
  }
}
