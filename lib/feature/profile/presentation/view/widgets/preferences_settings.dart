import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/pill_segment.dart';
import 'package:fii90/core/widgets/settings_app/settings_group.dart';
import 'package:fii90/core/widgets/settings_app/settings_row.dart';
import 'package:fii90/core/widgets/settings_app/toggle_switch.dart';
import 'package:flutter/material.dart';

class PreferencesSettings extends StatelessWidget {
  const PreferencesSettings({
    super.key,
    required this.languageIndex,
    required this.onLanguage,
    required this.notifications,
    required this.notificationsHint,
    required this.onNotifications,
    required this.themeIndex,
    required this.onTheme,
  });

  static const languages = ['العربية', 'English'];
  static const languageToasts = ['اللغة: العربية', 'Language: English'];

  final int languageIndex;
  final ValueChanged<int> onLanguage;
  final bool notifications;
  final String notificationsHint;
  final VoidCallback onNotifications;
  final int themeIndex;
  final ValueChanged<int> onTheme;

  @override
  Widget build(BuildContext context) {
    return SettingsGroup(
      title: context.tr(AppStrings.groupPreferences),
      children: [
        SettingsRow(
          icon: AppIcons.globe,
          title: context.tr(AppStrings.language),
          subtitle: languages[languageIndex],
          trailing: PillSegment(
            labels: languages,
            index: languageIndex,
            onSelect: onLanguage,
            style: AppText.segmentSmall,
            activeGradient: AppColors.grad,
            activeShadow: AppShadows.segment,
          ),
        ),
        SettingsRow(
          icon: AppIcons.settingsNotification,
          title: context.tr(AppStrings.notifications),
          subtitle: notificationsHint,
          trailing: ToggleSwitch(
            value: notifications,
            label: context.tr(AppStrings.notifications),
            onTap: onNotifications,
          ),
        ),
        SettingsRow(
          icon: AppIcons.theme,
          title: context.tr(AppStrings.appearance),
          subtitle: context.tr(AppStrings.appearanceHint),
          trailing: PillSegment(
            labels: [
              context.tr(AppStrings.themeDark),
              context.tr(AppStrings.themeLight),
            ],
            index: themeIndex,
            onSelect: onTheme,
            style: AppText.segmentSmall,
            activeColor: AppColors.s1,
            activeText: AppColors.tx,
            activeShadow: AppShadows.sh1,
          ),
        ),
      ],
    );
  }
}
