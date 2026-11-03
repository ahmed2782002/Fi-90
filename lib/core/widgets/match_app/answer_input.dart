import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import '../app_text_field.dart';
import '../press_scale.dart';
import '../primary_button.dart';

class AnswerInput extends StatelessWidget {
  AnswerInput({
    super.key,
    required this.controller,
    required this.hint,
    required this.sendLabel,
    required this.onSend,
    this.accent,
    this.solidButton,
    double? height,
  }) : height = height ?? 56.r;

  final TextEditingController controller;
  final String hint;
  final String sendLabel;
  final VoidCallback onSend;
  final Color? accent;
  final Color? solidButton;
  final double height;

  @override
  Widget build(BuildContext context) {
    final solid = solidButton;
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            controller: controller,
            hint: hint,
            height: height,
            fontSize: 17.sp,
            weight: FontWeight.w500,
            accent: accent ?? AppColors.me,
            onSubmitted: onSend,
          ),
        ),
        SizedBox(width: 8.w),
        solid == null
            ? PrimaryButton(
                label: sendLabel,
                height: height,
                expand: false,
                style: AppText.actionButton(16),
                onTap: onSend,
              )
            : PressScale(
                onTap: onSend,
                child: Container(
                  height: height,
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: solid,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Text(
                    sendLabel,
                    style: AppText.actionButton(
                      16,
                      color: AppColors.comebackOn,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
