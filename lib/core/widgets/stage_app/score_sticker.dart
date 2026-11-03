import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class ScoreSticker extends StatelessWidget {
  const ScoreSticker({
    super.key,
    required this.text,
    required this.style,
    this.rotateDeg = -5,
    this.ring = 2.5,
  });

  final String text;
  final TextStyle style;
  final double rotateDeg;
  final double ring;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.skewX(-10 * math.pi / 180)
        ..rotateZ(rotateDeg * math.pi / 180),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: AppColors.stk, spreadRadius: ring),
            BoxShadow(
              color: AppColors.tint(AppColors.gold, .4),
              offset: const Offset(0, 10),
              blurRadius: 24,
            ),
          ],
        ),
        child: Text(text, textDirection: TextDirection.ltr, style: style),
      ),
    );
  }
}
