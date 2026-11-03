import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class XpProgress extends StatelessWidget {
  const XpProgress({
    super.key,
    required this.xp,
    required this.target,
    required this.progress,
  });

  final int xp;
  final int target;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('XP $xp', style: AppText.xpProgress),
            Text('$target', style: AppText.xpProgress),
          ],
        ),
        SizedBox(height: 5.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(9.r),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 7.r,
            color: AppColors.white,
            backgroundColor: AppColors.tint(AppColors.black, .22),
          ),
        ),
      ],
    );
  }
}
