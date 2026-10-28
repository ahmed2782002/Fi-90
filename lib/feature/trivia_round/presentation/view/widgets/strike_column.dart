import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class StrikeColumn extends StatelessWidget {
  const StrikeColumn({
    super.key,
    required this.strikes,
    required this.chipLabel,
    required this.chipColor,
    required this.chipInk,
    required this.struck,
    this.end = false,
  });

  final int strikes;
  final String chipLabel;
  final Color chipColor;
  final Color chipInk;
  final bool struck;
  final bool end;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: end
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < 3; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 20,
                height: 20,
                margin: const EdgeInsetsDirectional.only(end: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: i < strikes ? AppColors.bad : AppColors.s2,
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: i < strikes ? AppColors.bad : AppColors.line2,
                    width: 1.5,
                  ),
                ),
                child: i < strikes
                    ? Text('✕', style: AppText.strikeMark)
                    : null,
              ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: chipColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            chipLabel,
            style: AppText.passChip(chipInk, struck: struck),
          ),
        ),
      ],
    );
  }
}
