import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class LogoInsetPainter extends CustomPainter {
  LogoInsetPainter({
    required this.radius,
    required this.topLight,
    required this.bottomBlur,
  });

  final double radius;
  final double topLight;
  final double bottomBlur;

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    canvas.save();
    canvas.clipRRect(rrect);

    final outer = Path()..addRect((Offset.zero & size).inflate(bottomBlur * 3));

    final lip = Path.combine(
      PathOperation.difference,
      outer,
      Path()..addRRect(rrect.shift(Offset(0, topLight))),
    );
    canvas.drawPath(
      lip,
      Paint()..color = AppColors.white.withValues(alpha: .38),
    );

    final shade = Path.combine(
      PathOperation.difference,
      outer,
      Path()..addRRect(rrect.shift(Offset(0, -bottomBlur / 2))),
    );
    canvas.drawPath(
      shade,
      Paint()
        ..color = AppColors.insetShade.withValues(alpha: .5)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, bottomBlur / 2),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(LogoInsetPainter old) => false;
}
