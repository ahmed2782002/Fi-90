import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PerformanceRow extends StatelessWidget {
  const PerformanceRow({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 78.r,
          child: Text(label, style: AppText.performanceLabel),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9.r),
            child: LinearProgressIndicator(
              value: value / 100,
              minHeight: 8.r,
              color: color,
              backgroundColor: AppColors.s3,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        SizedBox(
          width: 34.r,
          child: Text(
            '$value%',
            textAlign: TextAlign.end,
            style: AppText.performanceValue,
          ),
        ),
      ],
    );
  }
}
