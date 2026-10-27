import 'package:flutter/widgets.dart';

class EllipseGradientTransform extends GradientTransform {
  const EllipseGradientTransform(this.center, this.rx, this.ry);

  final Alignment center;
  final double rx;
  final double ry;

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    final c = center.withinRect(bounds);
    final r = bounds.shortestSide * 0.5;
    if (r == 0) return Matrix4.identity();
    return Matrix4.identity()
      ..translateByDouble(c.dx, c.dy, 0, 1)
      ..scaleByDouble(rx * bounds.width / r, ry * bounds.height / r, 1, 1)
      ..translateByDouble(-c.dx, -c.dy, 0, 1);
  }
}
