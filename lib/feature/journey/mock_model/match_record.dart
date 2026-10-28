import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum MatchResult {
  win(AppStrings.resultWin),
  loss(AppStrings.resultLoss),
  draw(AppStrings.resultDraw);

  const MatchResult(this.labelKey);

  final String labelKey;

  Color get color => switch (this) {
    MatchResult.win => AppColors.okInk,
    MatchResult.loss => AppColors.badInk,
    MatchResult.draw => AppColors.tx2,
  };

  Color get background => switch (this) {
    MatchResult.win => AppColors.tint(AppColors.ok, .15),
    MatchResult.loss => AppColors.tint(AppColors.bad, .14),
    MatchResult.draw => AppColors.s2,
  };
}

class MatchRecord {
  const MatchRecord({
    required this.opponentKey,
    required this.score,
    required this.result,
    required this.modes,
    required this.dateKey,
    required this.duration,
    this.modeKey,
  });

  final String opponentKey;
  final String score;
  final MatchResult result;
  final List<Color> modes;
  final String? modeKey;
  final String dateKey;
  final String duration;

  static List<Color> get _allModes => [
    AppColors.pri,
    AppColors.gold,
    AppColors.m3,
    AppColors.m4,
  ];

  static List<MatchRecord> get mock => [
    MatchRecord(
      opponentKey: AppStrings.mockPlayerOmar,
      score: '70 – 80',
      result: MatchResult.win,
      modes: _allModes,
      dateKey: AppStrings.yesterday,
      duration: '6:42',
    ),
    MatchRecord(
      opponentKey: AppStrings.mockPlayerYousef,
      score: '61 – 55',
      result: MatchResult.loss,
      modes: [AppColors.gold],
      modeKey: AppStrings.modeAuction,
      dateKey: AppStrings.twoDaysAgo,
      duration: '1:58',
    ),
    MatchRecord(
      opponentKey: AppStrings.mockPlayerMariam,
      score: '40 – 92',
      result: MatchResult.win,
      modes: _allModes,
      dateKey: AppStrings.sep24,
      duration: '7:10',
    ),
    MatchRecord(
      opponentKey: AppStrings.mockPlayerHassan,
      score: '45 – 45',
      result: MatchResult.draw,
      modes: [AppColors.m3],
      modeKey: AppStrings.modeBell,
      dateKey: AppStrings.sep22,
      duration: '0:48',
    ),
  ];
}
