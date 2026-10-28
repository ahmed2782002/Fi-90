import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppShadows {
  static List<BoxShadow> get glow => AppColors.isDark
      ? [
          BoxShadow(color: AppColors.tint(AppColors.neon, .1), spreadRadius: 1),
          BoxShadow(color: AppColors.tint(AppColors.neon, .35), blurRadius: 22),
        ]
      : const [
          BoxShadow(
            color: Color(0x421A1AD6),
            offset: Offset(0, 10),
            blurRadius: 26,
          ),
        ];

  static List<BoxShadow> get sh1 => AppColors.isDark
      ? [
          BoxShadow(
            color: AppColors.tint(AppColors.neon, .05),
            spreadRadius: 1,
          ),
          BoxShadow(color: AppColors.tint(AppColors.neon, .12), blurRadius: 16),
          BoxShadow(
            color: AppColors.tint(AppColors.black, .32),
            offset: const Offset(0, 12),
            blurRadius: 30,
          ),
        ]
      : const [
          BoxShadow(
            color: Color(0x0F0F2256),
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Color(0x1A1A3CB4),
            offset: Offset(0, 10),
            blurRadius: 26,
          ),
        ];

  static List<BoxShadow> get sh2 => AppColors.isDark
      ? [
          BoxShadow(color: AppColors.tint(AppColors.neon, .22), blurRadius: 26),
          BoxShadow(
            color: AppColors.tint(AppColors.black, .5),
            offset: const Offset(0, 24),
            blurRadius: 60,
          ),
        ]
      : const [
          BoxShadow(
            color: Color(0x2E1A288C),
            offset: Offset(0, 22),
            blurRadius: 50,
          ),
        ];

  static final segment = [
    BoxShadow(color: AppColors.tint(AppColors.neon, .35), blurRadius: 12),
  ];

  static final toggle = [
    BoxShadow(color: AppColors.tint(AppColors.neon, .4), blurRadius: 12),
  ];

  static final raised = [
    BoxShadow(
      color: AppColors.tint(AppColors.black, .18),
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> card(Color glow) => [
    BoxShadow(color: AppColors.tint(glow, .16), blurRadius: 16),
    ...sh1,
  ];

  static List<BoxShadow> accent(Color color) => [
    BoxShadow(color: AppColors.tint(color, .6), blurRadius: 10),
  ];
}
