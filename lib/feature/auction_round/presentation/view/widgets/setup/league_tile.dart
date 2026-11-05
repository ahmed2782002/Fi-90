import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_options.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/setup/selected_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeagueTile extends StatelessWidget {
  const LeagueTile({
    super.key,
    required this.league,
    required this.selected,
    required this.onTap,
  });

  final AuctionLeague league;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final accent = league.colors.first;
    return PressScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: EdgeInsets.fromLTRB(8.w, 12.h, 8.w, 10.h),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.mix(accent, .14, AppColors.s2)
              : AppColors.s2,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? accent : AppColors.line,
            width: selected ? 2 : 1.2,
          ),
          boxShadow: selected
              ? [BoxShadow(color: AppColors.tint(accent, .3), blurRadius: 16)]
              : null,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Crest(league: league, selected: selected),
                  SizedBox(height: 8.h),
                  Text(
                    context.tr(league.nameKey),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.leagueName,
                  ),
                  Text(
                    context.tr(league.hintKey),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.meta.copyWith(fontSize: 11.sp),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              top: -4.h,
              end: 0,
              child: SelectedCheck(
                selected: selected,
                color: accent,
                onColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Crest extends StatelessWidget {
  const _Crest({required this.league, required this.selected});

  final AuctionLeague league;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: selected ? 0 : -.03,
      duration: const Duration(milliseconds: 260),
      child: Container(
        width: 44.r,
        height: 48.r,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
              bottomLeft: Radius.circular(22.r),
              bottomRight: Radius.circular(22.r),
            ),
            side: BorderSide(
              color: AppColors.tint(AppColors.white, .55),
              width: 1.5,
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: league.colors,
          ),
          shadows: [
            BoxShadow(
              color: AppColors.tint(league.colors.last, .5),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Text(
          league.code,
          textDirection: TextDirection.ltr,
          style: AppText.leagueCode,
        ),
      ),
    );
  }
}
