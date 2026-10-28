import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:flutter/material.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({
    super.key,
    required this.value,
    required this.onTap,
    required this.label,
  });

  final bool value;
  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      toggled: value,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 52,
          height: 32,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: value ? null : AppColors.s3,
            gradient: value ? AppColors.grad : null,
            borderRadius: BorderRadius.circular(999),
            boxShadow: value ? AppShadows.toggle : const [],
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment: value
                ? AlignmentDirectional.centerStart
                : AlignmentDirectional.centerEnd,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.tint(AppColors.black, .25),
                    offset: const Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
