import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class VsBadge extends StatelessWidget {
  const VsBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 78,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.grad,
        border: Border.all(color: AppColors.cy, width: 2),
        boxShadow: [
          const BoxShadow(color: AppColors.bg, spreadRadius: 6),
          BoxShadow(color: AppColors.tint(AppColors.cy, .6), blurRadius: 34),
        ],
      ),
      child: Text('VS', style: AppText.versus),
    );
  }
}
