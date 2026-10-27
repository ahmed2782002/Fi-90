import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppShadows {
  static final glow = [
    BoxShadow(color: AppColors.tint(AppColors.cy, .1), spreadRadius: 1),
    BoxShadow(color: AppColors.tint(AppColors.cy, .35), blurRadius: 22),
  ];

  static final sh1 = [
    BoxShadow(color: AppColors.tint(AppColors.cy, .05), spreadRadius: 1),
    BoxShadow(color: AppColors.tint(AppColors.cy, .12), blurRadius: 16),
    BoxShadow(
      color: AppColors.tint(AppColors.black, .32),
      offset: const Offset(0, 12),
      blurRadius: 30,
    ),
  ];

  static final sh2 = [
    BoxShadow(color: AppColors.tint(AppColors.cy, .22), blurRadius: 26),
    BoxShadow(
      color: AppColors.tint(AppColors.black, .5),
      offset: const Offset(0, 24),
      blurRadius: 60,
    ),
  ];
}
