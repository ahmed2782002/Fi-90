import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_shadows.dart';

class InfoChip extends StatelessWidget {
  InfoChip({
    super.key,
    required this.label,
    required this.leading,
    required this.style,
    this.border,
    this.borderWidth = 1,
    this.glow,
    double? height,
    double? hPad,
  }) : height = height ?? 34.r,
       hPad = hPad ?? 12.w;

  final String label;
  final Widget leading;
  final TextStyle style;
  final Color? border;
  final double borderWidth;
  final Color? glow;
  final double height;
  final double hPad;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: hPad),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(999.r),
        border: Border.all(
          color: border ?? AppColors.line2,
          width: borderWidth,
        ),
        boxShadow: glow == null
            ? AppShadows.sh1
            : [BoxShadow(color: AppColors.tint(glow!, .3), blurRadius: 10)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leading,
          SizedBox(width: 6.w),
          Text(label, style: style),
        ],
      ),
    );
  }
}
