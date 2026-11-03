import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/profile/mock_model/profile_data.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/xp_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeroCard extends StatelessWidget {
  const ProfileHeroCard({super.key, required this.profile, required this.name});

  final ProfileData profile;
  final String name;

  @override
  Widget build(BuildContext context) {
    final tag = BoxDecoration(
      color: AppColors.tint(AppColors.black, .2),
      borderRadius: BorderRadius.circular(8.r),
    );
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: AppColors.grad,
        borderRadius: BorderRadius.circular(34.r),
        border: Border.all(color: AppColors.neon, width: 1.5),
        boxShadow: AppShadows.glow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 72.r,
                height: 72.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.me,
                  borderRadius: BorderRadius.circular(28.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.tint(AppColors.white, .35),
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Text(
                  name.characters.first,
                  style: AppText.profileInitial,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppText.profileName),
                    SizedBox(height: 6.h),
                    Wrap(
                      spacing: 6.r,
                      children: [
                        for (final label in [
                          'LV ${profile.level}',
                          context.tr(profile.tierKey),
                        ])
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 9.w,
                              vertical: 3.h,
                            ),
                            decoration: tag,
                            child: Text(label, style: AppText.profileTag),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(profile.rank, style: AppText.profileRank),
                  SizedBox(height: 3.h),
                  Text(
                    context.tr(AppStrings.worldwide),
                    style: AppText.profileRankLabel,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          XpProgress(
            xp: profile.xp,
            target: profile.xpTarget,
            progress: profile.xpProgress,
          ),
        ],
      ),
    );
  }
}
