import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/stage_app/dot.dart';
import 'package:flutter/material.dart';

class MatchTimer extends StatelessWidget {
  const MatchTimer({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 34,
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.line2),
        boxShadow: AppShadows.sh1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: AppText.timer),
          const SizedBox(width: 6),
          Dot(AppColors.bad, size: 8, glow: true),
        ],
      ),
    );
  }
}
