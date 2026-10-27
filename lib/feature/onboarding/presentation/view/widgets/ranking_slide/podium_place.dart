import 'package:fii90/core/animation/app_curves.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/ranking_slide/podium_avatar.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/ranking_slide/podium_bar.dart';
import 'package:flutter/material.dart';

class PodiumPlace extends StatelessWidget {
  const PodiumPlace({
    super.key,
    required this.rank,
    required this.name,
    required this.initial,
    required this.xp,
    required this.barHeight,
    required this.accent,
    required this.ink,
    required this.fill,
    required this.onFill,
    required this.avatarSize,
    required this.avatarDelay,
    required this.nameDelay,
    required this.barDelay,
    this.crowned = false,
  });

  final String rank;
  final String name;
  final String initial;
  final String xp;
  final double barHeight;
  final Color accent;
  final Color ink;
  final Color fill;
  final Color onFill;
  final double avatarSize;
  final int avatarDelay;
  final int nameDelay;
  final int barDelay;
  final bool crowned;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Enter(
            fx: Fx.pop,
            delay: Duration(milliseconds: avatarDelay),
            child: PodiumAvatar(
              initial: initial,
              size: avatarSize,
              fill: fill,
              onFill: onFill,
              ring: accent,
              crowned: crowned,
            ),
          ),
          const SizedBox(height: 8),
          Enter(
            fx: Fx.fadeIn,
            duration: const Duration(milliseconds: 400),
            delay: Duration(milliseconds: nameDelay),
            child: Text(name, style: AppText.podiumName),
          ),
          const SizedBox(height: 8),
          Enter(
            fx: Fx.growUp,
            duration: const Duration(milliseconds: 600),
            delay: Duration(milliseconds: barDelay),
            curve: AppCurves.grow,
            child: PodiumBar(height: barHeight, rank: rank, xp: xp, accent: accent, ink: ink),
          ),
        ],
      ),
    );
  }
}
