import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class BankLadderCard extends StatelessWidget {
  const BankLadderCard({
    super.key,
    required this.ladder,
    required this.chain,
    required this.number,
    required this.total,
    required this.pot,
    required this.canBank,
    required this.onBank,
  });

  final List<int> ladder;
  final int chain;
  final int number;
  final int total;
  final int pot;
  final bool canBank;
  final VoidCallback onBank;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(AppStrings.pointsLadder),
                style: AppText.listHeader,
              ),
              Text(
                context.tr(AppStrings.questionOf, args: ['$number', '$total']),
                style: AppText.cardCaption,
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 6,
              children: [
                for (final (i, v) in ladder.indexed)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    constraints: const BoxConstraints(minWidth: 44),
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: i < chain
                          ? AppColors.gold
                          : i == chain
                          ? AppColors.tint(AppColors.gold, .14)
                          : AppColors.s2,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: i <= chain ? AppColors.gold : AppColors.line,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      '$v',
                      style: AppText.ladderStep(
                        i < chain
                            ? AppColors.stickerInk
                            : i == chain
                            ? AppColors.goldInk
                            : AppColors.mu,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(AppStrings.potInAir),
                      style: AppText.pointsCaption,
                    ),
                    Text('$pot', style: AppText.bidPrice),
                  ],
                ),
              ),
              Opacity(
                opacity: canBank ? 1 : .5,
                child: PressScale(
                  onTap: onBank,
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.goldDeep,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      context.tr(AppStrings.bankIt),
                      style: AppText.judge(AppColors.stickerInk),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
