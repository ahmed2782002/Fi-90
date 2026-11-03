import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/home/presentation/view/widgets/hero_backdrop.dart';
import 'package:fii90/feature/home/presentation/view/widgets/online_players_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchHeroCard extends StatelessWidget {
  const MatchHeroCard({
    super.key,
    required this.onlinePlayers,
    required this.onStart,
  });

  final String onlinePlayers;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 230.r),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: AppColors.grad,
        borderRadius: BorderRadius.circular(34.r),
        border: Border.all(color: AppColors.neon, width: 1.5),
        boxShadow: AppShadows.glow,
      ),
      child: Stack(
        children: [
          const Positioned.fill(child: HeroBackdrop()),
          Padding(
            padding: EdgeInsets.all(22.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: OnlinePlayersPill(count: onlinePlayers),
                ),
                SizedBox(height: 16.h),
                Text(
                  context.tr(AppStrings.heroTitle),
                  style: AppText.heroTitle,
                ),
                SizedBox(height: 4.h),
                Text(
                  context.tr(AppStrings.heroSubtitle),
                  style: AppText.heroSubtitle,
                ),
                SizedBox(height: 16.h),
                PressScale(
                  onTap: onStart,
                  child: Container(
                    height: 58.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(999.r),
                      boxShadow: AppShadows.raised,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.tr(AppStrings.startMatch),
                          style: AppText.heroButton,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          context.tr(AppStrings.forwardArrow),
                          style: AppText.heroArrow,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
