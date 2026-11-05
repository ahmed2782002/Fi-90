import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Round check badge that pops in on the corner of a selected option.
class SelectedCheck extends StatelessWidget {
  const SelectedCheck({
    super.key,
    required this.selected,
    required this.color,
    this.onColor = AppColors.leaderGoldInk,
  });

  final bool selected;
  final Color color;
  final Color onColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: selected ? 1 : 0,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutBack,
      child: Container(
        width: 22.r,
        height: 22.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: AppColors.s1, width: 2),
        ),
        child: Icon(Icons.check_rounded, size: 14.r, color: onColor),
      ),
    );
  }
}
