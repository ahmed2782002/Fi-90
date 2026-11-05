import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_options.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/setup/selected_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SquadOptionCard extends StatelessWidget {
  const SquadOptionCard({
    super.key,
    required this.squad,
    required this.selected,
    required this.onTap,
  });

  final AuctionSize squad;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.gold;
    return PressScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: EdgeInsets.fromLTRB(12.w, 14.h, 12.w, 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: selected
                ? [AppColors.mix(accent, .18, AppColors.s2), AppColors.s1]
                : [AppColors.s2, AppColors.s1],
          ),
          border: Border.all(
            color: selected ? accent : AppColors.line2,
            width: selected ? 2 : 1.2,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.tint(AppColors.goldGlow, .28),
                    blurRadius: 20,
                  ),
                ]
              : null,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                _Formation(shape: squad.shape, selected: selected),
                SizedBox(height: 12.h),
                Text(context.tr(squad.titleKey), style: AppText.setupVersus),
                SizedBox(height: 2.h),
                Text(
                  context.tr(squad.hintKey),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.meta,
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.tint(accent, selected ? .18 : .1),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.tr(AppStrings.budgetLabel),
                        style: AppText.powerTag(AppColors.goldInk),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '${squad.budget}M',
                        textDirection: TextDirection.ltr,
                        style: AppText.budgetBig.copyWith(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            PositionedDirectional(
              top: -4.h,
              end: -2.w,
              child: SelectedCheck(selected: selected, color: accent),
            ),
          ],
        ),
      ),
    );
  }
}

/// Small pitch with one dot per player laid out in [shape] plus a keeper.
class _Formation extends StatelessWidget {
  const _Formation({required this.shape, required this.selected});

  final String shape;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final lines = [...shape.split('-').map(int.parse).toList().reversed, 1];
    final pitch = AppColors.mix(
      AppColors.ok,
      selected ? .22 : .12,
      AppColors.s1,
    );
    return Container(
      height: 82.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: pitch,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.tint(AppColors.white, .12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final (i, count) in lines.indexed)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var p = 0; p < count; p++)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200 + i * 60),
                    width: 9.r,
                    height: 9.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == lines.length - 1
                          ? AppColors.goldInk
                          : selected
                          ? AppColors.white
                          : AppColors.tx2,
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: AppColors.tint(AppColors.white, .45),
                                blurRadius: 6,
                              ),
                            ]
                          : null,
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
