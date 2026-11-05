import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_options.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/setup/selected_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A collectible-style power card the player can take into the auction.
class PowerCardTile extends StatelessWidget {
  const PowerCardTile({
    super.key,
    required this.card,
    required this.selected,
    required this.onTap,
  });

  final AuctionPowerCard card;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final golden = card == AuctionPowerCard.golden;
    final palette = golden ? AppColors.futGold : AppColors.futElite;
    final ink = golden ? AppColors.stickerInk : AppColors.white;
    final glow = golden ? AppColors.goldGlow : AppColors.neon;
    return PressScale(
      onTap: onTap,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 220),
        opacity: selected ? 1 : .55,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.r),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: golden
                  ? palette.frame
                  : [AppColors.neon, AppColors.pri, AppColors.neon],
            ),
            boxShadow: selected
                ? [BoxShadow(color: AppColors.tint(glow, .4), blurRadius: 18)]
                : null,
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: palette.background,
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40.r,
                          height: 40.r,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.tint(
                              golden ? AppColors.white : AppColors.neon,
                              golden ? .45 : .16,
                            ),
                            border: Border.all(color: AppColors.tint(ink, .35)),
                          ),
                          child: SvgPicture.asset(
                            card.icon,
                            width: 20.r,
                            height: 20.r,
                            colorFilter: ColorFilter.mode(
                              golden ? AppColors.stickerInk : AppColors.neon,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.tint(ink, .14),
                            borderRadius: BorderRadius.circular(999.r),
                          ),
                          child: Text(
                            context.tr(AppStrings.oneUse),
                            style: AppText.powerTag(ink),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      context.tr(card.titleKey),
                      style: AppText.powerTitle(ink),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      context.tr(card.hintKey),
                      maxLines: 3,
                      style: AppText.powerHint(AppColors.tint(ink, .78)),
                    ),
                  ],
                ),
                PositionedDirectional(
                  top: -16.h,
                  end: -16.w,
                  child: SelectedCheck(
                    selected: selected,
                    color: golden ? AppColors.white : AppColors.neon,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
