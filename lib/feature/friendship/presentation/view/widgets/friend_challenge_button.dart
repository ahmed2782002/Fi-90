import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class FriendChallengeButton extends StatelessWidget {
  const FriendChallengeButton({
    super.key,
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enabled ? null : AppColors.s2,
          gradient: enabled ? AppColors.grad : null,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: enabled ? AppColors.neon : AppColors.line,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: AppText.actionButton(
            13,
            color: enabled ? AppColors.white : AppColors.dim,
          ),
        ),
      ),
    );
  }
}
