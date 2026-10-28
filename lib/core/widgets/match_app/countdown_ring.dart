import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../dashed_ring/dashed_ring_painter.dart';

class CountdownRing extends StatelessWidget {
  const CountdownRing({
    super.key,
    required this.size,
    required this.width,
    required this.progress,
    required this.color,
    required this.child,
    this.rest,
  });

  final double size;
  final double width;
  final double progress;
  final Color color;
  final Color? rest;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: DashedRingPainter(
          width: width,
          color: color,
          rest: rest ?? AppColors.s3,
          progress: progress.clamp(0, 1),
        ),
        child: Center(child: child),
      ),
    );
  }
}
