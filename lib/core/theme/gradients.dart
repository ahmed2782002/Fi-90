import 'package:flutter/widgets.dart';

import 'ellipse_gradient_transform.dart';

abstract final class AppGradients {
  static RadialGradient ellipse({
    required double x,
    required double y,
    required double rx,
    required double ry,
    required List<Color> colors,
    List<double>? stops,
  }) {
    final center = Alignment(x * 2 - 1, y * 2 - 1);
    return RadialGradient(
      center: center,
      radius: 0.5,
      colors: colors,
      stops: stops,
      transform: EllipseGradientTransform(center, rx, ry),
    );
  }

  static RadialGradient closestSide(List<Color> colors,
          [List<double>? stops]) =>
      ellipse(x: .5, y: .5, rx: .5, ry: .5, colors: colors, stops: stops);

  static RadialGradient fade(
    Color color, {
    required double x,
    required double y,
    required double rx,
    required double ry,
    required double alpha,
    double end = .7,
  }) =>
      ellipse(
        x: x,
        y: y,
        rx: rx,
        ry: ry,
        colors: [color.withValues(alpha: alpha), color.withValues(alpha: 0)],
        stops: [0, end],
      );
}
