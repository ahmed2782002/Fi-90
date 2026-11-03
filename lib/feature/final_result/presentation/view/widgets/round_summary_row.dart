import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundSummaryRow extends StatelessWidget {
  const RoundSummaryRow({
    super.key,
    required this.mode,
    required this.accent,
    required this.detail,
    required this.winner,
    required this.winnerColor,
    required this.points,
  });

  final String mode;
  final Color accent;
  final String detail;
  final String winner;
  final Color winnerColor;
  final String points;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        children: [
          Container(
            width: 4.r,
            height: 30.r,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mode, style: AppText.rowTitle),
                Text(detail, style: AppText.meta),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Text(winner, style: AppText.summaryWinner(winnerColor)),
          SizedBox(width: 10.w),
          SizedBox(
            width: 34.r,
            child: Text(
              points,
              textAlign: TextAlign.end,
              textDirection: TextDirection.ltr,
              style: AppText.summaryPoints,
            ),
          ),
        ],
      ),
    );
  }
}
