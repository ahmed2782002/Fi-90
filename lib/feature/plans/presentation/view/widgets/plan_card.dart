import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({
    super.key,
    required this.details,
    required this.button,
    required this.popular,
    required this.current,
    required this.main,
    required this.popularLabel,
    required this.onTap,
  });

  final Widget details;
  final String button;
  final bool popular;
  final bool current;
  final bool main;
  final String popularLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.s1,
            borderRadius: BorderRadius.circular(28),
            border: popular
                ? Border.all(color: AppColors.neon, width: 1.5)
                : current
                ? Border.all(color: AppColors.ok, width: 1.5)
                : Border.all(color: AppColors.line),
            boxShadow: popular ? AppShadows.glow : AppShadows.sh1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              details,
              const SizedBox(height: 12),
              PressScale(
                onTap: current ? null : onTap,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: current ? AppColors.s2 : null,
                    gradient: main ? AppColors.grad : null,
                    borderRadius: BorderRadius.circular(999),
                    border: main
                        ? Border.all(color: AppColors.neon, width: 1.5)
                        : Border.all(color: AppColors.line2),
                    boxShadow: main ? AppShadows.glow : null,
                  ),
                  child: Text(
                    button,
                    style: AppText.actionButton(
                      15,
                      color: current
                          ? AppColors.mu
                          : main
                          ? AppColors.white
                          : AppColors.tx,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (popular)
          PositionedDirectional(
            top: -11,
            start: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(popularLabel, style: AppText.popularBadge),
            ),
          ),
      ],
    );
  }
}
