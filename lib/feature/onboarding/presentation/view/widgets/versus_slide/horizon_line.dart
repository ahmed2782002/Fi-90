import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HorizonLine extends StatelessWidget {
  const HorizonLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.tint(AppColors.cy, 0),
            AppColors.cy,
            AppColors.tint(AppColors.cy, 0),
          ],
        ),
        boxShadow: [BoxShadow(color: AppColors.cy, blurRadius: 12)],
      ),
    );
  }
}
