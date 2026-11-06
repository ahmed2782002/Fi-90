import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Numbered section title with an optional hint and the current pick.
class SetupSectionHeader extends StatelessWidget {
  const SetupSectionHeader({
    super.key,
    required this.step,
    required this.title,
    this.hint,
    this.value,
  });

  final int step;
  final String title;
  final String? hint;

  /// What is currently picked in this section, shown at the end of the row.
  final String? value;

  @override
  Widget build(BuildContext context) {
    final hint = this.hint;
    final value = this.value;
    return Row(
      children: [
        Container(
          width: 24.r,
          height: 24.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.goldInk, AppColors.gold],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.tint(AppColors.goldGlow, .35),
                blurRadius: 10,
              ),
            ],
          ),
          child: Text('$step', style: AppText.setupStep),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppText.setupLabel),
              if (hint != null)
                Text(
                  hint,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.meta.copyWith(fontSize: 11.sp),
                ),
            ],
          ),
        ),
        if (value != null)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Container(
              key: ValueKey(value),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: AppColors.s2,
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(color: AppColors.line),
              ),
              child: Text(
                value,
                style: AppText.powerTag(AppColors.tx2)
                    .copyWith(fontSize: 11.sp),
              ),
            ),
          ),
      ],
    );
  }
}
