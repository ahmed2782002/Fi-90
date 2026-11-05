import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'fut_card_style.dart';

/// Shield silhouette of the card body: crown notch on top, straight sides and
/// a soft point at the bottom. Drawn in a 252×350 base and mapped into [r].
Path futShieldPath(Rect r) {
  final sx = r.width / 252, sy = r.height / 350;
  Offset p(double x, double y) => Offset(r.left + x * sx, r.top + y * sy);
  final path = Path();
  void m(double x, double y) => path.moveTo(p(x, y).dx, p(x, y).dy);
  void l(double x, double y) => path.lineTo(p(x, y).dx, p(x, y).dy);
  void q(double cx, double cy, double x, double y) {
    final c = p(cx, cy), e = p(x, y);
    path.quadraticBezierTo(c.dx, c.dy, e.dx, e.dy);
  }

  m(0, 50);
  q(15, 44, 18, 28);
  q(58, 26, 98, 20);
  q(106, 26, 112, 16);
  l(126, 2);
  l(140, 16);
  q(146, 26, 154, 20);
  q(194, 26, 234, 28);
  q(237, 44, 252, 50);
  l(252, 268);
  q(252, 286, 236, 296);
  l(146, 342);
  q(126, 352, 106, 342);
  l(16, 296);
  q(0, 286, 0, 268);
  path.close();
  return path;
}

/// Where the shield body sits inside the full card (wings drawn around it).
Rect futBodyRect(Size size, {required bool wings}) {
  if (!wings) return Offset.zero & size;
  final s = size.width / 300;
  return Rect.fromLTWH(24 * s, 22 * s, 252 * s, 350 * s);
}

/// Paints everything on a card except the photo and the text: glow, wings,
/// metal frame, crystal / marble body, double frame lines and ornaments.
class FutCardArt extends CustomPainter {
  const FutCardArt({required this.style, this.wings = true, this.name = true});

  final FutCardStyle style;

  /// Full-size card (wings, glow, sparkles). Off for the pitch mini card.
  final bool wings;

  /// Whether to draw the name ornaments (off for the mini card).
  final bool name;

  @override
  void paint(Canvas canvas, Size size) {
    final b = futBodyRect(size, wings: wings);
    final u = b.width / 252; // body unit
    Offset at(double fx, double fy) =>
        Offset(b.left + b.width * fx, b.top + b.height * fy);

    if (wings) {
      _glow(canvas, b, u);
      _wings(canvas, b, u);
      _sparkles(canvas, b, u);
    }

    // Metal frame.
    final outer = futShieldPath(b);
    canvas.drawPath(
      outer,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: style.frame,
        ).createShader(b),
    );
    canvas.drawPath(
      futShieldPath(b.deflate(3.2 * u)),
      Paint()..color = Colors.black.withValues(alpha: .35),
    );

    // Body.
    final inner = futShieldPath(b.deflate(4.6 * u));
    canvas.save();
    canvas.clipPath(inner);
    canvas.drawRect(
      b,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: style.body,
        ).createShader(b),
    );
    if (style.finish == FutFinish.marble) {
      _marble(canvas, b, u);
    } else {
      _crystal(canvas, b, u, at);
    }
    // Soft light behind the player.
    final c = at(.62, .36);
    canvas.drawCircle(
      c,
      b.width * .5,
      Paint()
        ..shader = RadialGradient(
          colors: [
            style.facetLight.withValues(alpha: .32),
            style.facetLight.withValues(alpha: 0),
          ],
        ).createShader(Rect.fromCircle(center: c, radius: b.width * .5)),
    );
    if (style.nameBand case final band?) {
      final top = b.top + b.height * .64;
      canvas.drawRect(
        Rect.fromLTRB(b.left, top, b.right, b.bottom),
        Paint()..color = band,
      );
      canvas.drawRect(
        Rect.fromLTRB(b.left, top - 1.5 * u, b.right, top + 1.5 * u),
        Paint()
          ..color = style.facetLight
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3 * u),
      );
    }
    canvas.restore();

    // Double frame lines.
    final metal = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.7 * u
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: style.frame,
      ).createShader(b);
    canvas.drawPath(futShieldPath(b.deflate(9 * u)), metal);
    canvas.drawPath(
      futShieldPath(b.deflate(13.5 * u)),
      metal..strokeWidth = .8 * u,
    );

    if (style.emblem) _emblem(canvas, at(.5, .085), u);
    if (name) {
      if (style.ornament == FutOrnament.filigree) {
        if (style.emblem) _filigree(canvas, at(.5, .705), u, flip: true);
        _filigree(canvas, at(.5, .845), u);
        _flourish(canvas, at(.5, .925), u);
      } else {
        _geometric(canvas, b, at(.5, .84), u);
      }
    }
  }

  // ---------------------------------------------------------------- outside

  void _glow(Canvas canvas, Rect b, double u) {
    canvas.drawPath(
      futShieldPath(b.inflate(2 * u)),
      Paint()
        ..color = style.glow.withValues(alpha: .45)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 16 * u),
    );
  }

  void _wings(Canvas canvas, Rect b, double u) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: style.frame,
      ).createShader(b.inflate(30 * u));
    final line = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6 * u
      ..shader = paint.shader;
    for (final dir in [-1.0, 1.0]) {
      final x0 = dir < 0 ? b.left : b.right;
      double x(double d) => x0 + dir * d * u;
      double y(double f) => b.top + b.height * f;
      // Upper blade sweeping up and out.
      canvas.drawPath(
        Path()
          ..moveTo(x(-2), y(.16))
          ..quadraticBezierTo(x(14), y(.11), x(22), y(.02))
          ..quadraticBezierTo(x(17), y(.12), x(-2), y(.21))
          ..close(),
        paint,
      );
      canvas.drawPath(
        Path()
          ..moveTo(x(-2), y(.23))
          ..quadraticBezierTo(x(10), y(.19), x(14), y(.12))
          ..quadraticBezierTo(x(10), y(.21), x(-2), y(.26))
          ..close(),
        paint,
      );
      // Side rails.
      canvas.drawLine(Offset(x(7), y(.58)), Offset(x(7), y(.83)), line);
      canvas.drawLine(Offset(x(12), y(.63)), Offset(x(12), y(.78)), line);
      // Lower blade sweeping down and out.
      canvas.drawPath(
        Path()
          ..moveTo(x(-4), y(.84))
          ..quadraticBezierTo(x(14), y(.9), x(20), y(1.0))
          ..quadraticBezierTo(x(10), y(.93), x(-6), y(.89))
          ..close(),
        paint,
      );
    }
  }

  void _sparkles(Canvas canvas, Rect b, double u) {
    final r = math.Random(5);
    for (var i = 0; i < 26; i++) {
      final left = r.nextBool();
      final x = left
          ? b.left - r.nextDouble() * 22 * u
          : b.right + r.nextDouble() * 22 * u;
      final y = b.top + b.height * (.05 + r.nextDouble() * .9);
      final rad = (.5 + r.nextDouble() * 1.6) * u;
      canvas.drawCircle(
        Offset(x, y),
        rad * 2.2,
        Paint()
          ..color = style.glow.withValues(alpha: .35)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, rad * 2),
      );
      canvas.drawCircle(
        Offset(x, y),
        rad,
        Paint()..color = style.metalLight.withValues(alpha: .9),
      );
    }
  }

  // ---------------------------------------------------------------- body

  void _crystal(
    Canvas canvas,
    Rect b,
    double u,
    Offset Function(double, double) at,
  ) {
    final r = math.Random(11);
    for (final (focus, count) in [(at(.3, .3), 14), (at(.82, .18), 9)]) {
      for (var i = 0; i < count; i++) {
        final a1 = r.nextDouble() * math.pi * 2;
        final a2 = a1 + .25 + r.nextDouble() * .55;
        final len = b.width * (.7 + r.nextDouble() * .8);
        final p1 = focus + Offset(math.cos(a1), math.sin(a1)) * len;
        final p2 = focus + Offset(math.cos(a2), math.sin(a2)) * len;
        final light = r.nextBool();
        final tri = Path()
          ..moveTo(focus.dx, focus.dy)
          ..lineTo(p1.dx, p1.dy)
          ..lineTo(p2.dx, p2.dy)
          ..close();
        canvas.drawPath(
          tri,
          Paint()
            ..shader = LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                (light ? style.facetLight : style.facetDark).withValues(
                  alpha: .10 + r.nextDouble() * .22,
                ),
                (light ? style.facetLight : style.facetDark).withValues(
                  alpha: 0,
                ),
              ],
            ).createShader(tri.getBounds()),
        );
      }
      // Bright shard edges.
      for (var i = 0; i < 7; i++) {
        final a = r.nextDouble() * math.pi * 2;
        final end = focus + Offset(math.cos(a), math.sin(a)) * b.width * 1.2;
        canvas.drawLine(
          focus,
          end,
          Paint()
            ..strokeWidth = (.5 + r.nextDouble()) * u
            ..shader = LinearGradient(
              colors: [
                style.facetLight.withValues(alpha: .75),
                style.facetLight.withValues(alpha: 0),
              ],
            ).createShader(Rect.fromPoints(focus, end)),
        );
      }
    }
    // Fine carbon hatch in the lower half.
    final hatch = Paint()
      ..strokeWidth = .5 * u
      ..color = style.facetDark.withValues(alpha: .12);
    for (var x = b.left - b.height; x < b.right; x += 5 * u) {
      canvas.drawLine(
        Offset(x, b.bottom),
        Offset(x + b.height * .45, b.bottom - b.height * .45),
        hatch,
      );
    }
  }

  void _marble(Canvas canvas, Rect b, double u) {
    final r = math.Random(3);
    // Cloudy patches.
    for (var i = 0; i < 9; i++) {
      final c = Offset(
        b.left + r.nextDouble() * b.width,
        b.top + r.nextDouble() * b.height,
      );
      final rad = b.width * (.2 + r.nextDouble() * .3);
      canvas.drawCircle(
        c,
        rad,
        Paint()
          ..shader = RadialGradient(
            colors: [
              style.facetDark.withValues(alpha: .16),
              style.facetDark.withValues(alpha: 0),
            ],
          ).createShader(Rect.fromCircle(center: c, radius: rad)),
      );
    }
    // Faint facets.
    final f = Offset(b.left + b.width * .35, b.top + b.height * .3);
    for (var i = 0; i < 10; i++) {
      final a1 = r.nextDouble() * math.pi * 2,
          a2 = a1 + .4 + r.nextDouble() * .4;
      final len = b.width * 1.1;
      canvas.drawPath(
        Path()
          ..moveTo(f.dx, f.dy)
          ..lineTo(f.dx + math.cos(a1) * len, f.dy + math.sin(a1) * len)
          ..lineTo(f.dx + math.cos(a2) * len, f.dy + math.sin(a2) * len)
          ..close(),
        Paint()
          ..color = (r.nextBool() ? Colors.white : style.facetDark).withValues(
            alpha: .08,
          ),
      );
    }
    // Rose window behind the player.
    final c = Offset(b.left + b.width * .6, b.top + b.height * .42);
    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1 * u
      ..color = style.metal.withValues(alpha: .4);
    for (final k in [.36, .3, .22]) {
      canvas.drawCircle(c, b.width * k, ring);
    }
    for (var i = 0; i < 16; i++) {
      final a = i * math.pi / 8;
      canvas.drawLine(
        c + Offset(math.cos(a), math.sin(a)) * b.width * .22,
        c + Offset(math.cos(a), math.sin(a)) * b.width * .36,
        ring,
      );
    }
    // Veins: gold and grey.
    for (var i = 0; i < 12; i++) {
      final gold = i < 7;
      var p = Offset(
        b.left + r.nextDouble() * b.width,
        b.top + r.nextDouble() * b.height,
      );
      final path = Path()..moveTo(p.dx, p.dy);
      var ang = r.nextDouble() * math.pi * 2;
      for (var s = 0; s < 6; s++) {
        ang += (r.nextDouble() - .5) * 1.4;
        final step = b.width * (.06 + r.nextDouble() * .1);
        final ctrl = p + Offset(math.cos(ang + .5), math.sin(ang + .5)) * step;
        p = p + Offset(math.cos(ang), math.sin(ang)) * step * 1.6;
        path.quadraticBezierTo(ctrl.dx, ctrl.dy, p.dx, p.dy);
      }
      canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = (gold ? .7 + r.nextDouble() * 1.3 : .6) * u
          ..color = gold
              ? style.metal.withValues(alpha: .8)
              : style.facetDark.withValues(alpha: .35),
      );
    }
  }

  // ---------------------------------------------------------------- ornaments

  Paint _metalPaint(Rect bounds) => Paint()
    ..shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: style.frame,
    ).createShader(bounds);

  void _emblem(Canvas canvas, Offset c, double u) {
    final bounds = Rect.fromCircle(center: c, radius: 16 * u);
    final paint = _metalPaint(bounds);
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1 * u
      ..shader = paint.shader;
    canvas.drawCircle(c, 6 * u, paint);
    canvas.drawCircle(
      c,
      3 * u,
      Paint()..color = Colors.black.withValues(alpha: .35),
    );
    for (final s in [-1.0, 1.0]) {
      canvas.drawArc(
        Rect.fromCircle(center: c, radius: 11 * u),
        s < 0 ? math.pi * .55 : math.pi * .05,
        math.pi * .4,
        false,
        stroke,
      );
      for (var i = 0; i < 4; i++) {
        final a = (s < 0 ? math.pi * .6 : math.pi * .4) - s * i * .28;
        final p = c + Offset(math.cos(a) * 11 * u, math.sin(a) * 11 * u);
        canvas.save();
        canvas.translate(p.dx, p.dy);
        canvas.rotate(a + math.pi / 2 * s);
        canvas.drawOval(
          Rect.fromCenter(center: Offset.zero, width: 2.6 * u, height: 5.2 * u),
          paint,
        );
        canvas.restore();
      }
    }
    for (final dx in [-7.0, 0.0, 7.0]) {
      _star(
        canvas,
        c + Offset(dx * u, -13 * u - (dx == 0 ? 1.5 * u : 0)),
        2.2 * u,
        paint,
      );
    }
  }

  void _star(Canvas canvas, Offset c, double r, Paint paint) {
    final path = Path();
    for (var i = 0; i < 10; i++) {
      final a = -math.pi / 2 + i * math.pi / 5;
      final rad = i.isEven ? r : r * .45;
      final p = c + Offset(math.cos(a), math.sin(a)) * rad;
      i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
    }
    canvas.drawPath(path..close(), paint);
  }

  void _jewel(Canvas canvas, Offset c, double r) {
    final d = Path()
      ..moveTo(c.dx, c.dy - r * 1.6)
      ..lineTo(c.dx + r, c.dy)
      ..lineTo(c.dx, c.dy + r * 1.6)
      ..lineTo(c.dx - r, c.dy)
      ..close();
    canvas.drawPath(d, _metalPaint(d.getBounds()));
    canvas.drawPath(
      d,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = .6
        ..color = Colors.black.withValues(alpha: .35),
    );
  }

  /// Gold scrollwork with a jewel in the middle, used around the name.
  void _filigree(Canvas canvas, Offset c, double u, {bool flip = false}) {
    final bounds = Rect.fromCenter(center: c, width: 200 * u, height: 30 * u);
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5 * u
      ..shader = _metalPaint(bounds).shader;
    final dy = flip ? -1.0 : 1.0;
    canvas.drawLine(
      c + Offset(-96 * u, 0),
      c + Offset(96 * u, 0),
      Paint()
        ..strokeWidth = 1.3 * u
        ..shader = LinearGradient(
          colors: [
            style.metal.withValues(alpha: 0),
            style.metal,
            style.metal,
            style.metal.withValues(alpha: 0),
          ],
          stops: const [0, .25, .75, 1],
        ).createShader(bounds),
    );
    for (final s in [-1.0, 1.0]) {
      final path = Path()
        ..moveTo(c.dx + s * 8 * u, c.dy + dy * 4 * u)
        ..cubicTo(
          c.dx + s * 22 * u,
          c.dy + dy * 14 * u,
          c.dx + s * 40 * u,
          c.dy + dy * 2 * u,
          c.dx + s * 34 * u,
          c.dy + dy * 9 * u,
        )
        ..cubicTo(
          c.dx + s * 30 * u,
          c.dy + dy * 13 * u,
          c.dx + s * 26 * u,
          c.dy + dy * 7 * u,
          c.dx + s * 30 * u,
          c.dy + dy * 6 * u,
        )
        ..moveTo(c.dx + s * 12 * u, c.dy + dy * 3 * u)
        ..quadraticBezierTo(
          c.dx + s * 50 * u,
          c.dy + dy * 18 * u,
          c.dx + s * 66 * u,
          c.dy + dy * 5 * u,
        );
      canvas.drawPath(path, stroke);
    }
    _jewel(canvas, c + Offset(0, dy * 6 * u), 4.5 * u);
  }

  void _flourish(Canvas canvas, Offset c, double u) {
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.3 * u
      ..shader = _metalPaint(
        Rect.fromCenter(center: c, width: 120 * u, height: 20 * u),
      ).shader;
    for (final s in [-1.0, 1.0]) {
      canvas.drawPath(
        Path()
          ..moveTo(c.dx, c.dy + 8 * u)
          ..cubicTo(
            c.dx + s * 12 * u,
            c.dy - 2 * u,
            c.dx + s * 32 * u,
            c.dy - 4 * u,
            c.dx + s * 44 * u,
            c.dy - 6 * u,
          )
          ..cubicTo(
            c.dx + s * 54 * u,
            c.dy - 7 * u,
            c.dx + s * 56 * u,
            c.dy + 3 * u,
            c.dx + s * 48 * u,
            c.dy + 3 * u,
          ),
        stroke,
      );
    }
    _jewel(canvas, c + Offset(0, -6 * u), 3 * u);
  }

  /// Straight lines with a stepped chevron, used on modern tiers.
  void _geometric(Canvas canvas, Rect b, Offset c, double u) {
    final bounds = Rect.fromCenter(center: c, width: b.width, height: 30 * u);
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3 * u
      ..shader = _metalPaint(bounds).shader;
    canvas.drawLine(
      c + Offset(-100 * u, -8 * u),
      c + Offset(100 * u, -8 * u),
      stroke,
    );
    for (final s in [-1.0, 1.0]) {
      for (var k = 0; k < 3; k++) {
        final y = c.dy - 2 * u + k * 5 * u;
        canvas.drawPath(
          Path()
            ..moveTo(c.dx + s * (92 - k * 10) * u, y)
            ..lineTo(c.dx + s * (58 - k * 4) * u, y)
            ..lineTo(c.dx + s * (52 - k * 4) * u, y + 4 * u),
          stroke..strokeWidth = (k == 0 ? 1.2 : .8) * u,
        );
      }
    }
    canvas.drawPath(
      Path()
        ..moveTo(c.dx - 30 * u, c.dy - 2 * u)
        ..lineTo(c.dx, c.dy + 14 * u)
        ..lineTo(c.dx + 30 * u, c.dy - 2 * u),
      stroke..strokeWidth = 1.2 * u,
    );
  }

  @override
  bool shouldRepaint(FutCardArt old) =>
      old.style != style || old.wings != wings || old.name != name;
}

/// Clips a child to the inside of the card's shield body.
class FutBodyClipper extends CustomClipper<Path> {
  const FutBodyClipper({this.wings = true, this.inset = 6});

  final bool wings;
  final double inset;

  @override
  Path getClip(Size size) {
    final b = futBodyRect(size, wings: wings);
    return futShieldPath(b.deflate(inset * b.width / 252));
  }

  @override
  bool shouldReclip(FutBodyClipper old) =>
      old.wings != wings || old.inset != inset;
}
