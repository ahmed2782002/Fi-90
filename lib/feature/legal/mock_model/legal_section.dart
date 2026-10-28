import 'package:fii90/core/localization/app_strings.dart';

class LegalSection {
  const LegalSection(this.titleKey, this.bodyKey);

  final String titleKey;
  final String bodyKey;

  static const privacy = [
    LegalSection(AppStrings.privacyDataTitle, AppStrings.privacyDataBody),
    LegalSection(AppStrings.privacyUseTitle, AppStrings.privacyUseBody),
    LegalSection(AppStrings.privacyWhoTitle, AppStrings.privacyWhoBody),
    LegalSection(AppStrings.privacyRightsTitle, AppStrings.privacyRightsBody),
  ];

  static const terms = [
    LegalSection(AppStrings.termsAccountTitle, AppStrings.termsAccountBody),
    LegalSection(AppStrings.termsFairTitle, AppStrings.termsFairBody),
    LegalSection(AppStrings.termsBehaviorTitle, AppStrings.termsBehaviorBody),
    LegalSection(AppStrings.termsPointsTitle, AppStrings.termsPointsBody),
  ];
}
