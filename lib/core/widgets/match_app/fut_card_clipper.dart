import 'package:flutter/material.dart';

class FutCardClipper extends CustomClipper<Path> {
  const FutCardClipper({this.inset = 0});

  final double inset;

  @override
  Path getClip(Size size) {
    final sx = size.width / 252, sy = size.height / 373;
    final i = inset;
    Offset p(double x, double y) => Offset(x * sx, y * sy);
    final a = p(i, 44.5 + i * .8),
        b = p(13.9 + i, 41.8 + i * .8),
        c = p(25.6 + i * .8, 31.2 + i * .9);
    final d = p(26.5 + i * .8, 16.1 + i * .9),
        e = p(125.9, -16.1 + i),
        f = p(225.5 - i * .8, 16.1 + i * .9);
    final g = p(226.4 - i * .8, 31.2 + i * .9),
        h = p(238.1 - i, 41.8 + i * .8),
        j = p(252 - i, 44.5 + i * .8);
    return Path()
      ..moveTo(a.dx, a.dy)
      ..cubicTo(b.dx, b.dy, c.dx, c.dy, d.dx, d.dy)
      ..quadraticBezierTo(e.dx, e.dy, f.dx, f.dy)
      ..cubicTo(g.dx, g.dy, h.dx, h.dy, j.dx, j.dy)
      ..lineTo((252 - i) * sx, (331.2 - i * .8) * sy)
      ..quadraticBezierTo(
        (252 - i) * sx,
        (344.1 - i * .9) * sy,
        (239.5 - i * .9) * sx,
        (347.9 - i * .9) * sy,
      )
      ..lineTo((150.4 - i * .2) * sx, (366.9 - i) * sy)
      ..quadraticBezierTo(
        125.9 * sx,
        (374.7 - i) * sy,
        (101.4 + i * .2) * sx,
        (366.9 - i) * sy,
      )
      ..lineTo((12.5 + i * .9) * sx, (347.9 - i * .9) * sy)
      ..quadraticBezierTo(
        i * sx,
        (344.1 - i * .9) * sy,
        i * sx,
        (331.2 - i * .8) * sy,
      )
      ..close();
  }

  @override
  bool shouldReclip(FutCardClipper old) => old.inset != inset;
}
