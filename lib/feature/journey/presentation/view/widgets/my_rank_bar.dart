import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRankBar extends StatelessWidget {
  const MyRankBar({
    super.key,
    required this.rank,
    required this.name,
    required this.initial,
    required this.board,
    required this.score,
  });

  final String rank;
  final String name;
  final String initial;
  final String board;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 6.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.mix(AppColors.me, .14, AppColors.s1),
        borderRadius: BorderRadius.circular(999.r),
        border: Border.all(color: AppColors.me, width: 1.5),
      ),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 40.r),
            child: Text(
              rank,
              textDirection: TextDirection.ltr,
              style: AppText.myRank,
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            width: 34.r,
            height: 34.r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.me,
              borderRadius: BorderRadius.circular(11.r),
            ),
            child: Text(initial, style: AppText.myInitial),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppText.myName),
                Text(board, style: AppText.myBoard),
              ],
            ),
          ),
          Text(score, style: AppText.rowScore),
        ],
      ),
    );
  }
}
