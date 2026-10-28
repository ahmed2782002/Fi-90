import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class RoundSummaryRow extends StatelessWidget {
  const RoundSummaryRow({
    super.key,
    required this.mode,
    required this.accent,
    required this.detail,
    required this.winner,
    required this.winnerColor,
    required this.points,
  });

  final String mode;
  final Color accent;
  final String detail;
  final String winner;
  final Color winnerColor;
  final String points;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 30,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mode, style: AppText.rowTitle),
                Text(detail, style: AppText.meta),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(winner, style: AppText.summaryWinner(winnerColor)),
          const SizedBox(width: 10),
          SizedBox(
            width: 34,
            child: Text(
              points,
              textAlign: TextAlign.end,
              textDirection: TextDirection.ltr,
              style: AppText.summaryPoints,
            ),
          ),
        ],
      ),
    );
  }
}
