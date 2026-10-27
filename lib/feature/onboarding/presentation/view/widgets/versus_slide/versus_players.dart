import 'package:fii90/core/animation/app_curves.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/versus_slide/player_card.dart';
import 'package:flutter/material.dart';

class VersusPlayers extends StatelessWidget {
  const VersusPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Enter(
          fx: Fx.slideS,
          duration: Duration(milliseconds: 700),
          curve: AppCurves.spring,
          child: PlayerCard(
            name: 'أحمد',
            initial: 'أ',
            level: 'LV 24',
            color: AppColors.me,
            onColor: AppColors.meOn,
            angle: -8,
          ),
        ),
        SizedBox(width: 44),
        Enter(
          fx: Fx.slideE,
          duration: Duration(milliseconds: 700),
          curve: AppCurves.spring,
          child: PlayerCard(
            name: 'عمر',
            initial: 'ع',
            level: 'LV 26',
            color: AppColors.op,
            onColor: AppColors.opOn,
            angle: 8,
          ),
        ),
      ],
    );
  }
}
