import 'dart:math' as math;

import 'package:flutter/material.dart';

class FloatLayer extends StatelessWidget {
  const FloatLayer({
    super.key,
    required this.wave,
    required this.child,
    this.offset = Offset.zero,
    this.depth = 0,
  });

  final double wave;
  final Offset offset;
  final double depth;
  final Widget child;

  Matrix4 get _transform => Matrix4.identity()
    ..setEntry(3, 2, -1 / 700)
    ..translateByDouble(0, -10 * wave, 0, 1)
    ..rotateX((14 - 4 * wave) * math.pi / 180)
    ..rotateY((-16 + 8 * wave) * math.pi / 180)
    ..translateByDouble(offset.dx, offset.dy, depth, 1);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Transform(
        alignment: Alignment.center,
        transform: _transform,
        child: child,
      ),
    );
  }
}
