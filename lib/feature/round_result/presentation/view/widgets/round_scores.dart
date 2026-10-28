import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/round_result/presentation/view/widgets/side_score_card.dart';
import 'package:flutter/material.dart';

class RoundScores extends StatelessWidget {
  const RoundScores({
    super.key,
    required this.meName,
    required this.meScore,
    required this.oppName,
    required this.oppInitial,
    required this.oppScore,
    required this.aheadLabel,
  });

  final String meName;
  final int meScore;
  final String oppName;
  final String oppInitial;
  final int oppScore;
  final String aheadLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SideScoreCard(
          name: meName,
          initial: meName.characters.first,
          score: meScore,
          fill: AppColors.me,
          onFill: AppColors.meOn,
          ink: AppColors.meInk,
          leadLabel: meScore > oppScore ? aheadLabel : null,
        ),
        const SizedBox(width: 10),
        SideScoreCard(
          name: oppName,
          initial: oppInitial,
          score: oppScore,
          fill: AppColors.op,
          onFill: AppColors.opOn,
          ink: AppColors.opInk,
          leadLabel: oppScore > meScore ? aheadLabel : null,
        ),
      ],
    );
  }
}
