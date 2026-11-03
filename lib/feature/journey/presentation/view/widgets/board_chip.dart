import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardChip extends StatelessWidget {
  const BoardChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36.r,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          color: selected ? AppColors.tx : AppColors.s1,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.line),
        ),
        child: Text(
          label,
          style: AppText.filter(selected ? AppColors.bg : AppColors.tx2),
        ),
      ),
    );
  }
}
