import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuessChips extends StatelessWidget {
  const GuessChips({super.key, required this.guesses});

  final List<({String text, Color color})> guesses;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.r,
      runSpacing: 6.r,
      children: [
        for (final g in guesses)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.tint(AppColors.bad, .1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6.r,
                  height: 6.r,
                  decoration: BoxDecoration(
                    color: g.color,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(width: 6.w),
                Text(g.text, style: AppText.wrongGuess),
              ],
            ),
          ),
      ],
    );
  }
}
