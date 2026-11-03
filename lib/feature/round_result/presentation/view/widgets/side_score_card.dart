import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideScoreCard extends StatelessWidget {
  const SideScoreCard({
    super.key,
    required this.name,
    required this.initial,
    required this.score,
    required this.fill,
    required this.onFill,
    required this.ink,
    this.leadLabel,
  });

  final String name;
  final String initial;
  final int score;
  final Color fill;
  final Color onFill;
  final Color ink;
  final String? leadLabel;

  @override
  Widget build(BuildContext context) {
    final lead = leadLabel;
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(18.r),
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(28.r),
          border: Border.all(color: AppColors.tint(fill, .4), width: 1.5),
          boxShadow: AppShadows.sh1,
        ),
        child: Column(
          children: [
            Container(
              width: 40.r,
              height: 40.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: fill,
                borderRadius: BorderRadius.circular(13.r),
              ),
              child: Text(initial, style: AppText.bigInitial(17, onFill)),
            ),
            SizedBox(height: 6.h),
            Text(name, style: AppText.sideName),
            SizedBox(height: 6.h),
            Text('$score', style: AppText.bigScore),
            if (lead != null) ...[
              SizedBox(height: 6.h),
              Text(lead, style: AppText.leadTag(ink)),
            ],
          ],
        ),
      ),
    );
  }
}
