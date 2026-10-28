import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class AuctionTopBar extends StatelessWidget {
  const AuctionTopBar({
    super.key,
    required this.meLabel,
    required this.meBudget,
    required this.oppLabel,
    required this.oppBudget,
    required this.stage,
  });

  final String meLabel;
  final int meBudget;
  final String oppLabel;
  final int oppBudget;
  final String stage;

  @override
  Widget build(BuildContext context) {
    final sides = [
      (meLabel, meBudget, AppColors.me),
      (oppLabel, oppBudget, AppColors.op),
    ];
    return Row(
      children: [
        for (final (i, (label, budget, dot)) in sides.indexed) ...[
          if (i == 1) ...[
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.tint(AppColors.gold, .14),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(stage, style: AppText.stagePill),
            ),
            const Spacer(),
          ],
          Container(
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.s1,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.line),
              boxShadow: AppShadows.sh1,
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
                ),
                const SizedBox(width: 7),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: AppText.budgetLabel),
                    Text(
                      '${budget}M',
                      textDirection: TextDirection.ltr,
                      style: AppText.budgetValue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
