import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/top_gloss.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/new_player_card_body.dart';
import 'package:flutter/material.dart';

class NewPlayerCard extends StatelessWidget {
  const NewPlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 148,
          height: 200,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: AppColors.grad,
            border: Border.all(color: AppColors.cy, width: 2),
            boxShadow: [
              ...AppShadows.glow,
              BoxShadow(
                color: AppColors.tint(AppColors.black, .35),
                offset: const Offset(0, 24),
                blurRadius: 40,
              ),
            ],
          ),
          child: Stack(
            children: [
              const TopGloss(fraction: .44, alpha: .22),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      border: Border.all(color: AppColors.tint(AppColors.white, .18)),
                    ),
                  ),
                ),
              ),
              const NewPlayerCardBody(),
            ],
          ),
        ),
        Positioned(
          bottom: -26,
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.ok,
              border: Border.all(color: AppColors.bg, width: 3),
              boxShadow: [
                BoxShadow(color: AppColors.tint(AppColors.ok, .6), blurRadius: 16),
              ],
            ),
            child: Text('✓', style: AppText.checkMark),
          ),
        ),
      ],
    );
  }
}
