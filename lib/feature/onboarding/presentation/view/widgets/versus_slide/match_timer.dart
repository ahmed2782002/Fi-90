import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/stage_app/dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchTimer extends StatelessWidget {
  const MatchTimer({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92.r,
      height: 34.r,
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(999.r),
        border: Border.all(color: AppColors.line2),
        boxShadow: AppShadows.sh1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: AppText.timer),
          SizedBox(width: 6.w),
          Dot(AppColors.bad, size: 8.r, glow: true),
        ],
      ),
    );
  }
}
