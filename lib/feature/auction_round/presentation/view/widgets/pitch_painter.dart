import 'package:flutter/material.dart';

class PitchPainter extends CustomPainter {
  const PitchPainter({
    required this.stripe,
    required this.alt,
    required this.line,
  });

  final Color stripe;
  final Color alt;
  final Color line;

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint();
    for (var y = 0.0, i = 0; y < size.height; y += 38, i++) {
      fill.color = i.isEven ? stripe : alt;
      canvas.drawRect(Rect.fromLTWH(0, y, size.width, 38), fill);
    }
    final stroke = Paint()
      ..color = line
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final field = Rect.fromLTRB(8, 8, size.width - 8, size.height - 8);
    canvas.drawRRect(
      RRect.fromRectAndRadius(field, const Radius.circular(22)),
      stroke,
    );
    canvas.drawLine(
      Offset(8, size.height / 2),
      Offset(size.width - 8, size.height / 2),
      stroke,
    );
    canvas.drawCircle(size.center(Offset.zero), 35, stroke);
    final boxW = size.width * .48;
    final left = (size.width - boxW) / 2;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(left, 8, boxW, 44),
        bottomLeft: const Radius.circular(10),
        bottomRight: const Radius.circular(10),
      ),
      stroke,
    );
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(left, size.height - 52, boxW, 44),
        topLeft: const Radius.circular(10),
        topRight: const Radius.circular(10),
      ),
      stroke,
    );
  }

  @override
  bool shouldRepaint(PitchPainter old) =>
      old.stripe != stripe || old.line != line;
}
