import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/settings_app/settings_group.dart';
import 'package:fii90/core/widgets/settings_app/settings_row.dart';
import 'package:flutter/material.dart';
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
        const SizedBox(height: 16),
        SettingsGroup(
          title: context.tr(AppStrings.groupPlanFriends),
          children: [
            SettingsRow(
              icon: AppIcons.plans,
              tint: AppColors.gold,
              ink: AppColors.goldInk,
              tintAlpha: .16,
              title: context.tr(AppStrings.plans),
              subtitle: planHint,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppIcons.coin, width: 18, height: 18),
                  const SizedBox(width: 4),
                  Text('$coins', style: AppText.rowCoins),
                ],
              ),
              onTap: onPlans,
            ),
            SettingsRow(
              icon: AppIcons.friends,
              title: context.tr(AppStrings.friends),
              subtitle: friendsHint,
              trailing: requests == 0
                  ? null
                  : Container(
                      constraints: const BoxConstraints(minWidth: 22),
                      height: 22,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.bad,
                        borderRadius: BorderRadius.circular(999),
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
