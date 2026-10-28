import 'dart:math' as math;

import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/dashed_ring/dashed_ring_painter.dart';
import 'package:flutter/material.dart';

class SearchRadar extends StatelessWidget {
  const SearchRadar({super.key, required this.initial, required this.found});

  final String initial;
  final bool found;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!found)
            for (final delay in [0, 1200])
              Loop(
                period: const Duration(milliseconds: 2400),
                delay: Duration(milliseconds: delay),
                hideUntilStart: true,
                builder: (context, t, child) => Transform.scale(
                  scale: .55 + 1.65 * t,
                  child: Opacity(opacity: .7 * (1 - t), child: child),
                ),
                child: Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.tint(AppColors.me, .5),
                      width: 2,
                    ),
                  ),
                ),
              ),
          CustomPaint(
            size: const Size.square(250),
            painter: found
                ? DashedRingPainter(
                    width: 13.5,
                    color: AppColors.me,
                    rest: AppColors.op,
                    progress: .5,
                  )
                : DashedRingPainter(width: 13.5, color: AppColors.s3),
          ),
          if (!found)
            Loop(
              period: const Duration(milliseconds: 1800),
              builder: (context, t, child) =>
                  Transform.rotate(angle: t * 2 * math.pi, child: child),
              child: CustomPaint(
                size: const Size.square(250),
                painter: DashedRingPainter(
                  width: 13.5,
                  color: AppColors.me,
                  progress: .3,
                ),
              ),
            ),
          Container(
            width: 104,
            height: 104,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.me,
              borderRadius: BorderRadius.circular(32),
              boxShadow: AppShadows.sh2,
            ),
            child: Text(initial, style: AppText.bigInitial(42, AppColors.meOn)),
          ),
        ],
      ),
    );
  }
}
