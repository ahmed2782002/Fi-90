import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/gradients.dart';

class StageGlow extends StatelessWidget {
  const StageGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(44),
                gradient: AppGradients.fade(AppColors.cy,
                    x: .5, y: .45, rx: .7, ry: .55, alpha: .18, end: .72),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 6,
            height: 46,
            child: FractionallySizedBox(
              widthFactor: .84,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: AppGradients.closestSide([
                    AppColors.tint(AppColors.cy, .3),
                    AppColors.tint(AppColors.cy, 0),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
