import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_options.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/setup/selected_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// League option in the horizontal league row: emblem art, name and hint.
class LeagueTile extends StatelessWidget {
  const LeagueTile({
    super.key,
    required this.league,
    required this.selected,
    required this.onTap,
  });

  static double get width => 96.w;

  final AuctionLeague league;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final accent = league.accent;
    final radius = BorderRadius.circular(20.r);
    return PressScale(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
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
                          blurRadius: 14,
                        ),
                      ]
                    : null,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.r),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 220),
                        opacity: selected ? 1 : .72,
                        child: SvgPicture.asset(
                          league.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    top: 5.r,
                    end: 5.r,
                    child: SelectedCheck(
                      selected: selected,
                      color: accent,
                      onColor: AppColors.leaderGoldInk,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                context.tr(league.nameKey),
                maxLines: 1,
                style: AppText.leagueName,
              ),
            ),
            Text(
              context.tr(league.hintKey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.meta.copyWith(
                fontSize: 11.sp,
                color: selected ? accent : AppColors.mu,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
