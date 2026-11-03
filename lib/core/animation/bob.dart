import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_curves.dart';
import 'loop.dart';

class Bob extends StatelessWidget {
  Bob({
    super.key,
    required this.child,
    double? distance,
    this.period = const Duration(seconds: 3),
    this.delay = Duration.zero,
  }) : distance = distance ?? 7.r;

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
