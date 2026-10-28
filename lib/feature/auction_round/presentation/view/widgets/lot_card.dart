import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/fut_card.dart';
import 'package:flutter/material.dart';

class LotCard extends StatelessWidget {
  const LotCard({
    super.key,
    required this.position,
    required this.statLabels,
    required this.clues,
    required this.revealed,
    required this.pendingLabel,
  });

  final String position;
  final List<String> statLabels;
  final List<String> clues;
  final int revealed;
  final String pendingLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 14),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 164,
            height: 243,
            child: FittedBox(
              child: FutCard(
                palette: AppColors.futMystery,
                rating: '?',
                position: position,
                name: '???',
                initial: '?',
                statLabels: statLabels,
                statValues: const ['??', '??', '??', '??', '??', '??'],
              ),
            ),
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < clues.length; i++) ...[
            if (i > 0) const SizedBox(height: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              constraints: const BoxConstraints(minHeight: 40),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: i < revealed ? AppColors.s2 : null,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: i < revealed ? AppColors.line2 : AppColors.line,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: i < revealed ? AppColors.gold : AppColors.s3,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${i + 1}',
                      style: AppText.clueNumber(
                        i < revealed ? AppColors.stickerInk : AppColors.dim,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      i < revealed ? clues[i] : pendingLabel,
                      style: AppText.clueText(
                        i < revealed ? AppColors.tx : AppColors.dim,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
