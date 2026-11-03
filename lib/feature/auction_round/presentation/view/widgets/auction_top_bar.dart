import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuctionTopBar extends StatelessWidget {
  const AuctionTopBar({
    super.key,
    required this.meLabel,
    required this.meBudget,
    required this.oppLabel,
    required this.oppBudget,
    required this.stage,
  });

  final String meLabel;
  final int meBudget;
  final String oppLabel;
  final int oppBudget;
  final String stage;

  @override
  Widget build(BuildContext context) {
    final sides = [
      (meLabel, meBudget, AppColors.me),
      (oppLabel, oppBudget, AppColors.op),
    ];
    return Row(
      children: [
        for (final (i, (label, budget, dot)) in sides.indexed) ...[
          if (i == 1) ...[
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.tint(AppColors.gold, .14),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Text(
                    stage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.stagePill,
                  ),
                ),
              ),
            ),
          ],
          Container(
            height: 38.r,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.s1,
              borderRadius: BorderRadius.circular(999.r),
              border: Border.all(color: AppColors.line),
              boxShadow: AppShadows.sh1,
            ),
            child: Row(
              children: [
                Container(
                  width: 8.r,
                  height: 8.r,
                  decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
                ),
                SizedBox(width: 7.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: AppText.budgetPillLabel),
                    Text(
                      '${budget}M',
                      textDirection: TextDirection.ltr,
                      style: AppText.budgetValue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
