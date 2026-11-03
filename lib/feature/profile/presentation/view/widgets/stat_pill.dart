import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatPill extends StatelessWidget {
  const StatPill({
    super.key,
    required this.value,
    required this.label,
    this.color,
  });

  final String value;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(999.r),
          border: Border.all(color: AppColors.line),
        ),
        child: Column(
          children: [
            Text(value, style: AppText.statPillValue(color ?? AppColors.tx)),
            SizedBox(height: 5.h),
            Text(label, style: AppText.statPillLabel),
          ],
        ),
      ),
    );
  }
}
