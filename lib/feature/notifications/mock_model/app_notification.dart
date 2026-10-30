import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum NotificationKind {
  invite(null),
  win('✓'),
  rank('▲'),
  reply('؟'),
  streak('5'),
  week('90');

  const NotificationKind(this.glyph);

  final String? glyph;

  Color get tile => switch (this) {
    NotificationKind.invite => AppColors.op,
    NotificationKind.win => AppColors.tint(AppColors.ok, .18),
    NotificationKind.rank => AppColors.tint(AppColors.cy, .18),
    NotificationKind.reply => AppColors.tint(AppColors.pri, .16),
    NotificationKind.streak => AppColors.tint(AppColors.gold, .2),
    NotificationKind.week => AppColors.transparent,
  };

  Gradient? get tileGradient =>
      this == NotificationKind.week ? AppColors.grad : null;

  Color get ink => switch (this) {
    NotificationKind.invite => AppColors.opOn,
    NotificationKind.win => AppColors.okInk,
    NotificationKind.rank || NotificationKind.reply => AppColors.priInk,
    NotificationKind.streak => AppColors.goldInk,
    NotificationKind.week => AppColors.white,
  };
}

class AppNotification {
  const AppNotification({
    required this.id,
    required this.kind,
    required this.titleKey,
    required this.bodyKey,
    required this.timeKey,
    this.nameKey,
    this.timeArgs = const [],
    this.points,
    this.today = true,
  });

  final int id;
  final NotificationKind kind;
  final String titleKey;
  final String bodyKey;
  final String timeKey;
  final String? nameKey;
  final List<String> timeArgs;
  final String? points;
  final bool today;

  bool get isInvite => kind == NotificationKind.invite;

  static const mock = [
    AppNotification(
      id: 1,
      kind: NotificationKind.invite,
      titleKey: AppStrings.nfInviteTitle,
      bodyKey: AppStrings.nfInviteBody,
      timeKey: AppStrings.timeNow,
      nameKey: AppStrings.mockPlayerOmar,
    ),
    AppNotification(
      id: 2,
      kind: NotificationKind.win,
      titleKey: AppStrings.nfWinTitle,
      bodyKey: AppStrings.nfWinBody,
      timeKey: AppStrings.timeMinutesAgo,
      timeArgs: ['25'],
      nameKey: AppStrings.mockPlayerSara,
      points: '+40 XP',
    ),
    AppNotification(
      id: 3,
      kind: NotificationKind.rank,
      titleKey: AppStrings.nfRankTitle,
      bodyKey: AppStrings.nfRankBody,
      timeKey: AppStrings.timeHourAgo,
    ),
    AppNotification(
      id: 4,
      kind: NotificationKind.reply,
      titleKey: AppStrings.nfReplyTitle,
      bodyKey: AppStrings.nfReplyBody,
      timeKey: AppStrings.yesterday,
      points: '+25',
      today: false,
    ),
    AppNotification(
      id: 5,
      kind: NotificationKind.streak,
      titleKey: AppStrings.nfStreakTitle,
      bodyKey: AppStrings.nfStreakBody,
      timeKey: AppStrings.yesterday,
      today: false,
    ),
    AppNotification(
      id: 6,
      kind: NotificationKind.week,
      titleKey: AppStrings.nfWeekTitle,
      bodyKey: AppStrings.nfWeekBody,
      timeKey: AppStrings.dayFriday,
      today: false,
    ),
  ];
}
