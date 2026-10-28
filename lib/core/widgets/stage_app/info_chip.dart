import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_shadows.dart';

class InfoChip extends StatelessWidget {
  const InfoChip({
    super.key,
    required this.label,
    required this.leading,
    required this.style,
    this.border,
    this.borderWidth = 1,
    this.glow,
    this.height = 34,
    this.hPad = 12,
  });

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
        borderRadius: BorderRadius.circular(999),
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
          const SizedBox(width: 6),
          Text(label, style: style),
        ],
      ),
    );
  }
}
