import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_options.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/setup/selected_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Match format option: artwork banner, name, short hint and its budget.
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
    final radius = BorderRadius.circular(22.r);
    return PressScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.mix(accent, .1, AppColors.s1)
              : AppColors.s1,
          borderRadius: radius,
          border: Border.all(
            color: selected ? accent : AppColors.line,
            width: selected ? 2 : 1.2,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.tint(AppColors.goldGlow, .3),
                    blurRadius: 18,
                  ),
                ]
              : null,
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 3 / 2,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 220),
                      opacity: selected ? 1 : .7,
                      child: SvgPicture.asset(squad.image, fit: BoxFit.cover),
                    ),
                  ),
                  PositionedDirectional(
                    top: 8.r,
                    end: 8.r,
                    child: SelectedCheck(selected: selected, color: accent),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 10.h),
                child: Column(
                  children: [
                    Text(
                      context.tr(squad.titleKey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.powerTitle(AppColors.tx),
                    ),
                    Text(
                      context.tr(squad.hintKey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.meta.copyWith(fontSize: 11.sp),
                    ),
                    SizedBox(height: 8.h),
                    _Budget(budget: squad.budget, selected: selected),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Budget extends StatelessWidget {
  const _Budget({required this.budget, required this.selected});

  final int budget;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: AppColors.tint(AppColors.gold, selected ? .18 : .08),
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
            '${budget}M',
            textDirection: TextDirection.ltr,
            style: AppText.budgetBig.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
