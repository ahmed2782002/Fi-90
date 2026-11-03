import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/performance_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PerformanceCard extends StatelessWidget {
  const PerformanceCard({super.key, required this.items});

  final List<({String modeKey, int value, Color color})> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(AppStrings.performanceTitle),
            style: AppText.cardTitle,
          ),
          for (final item in items) ...[
            SizedBox(height: 12.h),
            PerformanceRow(
              label: context.tr(item.modeKey),
              value: item.value,
              color: item.color,
            ),
          ],
        ],
      ),
    );
  }
}
