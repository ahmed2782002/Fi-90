import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankRow extends StatelessWidget {
  const RankRow({
    super.key,
    required this.rank,
    required this.name,
    required this.score,
  });

  final int rank;
  final String name;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24.r,
            child: Text('$rank', style: AppText.rankIndex),
          ),
          SizedBox(width: 12.w),
          Container(
            width: 34.r,
            height: 34.r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.s3,
              borderRadius: BorderRadius.circular(11.r),
            ),
            child: Text(name.characters.first, style: AppText.rowInitial),
          ),
          SizedBox(width: 12.w),
          Expanded(child: Text(name, style: AppText.rowName)),
          Text(score, style: AppText.rowScore),
        ],
      ),
    );
  }
}
