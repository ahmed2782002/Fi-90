import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
            margin: const EdgeInsets.symmetric(horizontal: 3),
            height: 8,
            width: i == index ? 26 : 8,
            decoration: BoxDecoration(
              color: i == index ? AppColors.pri : AppColors.s3,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
      ],
    );
  }
}
