import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TurnBanner extends StatelessWidget {
  const TurnBanner({
    super.key,
    required this.color,
    required this.title,
    this.subtitle,
  });

  final Color color;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final sub = subtitle;
    return Container(
      constraints: BoxConstraints(minHeight: 44.r),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.mix(color, .12, AppColors.s1),
        borderRadius: BorderRadius.circular(sub == null ? 999.r : 24.r),
        border: Border.all(color: color, width: 1.5),
      ),
      child: sub == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8.r,
              children: [
                Container(
                  width: 10.r,
                  height: 10.r,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                Flexible(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppText.turnBanner,
                  ),
                ),
              ],
            )
          : Column(
              spacing: 2.r,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppText.turnBanner,
                ),
                Text(
                  sub,
                  textAlign: TextAlign.center,
                  style: AppText.turnBannerSub,
                ),
              ],
            ),
    );
  }
}
