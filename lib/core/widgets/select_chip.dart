import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class SelectChip extends StatelessWidget {
  const SelectChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.gradient = false,
    this.height = 40,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool gradient;
  final double height;

  @override
  Widget build(BuildContext context) {
    final grad = selected && gradient;
    return PressScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: grad
              ? null
              : selected
              ? AppColors.tint(AppColors.cy, .16)
              : AppColors.s1,
          gradient: grad ? AppColors.grad : null,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected
                ? (gradient ? AppColors.neon : AppColors.cy)
                : AppColors.line,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          style: AppText.selectChip(
            grad
                ? AppColors.white
                : selected
                ? AppColors.tx
                : AppColors.tx2,
          ),
        ),
      ),
    );
  }
}
