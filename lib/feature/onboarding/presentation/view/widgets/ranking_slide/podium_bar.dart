import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PodiumBar extends StatelessWidget {
  const PodiumBar({
    super.key,
    required this.height,
    required this.rank,
    required this.xp,
    required this.accent,
    required this.ink,
  });

  final double height;
  final String rank;
  final String xp;
  final Color accent;
  final Color ink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.only(top: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22.r),
          bottom: Radius.circular(10.r),
        ),
        border: Border.all(color: accent, width: 1.5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.mix(accent, .32, AppColors.s1), AppColors.s1],
        ),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        children: [
          Text(rank, style: AppText.podiumRank.copyWith(color: ink)),
          SizedBox(height: 2.h),
          Text(xp, textDirection: TextDirection.ltr, style: AppText.tag),
        ],
      ),
    );
  }
}
