import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'fut_card_clipper.dart';

/// Decorative layer for [FutCard]: a light burst behind the player, a faint
/// diamond lattice, an engraved inner frame, filigree scrolls on the
/// shoulders, a jewelled divider under the name and a flourish at the tip.
///
/// Everything is drawn in the 252×373 design space and scaled to [size].
class FutCardOrnaments extends CustomPainter {
  const FutCardOrnaments({required this.ink, required this.accent});

  /// Main card ink (text colour of the palette).
  final Color ink;

  /// Brightest frame colour, used for highlights and jewels.
  final Color accent;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 252, size.height / 373);
    _burst(canvas);
    _lattice(canvas);
    _innerFrame(canvas);
    for (final mirror in [false, true]) {
      canvas.save();
      if (mirror) {
        canvas.translate(252, 0);
        canvas.scale(-1, 1);
      }
      _shoulderScroll(canvas);
      _sideFiligree(canvas);
      canvas.restore();
    }
    _divider(canvas, 286);
    _tipFlourish(canvas);
    canvas.restore();
  }

  Paint _stroke(double alpha, double width) => Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = width
    ..strokeCap = StrokeCap.round
    ..color = ink.withValues(alpha: alpha);

  void _burst(Canvas canvas) {
    const c = Offset(150, 130);
    final rays = Paint()
      ..shader = RadialGradient(
        colors: [accent.withValues(alpha: .28), accent.withValues(alpha: 0)],
      ).createShader(Rect.fromCircle(center: c, radius: 170));
    final path = Path();
    for (var i = 0; i < 28; i++) {
      final a = i * math.pi * 2 / 28;
      final b = a + math.pi / 56;
      path
        ..moveTo(c.dx, c.dy)
        ..lineTo(c.dx + 220 * math.cos(a), c.dy + 220 * math.sin(a))
        ..lineTo(c.dx + 220 * math.cos(b), c.dy + 220 * math.sin(b))
        ..close();
    }
    canvas.drawPath(path, rays);
    canvas.drawCircle(
      c,
      95,
      Paint()
        ..shader = RadialGradient(
          colors: [accent.withValues(alpha: .35), accent.withValues(alpha: 0)],
        ).createShader(Rect.fromCircle(center: c, radius: 95)),
    );
  }

  void _lattice(Canvas canvas) {
    final p = _stroke(.06, .7);
    for (var x = -373.0; x < 252; x += 18) {
      canvas.drawLine(Offset(x, 373), Offset(x + 373, 0), p);
      canvas.drawLine(Offset(x + 373, 373), Offset(x, 0), p);
    }
  }

  void _innerFrame(Canvas canvas) {
    final path = const FutCardClipper(inset: 9).getClip(const Size(252, 373));
    canvas.drawPath(path, _stroke(.45, 1.1));
    final inner = const FutCardClipper(inset: 12.5)
        .getClip(const Size(252, 373));
    canvas.drawPath(inner, _stroke(.18, .7));
  }

  /// Curling scroll on the left shoulder (mirrored for the right one).
  void _shoulderScroll(Canvas canvas) {
    final p = _stroke(.55, 1.4);
    final path = Path()
      ..moveTo(22, 58)
      ..cubicTo(30, 40, 52, 30, 74, 26)
      ..cubicTo(88, 24, 98, 18, 104, 10);
    canvas.drawPath(path, p);
    // Inner curl.
    final curl = Path()
      ..moveTo(44, 38)
      ..cubicTo(38, 30, 46, 22, 53, 27)
      ..cubicTo(58, 31, 54, 37, 49, 35);
    canvas.drawPath(curl, p);
    // Little leaves along the scroll.
    final leaf = Paint()..color = ink.withValues(alpha: .4);
    for (final (o, a) in [
      (const Offset(64, 29), -.5),
      (const Offset(84, 23), -.7),
      (const Offset(30, 50), -1.1),
    ]) {
      canvas.save();
      canvas.translate(o.dx, o.dy);
      canvas.rotate(a);
      canvas.drawPath(
        Path()
          ..moveTo(0, 0)
          ..quadraticBezierTo(4, -5, 9, 0)
          ..quadraticBezierTo(4, 5, 0, 0),
        leaf,
      );
      canvas.restore();
    }
    _jewel(canvas, const Offset(104, 10), 2.6);
  }

  /// Thin vertical filigree running down the card edge.
  void _sideFiligree(Canvas canvas) {
    final p = _stroke(.32, 1);
    final path = Path()..moveTo(17, 92);
    for (var y = 92.0; y < 300; y += 26) {
      path.cubicTo(23, y + 6, 23, y + 20, 17, y + 26);
    }
    canvas.drawPath(path, p);
    for (var y = 105.0; y < 300; y += 26) {
      canvas.drawCircle(Offset(21.5, y), 1.1, Paint()..color = p.color);
    }
  }

  void _divider(Canvas canvas, double y) {
    final p = _stroke(.6, 1.2);
    final glow = Paint()
      ..shader = LinearGradient(
        colors: [
          ink.withValues(alpha: 0),
          ink.withValues(alpha: .7),
          ink.withValues(alpha: 0),
        ],
      ).createShader(Rect.fromLTWH(24, y - 1, 204, 2))
      ..strokeWidth = 1.3;
    canvas.drawLine(Offset(24, y), Offset(108, y), glow);
    canvas.drawLine(Offset(144, y), Offset(228, y), glow);
    // Scroll ends next to the jewel.
    for (final s in [-1.0, 1.0]) {
      canvas.drawPath(
        Path()
          ..moveTo(126 + 18 * s, y)
          ..cubicTo(126 + 13 * s, y - 7, 126 + 6 * s, y - 6, 126 + 7 * s, y)
          ..cubicTo(126 + 8 * s, y + 5, 126 + 13 * s, y + 4, 126 + 12 * s, y),
        p,
      );
    }
    _jewel(canvas, Offset(126, y), 4.5);
  }

  void _tipFlourish(Canvas canvas) {
    final p = _stroke(.5, 1.3);
    const y = 322.0;
    for (final s in [-1.0, 1.0]) {
      canvas.drawPath(
        Path()
          ..moveTo(126, y + 18)
          ..cubicTo(126 + 10 * s, y + 6, 126 + 30 * s, y + 4, 126 + 46 * s, y)
          ..cubicTo(
            126 + 56 * s,
            y - 2,
            126 + 60 * s,
            y + 8,
            126 + 52 * s,
            y + 10,
          )
          ..cubicTo(
            126 + 46 * s,
            y + 11,
            126 + 45 * s,
            y + 4,
            126 + 50 * s,
            y + 4,
          ),
        p,
      );
    }
    _jewel(canvas, const Offset(126, y + 4), 3.2);
    canvas.drawCircle(
      const Offset(126, y + 18),
      1.6,
      Paint()..color = ink.withValues(alpha: .6),
    );
  }

  void _jewel(Canvas canvas, Offset c, double r) {
    final diamond = Path()
      ..moveTo(c.dx, c.dy - r * 1.5)
      ..lineTo(c.dx + r, c.dy)
      ..lineTo(c.dx, c.dy + r * 1.5)
      ..lineTo(c.dx - r, c.dy)
      ..close();
    canvas.drawPath(
      diamond,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accent, ink],
        ).createShader(Rect.fromCircle(center: c, radius: r * 1.5)),
    );
    canvas.drawPath(diamond, _stroke(.8, .8));
  }

  @override
  bool shouldRepaint(FutCardOrnaments old) =>
      old.ink != ink || old.accent != accent;
}
