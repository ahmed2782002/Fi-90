import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../animation/loop.dart';
import '../../theme/app_colors.dart';

class SpinRing extends StatelessWidget {
  const SpinRing({
    super.key,
    required this.size,
    required this.color,
    this.width = 3,
  });

  final double size;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Loop(
      period: const Duration(milliseconds: 800),
      builder: (context, t, child) =>
          Transform.rotate(angle: t * 2 * math.pi, child: child),
      child: CustomPaint(
        size: Size.square(size),
        painter: _RingPainter(color: color, width: width),
      ),
    );
  }
}

// Flutter can't paint a circular Border with mixed side colors, so the
// track and the highlighted top quarter are drawn as arcs instead.
class _RingPainter extends CustomPainter {
  const _RingPainter({required this.color, required this.width});

  final Color color;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      width / 2,
      width / 2,
      size.width - width,
      size.height - width,
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    canvas.drawArc(rect, 0, 2 * math.pi, false, paint..color = AppColors.s3);
    canvas.drawArc(
      rect,
      -3 * math.pi / 4,
      math.pi / 2,
      false,
      paint..color = color,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.color != color || old.width != width;
}
