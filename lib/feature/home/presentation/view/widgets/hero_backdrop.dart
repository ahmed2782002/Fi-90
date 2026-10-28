import 'dart:math' as math;

import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_background/tiled_svg.dart';
import 'package:fii90/core/widgets/dashed_ring/dashed_ring_painter.dart';
import 'package:flutter/material.dart';

class HeroBackdrop extends StatelessWidget {
  const HeroBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PositionedDirectional(
          top: -40,
          end: -80,
          child: Opacity(
            opacity: .16,
            child: Loop(
              period: const Duration(seconds: 40),
              builder: (context, t, child) =>
                  Transform.rotate(angle: t * 2 * math.pi, child: child),
              child: CustomPaint(
                size: const Size.square(260),
                painter: DashedRingPainter(
                  width: 16,
                  color: AppColors.tint(AppColors.white, .9),
                ),
              ),
            ),
          ),
        ),
        const Positioned.fill(
          child: TiledSvg(asset: AppImages.heroSparkles, opacity: .14),
        ),
        PositionedDirectional(
          top: 34,
          end: 10,
          child: Text('90', style: AppText.heroWatermark),
        ),
      ],
    );
  }
}
