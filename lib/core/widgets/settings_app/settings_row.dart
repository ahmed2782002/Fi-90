import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/forward_chevron.dart';
import 'package:fii90/core/widgets/tinted_icon_box.dart';
import 'package:flutter/material.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.tint = AppColors.pri,
    this.ink,
    this.tintAlpha = .14,
  });

  final String icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color tint;
  final Color? ink;
  final double tintAlpha;

  @override
  Widget build(BuildContext context) {
    final sub = subtitle;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 56),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Row(
          children: [
            TintedIconBox(
              icon: icon,
              tint: tint,
              ink: ink ?? AppColors.priInk,
              tintAlpha: tintAlpha,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppText.rowTitle),
                  if (sub != null) Text(sub, style: AppText.rowSubtitle),
                ],
              ),
            ),
            if (trailing != null) ...[const SizedBox(width: 12), trailing!],
            if (onTap != null) ...[
              const SizedBox(width: 12),
              const ForwardChevron(),
            ],
          ],
        ),
      ),
    );
  }
}
