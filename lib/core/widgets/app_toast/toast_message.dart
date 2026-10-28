import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

enum ToastKind {
  info,
  ok,
  warn,
  bad;

  Color get background => switch (this) {
    ToastKind.info => AppColors.s3,
    ToastKind.ok => AppColors.ok,
    ToastKind.warn => AppColors.gold,
    ToastKind.bad => AppColors.bad,
  };

  Color get foreground => switch (this) {
    ToastKind.info => AppColors.tx,
    ToastKind.ok => AppColors.checkInk,
    ToastKind.warn => AppColors.leaderGoldInk,
    ToastKind.bad => AppColors.white,
  };
}

class ToastMessage {
  const ToastMessage(
    this.key, {
    this.kind = ToastKind.ok,
    this.args = const [],
    this.translateArgs = false,
    this.translate = true,
  });

  final String key;
  final ToastKind kind;
  final List<String> args;
  final bool translateArgs;
  final bool translate;
}
