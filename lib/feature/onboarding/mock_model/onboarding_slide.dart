import 'package:fii90/core/localization/app_strings.dart';

class OnboardingSlide {
  const OnboardingSlide({required this.title, required this.body});

  final String title;
  final String body;

  static const mock = [
    OnboardingSlide(
      title: AppStrings.onboardingVersusTitle,
      body: AppStrings.onboardingVersusBody,
    ),
    OnboardingSlide(
      title: AppStrings.onboardingChallengesTitle,
      body: AppStrings.onboardingChallengesBody,
    ),
    OnboardingSlide(
      title: AppStrings.onboardingRankingTitle,
      body: AppStrings.onboardingRankingBody,
    ),
  ];
}
