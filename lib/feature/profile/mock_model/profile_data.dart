import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileData {
  const ProfileData({
    required this.nameKey,
    required this.username,
    required this.email,
    required this.level,
    required this.tierKey,
    required this.rank,
    required this.xp,
    required this.xpTarget,
    required this.matches,
    required this.wins,
    required this.accuracy,
    required this.streak,
    required this.coins,
    required this.performance,
  });

  final String nameKey;
  final String username;
  final String email;
  final int level;
  final String tierKey;
  final String rank;
  final int xp;
  final int xpTarget;
  final int matches;
  final int wins;
  final int accuracy;
  final int streak;
  final int coins;
  final List<({String modeKey, int value, Color color})> performance;

  double get xpProgress => xp / xpTarget;

  static ProfileData get mock => ProfileData(
    nameKey: AppStrings.mockPlayerAhmed,
    username: '@ahmed_24',
    email: 'ahmed24@gmail.com',
    level: 24,
    tierKey: AppStrings.profileTier,
    rank: '#128',
    xp: 1240,
    xpTarget: 1500,
    matches: 120,
    wins: 85,
    accuracy: 72,
    streak: 7,
    coins: 250,
    performance: [
      (modeKey: AppStrings.modeWhatDoYouKnow, value: 78, color: AppColors.pri),
      (modeKey: AppStrings.modeAuction, value: 64, color: AppColors.gold),
      (modeKey: AppStrings.modeBell, value: 81, color: AppColors.m3),
      (modeKey: AppStrings.modeComeback, value: 55, color: AppColors.m4),
    ],
  );
}
