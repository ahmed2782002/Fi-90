import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum BuddyStatus {
  online(AppStrings.statusOnline),
  inMatch(AppStrings.statusInMatch),
  away(AppStrings.statusLastSeenHour),
  pending(AppStrings.statusRequestSent);

  const BuddyStatus(this.labelKey);

  final String labelKey;

  bool get canChallenge => this == online;

  Color get dot => switch (this) {
    BuddyStatus.online => AppColors.ok,
    BuddyStatus.inMatch => AppColors.gold,
    BuddyStatus.away => AppColors.s3,
    BuddyStatus.pending => AppColors.dim,
  };

  Color get labelColor => this == online ? AppColors.okInk : AppColors.mu;
}

class Buddy {
  const Buddy({
    required this.name,
    required this.background,
    required this.foreground,
    this.status = BuddyStatus.pending,
    this.level,
    this.tierKey,
    this.translated = true,
  });

  final String name;
  final Color background;
  final Color foreground;
  final BuddyStatus status;
  final int? level;
  final String? tierKey;
  final bool translated;

  static const code = 'AHMED-24';

  static List<Buddy> get friends => [
    Buddy(
      name: AppStrings.mockPlayerOmar,
      background: AppColors.op,
      foreground: AppColors.opOn,
      status: BuddyStatus.online,
    ),
    Buddy(
      name: AppStrings.mockPlayerSara,
      background: AppColors.s3,
      foreground: AppColors.tx,
      status: BuddyStatus.inMatch,
    ),
    Buddy(
      name: AppStrings.mockPlayerKarim,
      background: AppColors.m4,
      foreground: AppColors.meOnDark,
      status: BuddyStatus.away,
    ),
    Buddy(
      name: AppStrings.mockPlayerYousef,
      background: AppColors.gold,
      foreground: AppColors.stickerInk,
      status: BuddyStatus.online,
    ),
  ];

  static List<Buddy> get requests => [
    Buddy(
      name: AppStrings.mockPlayerMazen,
      background: AppColors.ok,
      foreground: AppColors.checkInk,
      level: 18,
      tierKey: AppStrings.tierSilver1,
    ),
    Buddy(
      name: AppStrings.mockPlayerNour,
      background: AppColors.m3,
      foreground: AppColors.white,
      level: 31,
      tierKey: AppStrings.tierPlatinum,
    ),
  ];
}
