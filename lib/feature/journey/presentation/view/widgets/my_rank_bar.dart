import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class MyRankBar extends StatelessWidget {
  const MyRankBar({
    super.key,
    required this.rank,
    required this.name,
    required this.initial,
    required this.board,
    required this.score,
  });

  final String rank;
  final String name;
  final String initial;
  final String board;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.mix(AppColors.me, .14, AppColors.s1),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.me, width: 1.5),
      ),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 40),
            child: Text(
              rank,
              textDirection: TextDirection.ltr,
              style: AppText.myRank,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.me,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Text(initial, style: AppText.myInitial),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppText.myName),
                Text(board, style: AppText.myBoard),
              ],
            ),
          ),
          Text(score, style: AppText.rowScore),
        ],
      ),
    );
  }
}
