import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoadBar extends StatelessWidget {
  const LoadBar({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 4,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.s3,
        borderRadius: BorderRadius.circular(9),
      ),
      alignment: AlignmentDirectional.centerStart,
      child: FractionallySizedBox(
        widthFactor: progress,
        heightFactor: 1,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [AppColors.pri, AppColors.gold]),
          ),
        ),
      ),
    );
  }
}
