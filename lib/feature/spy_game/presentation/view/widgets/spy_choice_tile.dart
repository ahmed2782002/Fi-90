import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class SpyChoiceTile extends StatelessWidget {
  const SpyChoiceTile({
    super.key,
    required this.label,
    required this.badge,
    required this.color,
    required this.onTap,
    this.badgeColor,
    this.badgeInk = AppColors.white,
    this.selected = false,
    this.tag,
  });

  final String label;
  final String badge;
  final Color color;
  final Color? badgeColor;
  final Color badgeInk;
  final bool selected;
  final String? tag;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final mark = tag;
    return PressScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        constraints: const BoxConstraints(minHeight: 124),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        transform: Matrix4.translationValues(0, selected ? -3 : 0, 0),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.2,
            colors: [
              selected || mark == null
                  ? AppColors.tint(color, .22)
                  : AppColors.s1,
              AppColors.s1,
            ],
            stops: const [0, .7],
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: selected || mark == null ? color : AppColors.line,
            width: 1.5,
          ),
          boxShadow: selected
              ? [BoxShadow(color: AppColors.tint(color, .35), blurRadius: 24)]
              : AppShadows.sh1,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: badgeColor ?? color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected ? color : AppColors.line2,
                        width: 3,
                      ),
                    ),
                    child: Text(badge, style: AppText.bigInitial(24, badgeInk)),
                  ),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: AppText.optionTitle,
                  ),
                ],
              ),
            ),
            if (selected && mark != null)
              PositionedDirectional(
                top: -6,
                end: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(mark, style: AppText.vsTag(AppColors.white)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
