import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageDots extends StatelessWidget {
  const PageDots({super.key, required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            height: 8.r,
            width: i == index ? 26.r : 8.r,
            decoration: BoxDecoration(
              color: i == index ? AppColors.pri : AppColors.s3,
              borderRadius: BorderRadius.circular(9.r),
            ),
          ),
      ],
    );
  }
}
