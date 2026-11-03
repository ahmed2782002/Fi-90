import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_shadows.dart';
import '../theme/app_text.dart';
import 'press_scale.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    double? height,
    this.style,
    this.expand = true,
    double? horizontalPadding,
  }) : height = height ?? 58.r,
       horizontalPadding = horizontalPadding ?? 18.w;

  final String label;
  final VoidCallback onTap;
  final double height;
  final TextStyle? style;
  final bool expand;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: onTap,
      child: Container(
        height: height,
        width: expand ? double.infinity : null,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: expand ? 0 : horizontalPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999.r),
          border: Border.all(color: AppColors.neon, width: 1.5),
          gradient: AppColors.grad,
          boxShadow: AppShadows.glow,
        ),
        child: Text(label, style: style ?? AppText.button),
      ),
    );
  }
}
