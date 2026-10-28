import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';

class PointsBadge extends StatelessWidget {
  const PointsBadge({super.key, required this.label, this.size = 22});

  final String label;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.skewX(-.1763),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size * .8,
          vertical: size * .35,
        ),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.stk, width: 2),
          boxShadow: [
            BoxShadow(
              color: AppColors.tint(AppColors.gold, .35),
              offset: const Offset(0, 8),
              blurRadius: 20,
            ),
          ],
        ),
        child: Text(
          label,
          textDirection: TextDirection.ltr,
          style: AppText.points(size),
        ),
      ),
    );
  }
}
