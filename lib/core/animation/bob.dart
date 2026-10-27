import 'package:flutter/material.dart';

import 'app_curves.dart';
import 'loop.dart';

class Bob extends StatelessWidget {
  const Bob({
    super.key,
    required this.child,
    this.distance = 7,
    this.period = const Duration(seconds: 3),
    this.delay = Duration.zero,
  });

  final Widget child;
  final double distance;
  final Duration period;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return Loop(
      period: period,
      delay: delay,
      child: child,
      builder: (context, t, child) => Transform.translate(
        offset: Offset(0, -distance * AppCurves.wave(t)),
        child: child,
      ),
    );
  }
}
