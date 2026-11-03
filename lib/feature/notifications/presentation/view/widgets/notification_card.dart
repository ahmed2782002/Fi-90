import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.glyph,
    required this.tile,
    required this.ink,
    required this.title,
    required this.time,
    required this.body,
    required this.unread,
    required this.onTap,
    this.tileGradient,
    this.points,
    this.actions,
  });

  final String glyph;
  final Color tile;
  final Color ink;
  final String title;
  final String time;
  final String body;
  final bool unread;
  final VoidCallback onTap;
  final Gradient? tileGradient;
  final String? points;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    final pts = points;
    final actions = this.actions;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              color: unread
                  ? AppColors.mix(AppColors.cy, .06, AppColors.s1)
                  : AppColors.s1,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: unread ? AppColors.line2 : AppColors.line,
              ),
              boxShadow: AppShadows.sh1,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44.r,
                  height: 44.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: tile,
                    gradient: tileGradient,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Text(glyph, style: AppText.notificationGlyph(ink)),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: AppText.notificationTitle,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(time, style: AppText.notificationTime),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Text(body, style: AppText.notificationBody),
                      if (pts != null)
                        Padding(
                          padding: EdgeInsets.only(top: 7.h),
                          child: Transform(
                            transform: Matrix4.skewX(-.175),
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.gold,
                                borderRadius: BorderRadius.circular(9.r),
                              ),
                              child: Text(
                                pts,
                                textDirection: TextDirection.ltr,
                                style: AppText.notificationPoints,
                              ),
                            ),
                          ),
                        ),
                      if (actions != null) ...[SizedBox(height: 11.h), actions],
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (unread)
            PositionedDirectional(
              top: 18.r,
              start: 8.w,
              child: Container(
                width: 7.r,
                height: 7.r,
                decoration: BoxDecoration(
                  color: AppColors.cy,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: AppColors.cy, blurRadius: 8)],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
