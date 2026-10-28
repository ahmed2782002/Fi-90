import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/feature/legal/mock_model/legal_section.dart';
import 'package:flutter/material.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({
    super.key,
    required this.titleKey,
    required this.sections,
  });

  final String titleKey;
  final List<LegalSection> sections;

  @override
  Widget build(BuildContext context) {
    return SubPage(
      title: context.tr(titleKey),
      children: [
        Text(context.tr(AppStrings.lastUpdated), style: AppText.updated),
        for (final section in sections)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.tr(section.titleKey), style: AppText.legalTitle),
              const SizedBox(height: 6),
              Text(context.tr(section.bodyKey), style: AppText.legalBody),
            ],
          ),
      ],
    );
  }
}
