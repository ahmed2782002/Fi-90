import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/forward_chevron.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/tinted_icon_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayOption extends StatelessWidget {
  PlayOption({
    super.key,
    required this.icon,
    required this.tint,
    required this.ink,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.tintAlpha = .16,
    double? iconSize,
    this.keepIconColors = false,
    this.selected = false,
  }) : iconSize = iconSize ?? 28.r;

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
        constraints: BoxConstraints(minHeight: 76.r),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.s2,
          borderRadius: BorderRadius.circular(24.r),
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
              size: 52.r,
              radius: 17.r,
              iconSize: iconSize,
              tintAlpha: tintAlpha,
              keepColors: keepIconColors,
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppText.optionTitle),
                  SizedBox(height: 2.h),
                  Text(subtitle, style: AppText.optionSubtitle),
                ],
              ),
            ),
            SizedBox(width: 14.w),
            ForwardChevron(),
          ],
        ),
      ),
    );
  }
}
