import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required this.controller,
    this.hint,
    this.readOnly = false,
    double? height,
    this.multiline = false,
    this.ltr = false,
    double? fontSize,
    this.accent,
    this.onSubmitted,
    this.weight = FontWeight.w600,
  }) : height = height ?? 52.r,
       fontSize = fontSize ?? 15.sp;

  final TextEditingController controller;
  final String? hint;
  final bool readOnly;
  final double height;
  final bool multiline;
  final bool ltr;
  final double fontSize;
  final Color? accent;
  final VoidCallback? onSubmitted;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(multiline ? 28.r : 999.r),
      borderSide: BorderSide(color: accent ?? AppColors.line2, width: 1.5),
    );
    final glow = accent;
    return Container(
      constraints: BoxConstraints(minHeight: multiline ? 150.r : height),
      decoration: glow == null
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(999.r),
              boxShadow: [
                BoxShadow(color: AppColors.tint(glow, .14), spreadRadius: 4),
              ],
            ),
      child: TextField(
        onSubmitted: onSubmitted == null ? null : (_) => onSubmitted!(),
        controller: controller,
        readOnly: readOnly,
        minLines: multiline ? 5 : 1,
        maxLines: multiline ? null : 1,
        textDirection: ltr ? TextDirection.ltr : null,
        textAlign: ltr && Directionality.of(context) == TextDirection.rtl
            ? TextAlign.right
            : TextAlign.start,
        cursorColor: AppColors.cy,
        style: AppText.fieldText(
          readOnly ? AppColors.mu : AppColors.tx,
          size: fontSize,
          weight: weight,
          height: multiline ? 1.8 : null,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppText.fieldText(AppColors.dim, size: fontSize),
          filled: true,
          fillColor: AppColors.s1,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: multiline ? 16.h : (height - fontSize * 1.6) / 2,
          ),
          enabledBorder: border,
          focusedBorder: border,
          border: border,
        ),
      ),
    );
  }
}
