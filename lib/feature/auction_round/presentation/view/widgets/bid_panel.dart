import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/spin_ring.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/bid_actions.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_state.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/bid_status_bar.dart';
import 'package:flutter/material.dart';

class BidPanel extends StatelessWidget {
  const BidPanel({
    super.key,
    required this.price,
    required this.opened,
    required this.holder,
    required this.holderColor,
    required this.progress,
    required this.urgent,
    required this.mode,
    required this.canRaise,
    required this.hint,
    required this.opponent,
    required this.onRaise,
    required this.onPass,
  });

  final int price;
  final bool opened;
  final String holder;
  final Color holderColor;
  final double progress;
  final bool urgent;
  final BidMode mode;
  final bool canRaise;
  final String hint;
  final String opponent;
  final VoidCallback onRaise;
  final VoidCallback onPass;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(
                        opened
                            ? AppStrings.currentPrice
                            : AppStrings.openingPrice,
                      ),
                      style: AppText.budgetLabel,
                    ),
                    Text(
                      '${price}M',
                      textDirection: TextDirection.ltr,
                      style: AppText.bidPrice,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    context.tr(AppStrings.highestBid),
                    style: AppText.budgetLabel,
                  ),
                  Text(holder, style: AppText.holderName(holderColor)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              color: urgent ? AppColors.bad : AppColors.gold,
              backgroundColor: AppColors.s3,
            ),
          ),
          const SizedBox(height: 10),
          if (mode == BidMode.mine)
            BidActions(
              canRaise: canRaise,
              hint: hint,
              onRaise: onRaise,
              onPass: onPass,
            )
          else
            BidStatusBar(
              label: switch (mode) {
                BidMode.waiting => context.tr(AppStrings.opensAfterClues),
                BidMode.theirs => context.tr(
                  AppStrings.oppThinkingBid,
                  args: [opponent],
                ),
                _ => context.tr(AppStrings.cardsRevealing),
              },
              opponent: mode == BidMode.theirs,
              leading: mode == BidMode.waiting
                  ? const SpinRing(
                      size: 14,
                      color: AppColors.goldGlow,
                      width: 2,
                    )
                  : null,
            ),
        ],
      ),
    );
  }
}
