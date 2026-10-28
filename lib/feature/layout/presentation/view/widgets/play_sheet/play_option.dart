import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/forward_chevron.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/tinted_icon_box.dart';
import 'package:flutter/material.dart';

class PlayOption extends StatelessWidget {
  const PlayOption({
    super.key,
    required this.icon,
    required this.tint,
    required this.ink,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.tintAlpha = .16,
    this.iconSize = 28,
    this.keepIconColors = false,
    this.selected = false,
  });

  final String icon;
  final Color tint;
  final Color ink;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final double tintAlpha;
  final double iconSize;
  final bool keepIconColors;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 76),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.s2,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? AppColors.cy : AppColors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            TintedIconBox(
              icon: icon,
              tint: tint,
              ink: ink,
              size: 52,
              radius: 17,
              iconSize: iconSize,
              tintAlpha: tintAlpha,
              keepColors: keepIconColors,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppText.optionTitle),
                  const SizedBox(height: 2),
                  Text(subtitle, style: AppText.optionSubtitle),
                ],
              ),
            ),
            const SizedBox(width: 14),
            const ForwardChevron(),
          ],
        ),
      ),
    );
  }
}
