import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_options.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/setup/selected_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Power card option in the horizontal card row: art on top, name and what
/// it does underneath. A `null` [card] is the "go in without a card" option.
class PowerCardTile extends StatelessWidget {
  const PowerCardTile({
    super.key,
    required this.card,
    required this.selected,
    required this.onTap,
  });

  static double get width => 124.w;

  final AuctionPowerCard? card;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final card = this.card;
    final accent = card?.accent ?? AppColors.paleBlue;
    final radius = BorderRadius.circular(22.r);
    return PressScale(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              padding: EdgeInsets.all(selected ? 3 : 1.2),
              decoration: BoxDecoration(
                borderRadius: radius,
                color: selected ? accent : AppColors.line2,
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: AppColors.tint(accent, .45),
                          blurRadius: 16,
                        ),
                      ]
                    : null,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 220),
                        opacity: selected ? 1 : .75,
                        child: SvgPicture.asset(
                          card?.image ?? AppImages.powerNone,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  if (card != null)
                    PositionedDirectional(
                      bottom: 7.r,
                      start: 7.r,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 1.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.tint(AppColors.black, .45),
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                        child: Text(
                          context.tr(AppStrings.oneUse),
                          style: AppText.powerTag(AppColors.white),
                        ),
                      ),
                    ),
                  PositionedDirectional(
                    top: 6.r,
                    end: 6.r,
                    child: SelectedCheck(selected: selected, color: accent),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              context.tr(card?.titleKey ?? AppStrings.noCard),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.powerTitle(selected ? accent : AppColors.tx)
                  .copyWith(fontSize: 14.sp),
            ),
            SizedBox(height: 2.h),
            Text(
              context.tr(card?.hintKey ?? AppStrings.noCardHint),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppText.powerHint(AppColors.mu),
            ),
          ],
        ),
      ),
    );
  }
}
