import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EndScoreTile extends StatelessWidget {
  const EndScoreTile({
    super.key,
    required this.name,
    required this.value,
    required this.unit,
    required this.ink,
    required this.winner,
    required this.winnerLabel,
  });

  final String name;
  final int value;
  final String unit;
  final Color ink;
  final bool winner;
  final String winnerLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: winner ? AppColors.gold : AppColors.line,
          width: 1.5,
        ),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        spacing: 4.r,
        children: [
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppText.teamLabel,
          ),
          Text('$value', style: AppText.endValue(ink)),
          Text(unit, style: AppText.chipCaption),
          if (winner)
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.skewX(-.1763),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Text(winnerLabel, style: AppText.goalBadge),
              ),
            ),
        ],
      ),
    );
  }
}
