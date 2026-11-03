import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JudgeButtons extends StatelessWidget {
  JudgeButtons({
    super.key,
    required this.okLabel,
    required this.badLabel,
    required this.onOk,
    required this.onBad,
    double? height,
  }) : height = height ?? 58.r;

  final String okLabel;
  final String badLabel;
  final VoidCallback onOk;
  final VoidCallback onBad;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.r,
      children: [
        Expanded(
          child: PressScale(
            onTap: onOk,
            child: Container(
              height: height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.ok,
                borderRadius: BorderRadius.circular(999.r),
              ),
              child: Text(okLabel, style: AppText.judge(AppColors.checkInk)),
            ),
          ),
        ),
        Expanded(
          child: PressScale(
            onTap: onBad,
            child: Container(
              height: height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.tint(AppColors.bad, .1),
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(color: AppColors.bad, width: 1.5),
              ),
              child: Text(badLabel, style: AppText.judge(AppColors.badInk)),
            ),
          ),
        ),
      ],
    );
  }
}
