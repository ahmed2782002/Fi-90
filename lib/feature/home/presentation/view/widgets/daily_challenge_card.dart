import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/dashed_ring/dashed_ring_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyChallengeCard extends StatelessWidget {
  const DailyChallengeCard({
    super.key,
    required this.done,
    required this.total,
    required this.progress,
    required this.hoursLeft,
    required this.xp,
  });

  final int done;
  final int total;
  final double progress;
  final int hoursLeft;
  final int xp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Row(
        children: [
          CustomPaint(
            painter: DashedRingPainter(
              width: 5.5.r,
              color: AppColors.gold,
              rest: AppColors.s3,
              progress: progress,
            ),
            child: SizedBox.square(
              dimension: 54,
              child: Center(
                child: Text(
                  '$done/$total',
                  textDirection: TextDirection.ltr,
                  style: AppText.ringLabel,
                ),
              ),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(
                    AppStrings.dailyChallengeMeta,
                    args: ['$hoursLeft'],
                  ),
                  style: AppText.dailyMeta,
                ),
                SizedBox(height: 2.h),
                Text(
                  context.tr(AppStrings.dailyChallengeTitle),
                  style: AppText.dailyTitle,
                ),
              ],
            ),
          ),
          SizedBox(width: 14.w),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.skewX(-.1763),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                '+$xp XP',
                textDirection: TextDirection.ltr,
                style: AppText.xpBadge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
