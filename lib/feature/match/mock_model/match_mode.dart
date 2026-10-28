import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum MatchMode {
  trivia(
    AppStrings.modeWhatDoYouKnow,
    AppStrings.triviaHook,
    AppIcons.brain,
    3,
    [AppStrings.triviaRule1, AppStrings.triviaRule2, AppStrings.triviaRule3],
  ),
  auction(AppStrings.modeAuction, AppStrings.auctionHook, AppIcons.gavel, 1, [
    AppStrings.auctionRule1,
    AppStrings.auctionRule2,
    AppStrings.auctionRule3,
  ]),
  buzzer(AppStrings.modeBell, AppStrings.buzzerHook, AppIcons.bell, 5, [
    AppStrings.buzzerRule1,
    AppStrings.buzzerRule2,
    AppStrings.buzzerRule3,
  ]),
  comeback(AppStrings.modeComeback, AppStrings.comebackHook, AppIcons.swap, 7, [
    AppStrings.comebackRule1,
    AppStrings.comebackRule2,
    AppStrings.comebackRule3,
  ]);

  const MatchMode(
    this.nameKey,
    this.hookKey,
    this.icon,
    this.questions,
    this.ruleKeys,
  );

  final String nameKey;
  final String hookKey;
  final String icon;
  final int questions;
  final List<String> ruleKeys;

  Color get accent => switch (this) {
    MatchMode.trivia => AppColors.pri,
    MatchMode.auction => AppColors.gold,
    MatchMode.buzzer => AppColors.m3,
    MatchMode.comeback => AppColors.m4,
  };

  Color get ink => switch (this) {
    MatchMode.trivia => AppColors.priInk,
    MatchMode.auction => AppColors.goldInk,
    MatchMode.buzzer => AppColors.m3Ink,
    MatchMode.comeback => AppColors.m4Ink,
  };

  Color get onAccent => switch (this) {
    MatchMode.auction => AppColors.leaderGoldInk,
    MatchMode.comeback => AppColors.comebackOn,
    _ => AppColors.white,
  };
}

enum AiLevel {
  easy(.4, AppStrings.aiEasy, AppStrings.aiEasyHint),
  normal(.65, AppStrings.aiNormal, AppStrings.aiNormalHint),
  hard(.88, AppStrings.aiHard, AppStrings.aiHardHint);

  const AiLevel(this.skill, this.labelKey, this.hintKey);

  final double skill;
  final String labelKey;
  final String hintKey;
}
