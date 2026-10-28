import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class FinalScoreCard extends StatelessWidget {
  const FinalScoreCard({
    super.key,
    required this.meName,
    required this.meScore,
    required this.oppName,
    required this.oppInitial,
    required this.oppScore,
  });

  final String meName;
  final int meScore;
  final String oppName;
  final String oppInitial;
  final int oppScore;

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final players = [
      (meName, meName.characters.first, AppColors.me, AppColors.meOn),
      (oppName, oppInitial, AppColors.op, AppColors.opOn),
    ];
    final left = rtl ? oppScore : meScore;
    final right = rtl ? meScore : oppScore;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Row(
        children: [
          for (final (i, (name, initial, fill, onFill)) in players.indexed) ...[
            if (i == 1)
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '$left'),
                    TextSpan(text: '  –  ', style: AppText.finalDash),
                    TextSpan(text: '$right'),
                  ],
                ),
                textDirection: TextDirection.ltr,
                style: AppText.finalScore,
              ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: fill,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(initial, style: AppText.bigInitial(21, onFill)),
                  ),
                  const SizedBox(height: 6),
                  Text(name, style: AppText.lastOpponent),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
