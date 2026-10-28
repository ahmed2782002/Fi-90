import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class QuickMode {
  const QuickMode({
    required this.titleKey,
    required this.hintKey,
    required this.image,
    required this.accent,
    required this.glow,
    this.contain = false,
  });

  final String titleKey;
  final String hintKey;
  final String image;
  final Color accent;
  final Color glow;
  final bool contain;

  static List<QuickMode> get mock => [
    QuickMode(
      titleKey: AppStrings.modeWhatDoYouKnow,
      hintKey: AppStrings.modeTriviaHint,
      image: AppImages.modeTrivia,
      accent: AppColors.cy,
      glow: AppColors.cy,
    ),
    QuickMode(
      titleKey: AppStrings.modeAuction,
      hintKey: AppStrings.modeAuctionHint,
      image: AppImages.modeAuction,
      accent: AppColors.gold,
      glow: AppColors.gold,
    ),
    QuickMode(
      titleKey: AppStrings.modeBell,
      hintKey: AppStrings.modeBellHint,
      image: AppImages.modeBell,
      accent: AppColors.m3,
      glow: AppColors.m3,
    ),
    QuickMode(
      titleKey: AppStrings.modeComeback,
      hintKey: AppStrings.modeComebackHint,
      image: AppImages.modeComeback,
      accent: AppColors.m4,
      glow: AppColors.m4Glow,
      contain: true,
    ),
  ];
}
