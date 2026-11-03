import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchEventRow extends StatelessWidget {
  const MatchEventRow({
    super.key,
    required this.minute,
    required this.color,
    required this.text,
    required this.goal,
  });

  final int minute;
  final Color color;
  final String text;
  final bool goal;

  @override
  Widget build(BuildContext context) {
    return Enter(
      fx: Fx.fadeUp,
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: goal ? AppColors.tint(color, .12) : AppColors.s1,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: goal ? color : AppColors.line),
        ),
        child: Row(
          children: [
            Container(
              constraints: BoxConstraints(minWidth: 38.r),
              height: 26.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.s2,
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: Text(
                "$minute'",
                textDirection: TextDirection.ltr,
                style: AppText.eventMinute,
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              width: 4.r,
              height: 22.r,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(child: Text(text, style: AppText.eventText(goal))),
            if (goal)
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.skewX(-.1763),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    context.tr(AppStrings.goal),
                    style: AppText.goalBadge,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
