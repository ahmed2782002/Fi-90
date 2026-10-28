import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/settings_app/settings_group.dart';
import 'package:fii90/core/widgets/settings_app/settings_row.dart';
import 'package:flutter/material.dart';

class SupportSettings extends StatelessWidget {
  const SupportSettings({
    super.key,
    required this.onComplaint,
    required this.onFaq,
    required this.onPrivacy,
    required this.onTerms,
  });

  final VoidCallback onComplaint;
  final VoidCallback onFaq;
  final VoidCallback onPrivacy;
  final VoidCallback onTerms;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsGroup(
          title: context.tr(AppStrings.groupSupport),
          children: [
            SettingsRow(
              icon: AppIcons.complaint,
              title: context.tr(AppStrings.complaints),
              subtitle: context.tr(AppStrings.complaintsHint),
              onTap: onComplaint,
            ),
            SettingsRow(
              icon: AppIcons.faq,
              title: context.tr(AppStrings.faq),
              subtitle: context.tr(AppStrings.faqHint),
              onTap: onFaq,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SettingsGroup(
          title: context.tr(AppStrings.groupAbout),
          children: [
            SettingsRow(
              icon: AppIcons.privacy,
              title: context.tr(AppStrings.privacyPolicy),
              onTap: onPrivacy,
            ),
            SettingsRow(
              icon: AppIcons.terms,
              title: context.tr(AppStrings.termsAndConditions),
              onTap: onTerms,
            ),
          ],
        ),
      ],
    );
  }
}
