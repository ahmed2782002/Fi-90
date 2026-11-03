import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/mini_fut_card.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PitchToken extends StatelessWidget {
  const PitchToken({
    super.key,
    required this.slotLabel,
    required this.emptyLabel,
    required this.freeLabel,
    this.player,
    this.price = 0,
    this.highlight,
  });

  final String slotLabel;
  final String emptyLabel;
  final String freeLabel;
  final AuctionPlayer? player;
  final int price;
  final Color? highlight;

  @override
  Widget build(BuildContext context) {
    final p = player;
    return SizedBox(
      width: 78.r,
      child: p == null
          ? Column(
              children: [
                Container(
                  width: 54.r,
                  height: 54.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.line2, width: 1.5),
                  ),
                  child: Text(slotLabel, style: AppText.slotLabel),
                ),
                SizedBox(height: 3.h),
                Text(emptyLabel, style: AppText.slotEmpty),
              ],
            )
          : Enter(
              fx: Fx.pop,
              duration: const Duration(milliseconds: 400),
              child: Column(
                children: [
                  MiniFutCard(
                    palette: p.palette,
                    rating: p.rating,
                    initial: p.short.of(context).characters.first,
                    highlight: highlight,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    p.short.of(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.tokenName,
                  ),
                  Text(
                    price > 0 ? '${price}M' : freeLabel,
                    textDirection: TextDirection.ltr,
                    style: AppText.tokenPrice(
                      price > 0 ? AppColors.mu : AppColors.okInk,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
