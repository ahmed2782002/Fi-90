import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class LogoFacePainter extends CustomPainter {
  LogoFacePainter({
    required this.nineStyle,
    required this.nineOpacity,
    required this.nineDy,
  });

  final TextStyle nineStyle;
  final double nineOpacity;
  final double nineDy;

  static const _gridArea = Rect.fromLTWH(0, 6, 49, 50);
  static const _topBar = Rect.fromLTWH(3, 6, 49, 2.8);
  static const _rightBar = Rect.fromLTWH(49, 6, 2.8, 49);
  static const _barRadius = Radius.circular(1.4);

  @override
  void paint(Canvas canvas, Size size) {
    _paintGrid(canvas);
    _paintFrame(canvas);
    if (nineOpacity > 0) _paintNine(canvas);
  }

  void _paintGrid(Canvas canvas) {
    canvas.saveLayer(_gridArea, Paint());
    canvas.clipRect(_gridArea);
    final line = Paint()
      ..color = AppColors.logoGrid.withValues(alpha: .8)
      ..strokeWidth = .4;
    const step = 3.2 * math.sqrt2;
    for (double k = -60; k < 120; k += step) {
      canvas.drawLine(Offset(k, 0), Offset(k + 70, 70), line);
      canvas.drawLine(Offset(k, 0), Offset(k - 70, 70), line);
    }
    canvas.drawRect(
      _gridArea,
      Paint()
        ..blendMode = BlendMode.dstIn
        ..shader = RadialGradient(
          center: Alignment.topRight,
          radius: 1,
          colors: [AppColors.white, AppColors.white.withValues(alpha: 0)],
          stops: const [0, .85],
        ).createShader(_gridArea),
    );
    canvas.restore();
  }

  void _paintFrame(Canvas canvas) {
    final shade = Paint()..color = AppColors.logoInk.withValues(alpha: .5);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(4.6, 7, 45.4, 2.8),
        _barRadius,
      ),
      shade,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(49.7, 7, 2.8, 49),
        _barRadius,
      ),
      shade,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(_topBar, _barRadius),
      Paint()
        ..shader = LinearGradient(
          colors: [AppColors.white.withValues(alpha: 0), AppColors.white],
          stops: const [0, .45],
        ).createShader(_topBar),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(_rightBar, _barRadius),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white, AppColors.white.withValues(alpha: 0)],
          stops: const [.45, 1],
        ).createShader(_rightBar),
    );
  }

  void _paintNine(Canvas canvas) {
    canvas.saveLayer(
      null,
      Paint()..color = Color.fromRGBO(0, 0, 0, nineOpacity),
    );
    canvas.translate(0, nineDy);
    _drawNine(canvas, 19.4, 54.6, nineStyle.copyWith(color: AppColors.logoInk));
    _drawNine(canvas, 18.7, 53.7, nineStyle.copyWith(color: AppColors.priD));
    _drawNine(
      canvas,
      18,
      52.8,
      nineStyle.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = .5
          ..color = AppColors.stk,
      ),
    );
    _drawNine(
      canvas,
      18,
      52.8,
      nineStyle.copyWith(
        foreground: Paint()
          ..shader = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.white, AppColors.paleBlue],
          ).createShader(const Rect.fromLTWH(0, 24, 40, 30)),
      ),
    );
    canvas.restore();
  }

  void _drawNine(Canvas canvas, double cx, double baseline, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: '9', style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    final ascent = tp.computeDistanceToActualBaseline(TextBaseline.alphabetic);
    tp.paint(canvas, Offset(cx - tp.width / 2, baseline - ascent));
  }

  @override
  bool shouldRepaint(LogoFacePainter old) =>
      old.nineOpacity != nineOpacity || old.nineDy != nineDy;
}
