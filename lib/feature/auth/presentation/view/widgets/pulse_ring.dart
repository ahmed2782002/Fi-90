import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PulseRing extends StatelessWidget {
  const PulseRing({super.key, required this.delay});

  final int delay;

  @override
  Widget build(BuildContext context) {
    return Loop(
      period: const Duration(milliseconds: 3600),
      delay: Duration(milliseconds: delay),
      hideUntilStart: true,
      child: Container(
        width: 260,
        height: 260,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.cy, width: 1.5),
        ),
      ),
      builder: (context, t, child) => Opacity(
        opacity: .55 * (1 - Curves.easeOut.transform(t)),
        child: Transform.scale(
          scale: .55 + .8 * Curves.easeOut.transform(t),
          child: child,
        ),
      ),
    );
  }
}
