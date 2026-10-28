import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class RoundAction extends StatelessWidget {
  const RoundAction({
    super.key,
    required this.label,
    required this.glyph,
    required this.style,
    required this.onTap,
    this.filled,
  });

  final String label;
  final String glyph;
  final TextStyle style;
  final VoidCallback onTap;
  final Color? filled;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: PressScale(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: filled,
            shape: BoxShape.circle,
            border: filled == null ? Border.all(color: AppColors.line2) : null,
          ),
          child: Text(glyph, style: style),
        ),
      ),
    );
  }
}
