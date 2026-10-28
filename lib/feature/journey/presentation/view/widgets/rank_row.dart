import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class RankRow extends StatelessWidget {
  const RankRow({
    super.key,
    required this.rank,
    required this.name,
    required this.score,
  });

  final int rank;
  final String name;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        children: [
          SizedBox(width: 24, child: Text('$rank', style: AppText.rankIndex)),
          const SizedBox(width: 12),
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.s3,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Text(name.characters.first, style: AppText.rowInitial),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(name, style: AppText.rowName)),
          Text(score, style: AppText.rowScore),
        ],
      ),
    );
  }
}
