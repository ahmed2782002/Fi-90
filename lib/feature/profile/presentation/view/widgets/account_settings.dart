import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/settings_app/settings_group.dart';
import 'package:fii90/core/widgets/settings_app/settings_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({
    super.key,
    required this.coins,
    required this.soundHint,
    required this.planHint,
    required this.friendsHint,
    required this.requests,
    required this.onEdit,
    required this.onSound,
    required this.onCoins,
    required this.onPlans,
    required this.onFriends,
  });

  final int coins;
  final String soundHint;
  final String planHint;
  final String friendsHint;
  final int requests;
  final VoidCallback onEdit;
  final VoidCallback onSound;
  final VoidCallback onCoins;
  final VoidCallback onPlans;
  final VoidCallback onFriends;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsGroup(
          title: context.tr(AppStrings.groupAccount),
          children: [
            SettingsRow(
              icon: AppIcons.profileUser,
              title: context.tr(AppStrings.profileEdit),
              subtitle: context.tr(AppStrings.profileEditHint),
              onTap: onEdit,
            ),
            SettingsRow(
              icon: AppIcons.sound,
              title: context.tr(AppStrings.sound),
              subtitle: soundHint,
              onTap: onSound,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SettingsGroup(
          title: context.tr(AppStrings.groupPlanFriends),
          children: [
            SettingsRow(
              icon: AppIcons.coin,
              tint: AppColors.gold,
              ink: AppColors.goldInk,
              tintAlpha: .16,
              keepIconColors: true,
              title: context.tr(AppStrings.shopTitle),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppIcons.coin, width: 18.r, height: 18.r),
                  SizedBox(width: 4.w),
                  Text('$coins', style: AppText.rowCoins),
                ],
              ),
              onTap: onCoins,
            ),
            SettingsRow(
              icon: AppIcons.plans,
              tint: AppColors.gold,
              ink: AppColors.goldInk,
              tintAlpha: .16,
              title: context.tr(AppStrings.plans),
              subtitle: planHint,
              onTap: onPlans,
            ),
            SettingsRow(
              icon: AppIcons.friends,
              title: context.tr(AppStrings.friends),
              subtitle: friendsHint,
              trailing: requests == 0
                  ? null
                  : Container(
                      constraints: BoxConstraints(minWidth: 22.r),
                      height: 22.r,
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.bad,
                        borderRadius: BorderRadius.circular(999.r),
                      ),
                      child: Text('$requests', style: AppText.rowBadge),
                    ),
              onTap: onFriends,
            ),
          ],
        ),
      ],
    );
  }
}
