import 'package:flutter/animation.dart';

abstract final class AppCurves {
  static const pop = Cubic(.2, 1.4, .4, 1);
  static const spring = Cubic(.2, 1.2, .4, 1);
  static const grow = Cubic(.2, 1.1, .4, 1);

  static double wave(double t, [Curve curve = Curves.easeInOut]) =>
      t < .5 ? curve.transform(t * 2) : curve.transform(2 - t * 2);
}
