import 'package:fii90/core/localization/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/player_stat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPlayerCardBody extends StatelessWidget {
  const NewPlayerCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 14.h, 12.w, 12.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text('1', style: AppText.playerLevel),
                    Text(
                      context.tr(AppStrings.levelShort),
                      style: AppText.playerLevelLabel,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.tint(AppColors.black, .28),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Text(
                    context.tr(AppStrings.newPlayer),
                    style: AppText.playerTag,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 76.r),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.tint(AppColors.black, .2),
                    border: Border.all(
                      color: AppColors.tint(AppColors.cy, .6),
                      width: 2,
                    ),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: 64 / 72,
                    heightFactor: 64 / 72,
                    child: SvgPicture.asset(AppIcons.person),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(context.tr(AppStrings.isItYou), style: AppText.playerHeadline),
          SizedBox(height: 8.h),
          Container(height: 1.r, color: AppColors.tint(AppColors.white, .2)),
          SizedBox(height: 8.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlayerStat(value: '0', label: AppStrings.statMatches),
              PlayerStat(value: '0', label: AppStrings.statXp),
              PlayerStat(value: '—', label: AppStrings.statRank),
            ],
          ),
        ],
      ),
    );
  }
}
