import 'dart:math' as math;

import 'package:flutter/material.dart';

class DashedRingPainter extends CustomPainter {
  const DashedRingPainter({
    required this.width,
    required this.color,
    this.rest,
    this.progress = 1,
    this.dash = 8,
    this.gap = 4,
  });

  final double width;
  final Color color;
  final Color? rest;
  final double progress;
  final double dash;
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: size.shortestSide / 2 - width / 2,
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final step = dash + gap;
    for (var deg = 0.0; deg < 360; deg += step) {
      final on = deg / 360 < progress;
      if (!on && rest == null) continue;
      paint.color = on ? color : rest!;
      canvas.drawArc(
        rect,
        (deg - 90) * math.pi / 180,
        dash * math.pi / 180,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(DashedRingPainter old) =>
      old.progress != progress || old.color != color || old.rest != rest;
}
