import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum PlanTier {
  free(AppStrings.planFree),
  pro(AppStrings.planPro),
  legend(AppStrings.planLegend);

  const PlanTier(this.nameKey);

  final String nameKey;

  Color get titleColor => switch (this) {
    PlanTier.free => AppColors.tx,
    PlanTier.pro => AppColors.priInk,
    PlanTier.legend => AppColors.goldInk,
  };
}

class Plan {
  const Plan({
    required this.tier,
    required this.tagKey,
    required this.features,
    this.monthly,
    this.yearly,
    this.popular = false,
  });

  final PlanTier tier;
  final String tagKey;
  final List<String> features;
  final int? monthly;
  final int? yearly;
  final bool popular;

  bool get isFree => tier == PlanTier.free;

  static const coinsBalance = 250;

  static const mock = [
    Plan(
      tier: PlanTier.free,
      tagKey: AppStrings.planFreeTag,
      features: [
        AppStrings.featUnlimitedOnline,
        AppStrings.featTenCoins,
        AppStrings.featFriendsGames,
      ],
    ),
    Plan(
      tier: PlanTier.pro,
      tagKey: AppStrings.planProTag,
      monthly: 49,
      yearly: 299,
      popular: true,
      features: [
        AppStrings.featNoAds,
        AppStrings.featDoubleCoins,
        AppStrings.featExtraPass,
        AppStrings.featStats,
      ],
    ),
    Plan(
      tier: PlanTier.legend,
      tagKey: AppStrings.planLegendTag,
      monthly: 99,
      yearly: 599,
      features: [
        AppStrings.featAllPro,
        AppStrings.featMonthlyCoins,
        AppStrings.featGoldFrame,
        AppStrings.featTournaments,
      ],
    ),
  ];
}
