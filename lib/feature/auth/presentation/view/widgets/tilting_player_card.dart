import 'dart:math' as math;

import 'package:fii90/core/animation/app_curves.dart';
import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/new_player_card.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/pulse_ring.dart';
import 'package:flutter/material.dart';

class TiltingPlayerCard extends StatelessWidget {
  const TiltingPlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
            gradient: AppGradients.closestSide([
              AppColors.tint(AppColors.cy, .22),
              AppColors.tint(AppColors.cy, 0),
            ]),
          ),
        ),
        for (final delay in const [0, 1200, 2400]) PulseRing(delay: delay),
        Loop(
          period: const Duration(seconds: 5),
          child: const NewPlayerCard(),
          builder: (context, t, child) => Transform.translate(
            offset: Offset(0, -9 * AppCurves.wave(t)),
            child: Transform.rotate(
              angle: (-4 + 7 * AppCurves.wave(t)) * math.pi / 180,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
