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
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    this.onCustomBid,
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

  /// Opens the number pad to type an exact bid (only on the player's turn).
  final VoidCallback? onCustomBid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28.r),
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
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: mode == BidMode.mine && canRaise
                          ? onCustomBid
                          : null,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${price}M',
                            textDirection: TextDirection.ltr,
                            style: AppText.bidPrice,
                          ),
                          if (mode == BidMode.mine &&
                              canRaise &&
                              onCustomBid != null) ...[
                            SizedBox(width: 6.w),
                            Icon(
                              Icons.edit_rounded,
                              size: 18.r,
                              color: AppColors.gold,
                            ),
                          ],
                        ],
                      ),
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
          SizedBox(height: 10.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(9.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6.r,
              color: urgent ? AppColors.bad : AppColors.gold,
              backgroundColor: AppColors.s3,
            ),
          ),
          SizedBox(height: 10.h),
          if (mode == BidMode.mine)
            BidActions(
              canRaise: canRaise,
              hint: canRaise && onCustomBid != null
                  ? '$hint\n${context.tr(AppStrings.customBidTapHint)}'
                  : hint,
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
                  ? SpinRing(size: 14.r, color: AppColors.goldGlow, width: 2.r)
                  : null,
            ),
        ],
      ),
    );
  }
}
