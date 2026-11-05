import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

enum FutFinish { crystal, marble }

enum FutOrnament { filigree, geometric }

/// Full look of one card tier: colours for the body, metal frame, text and
/// glow, plus which texture and ornament set to draw.
class FutCardStyle {
  const FutCardStyle({
    required this.body,
    required this.frame,
    required this.ratingInk,
    required this.nameInk,
    required this.glow,
    required this.facetLight,
    required this.facetDark,
    this.finish = FutFinish.crystal,
    this.ornament = FutOrnament.geometric,
    this.emblem = false,
    this.nameBand,
  });

  /// Body gradient, top to bottom.
  final List<Color> body;

  /// Metal frame gradient (gold, silver…).
  final List<Color> frame;
  final Color ratingInk;
  final Color nameInk;
  final Color glow;
  final Color facetLight;
  final Color facetDark;
  final FutFinish finish;
  final FutOrnament ornament;

  /// Laurel + ball + stars crest at the top (icons).
  final bool emblem;

  /// Optional darker band behind the name (mystery card).
  final Color? nameBand;

  Color get metal => frame[frame.length ~/ 2];
  Color get metalLight => frame.first;

  static const _gold = [
    Color(0xFFFFF4CC),
    Color(0xFFD9AE4E),
    Color(0xFF9C6F1C),
    Color(0xFFF7DE95),
    Color(0xFFB8862B),
  ];
  static const _silver = [
    Color(0xFFFFFFFF),
    Color(0xFFC9CFD9),
    Color(0xFF7D8696),
    Color(0xFFF2F4F8),
    Color(0xFF9AA3B2),
  ];

  static const icon = FutCardStyle(
    body: [Color(0xFFFFFFFF), Color(0xFFF1EEE9), Color(0xFFE2DDD5)],
    frame: _gold,
    ratingInk: Color(0xFF9A6E1E),
    nameInk: Color(0xFF6B4A12),
    glow: Color(0xFFFFC94D),
    facetLight: Color(0xFFFFFFFF),
    facetDark: Color(0xFFB9B2A6),
    finish: FutFinish.marble,
    ornament: FutOrnament.filigree,
    emblem: true,
  );

  static const elite = FutCardStyle(
    body: [Color(0xFF2A3FB8), Color(0xFF14207A), Color(0xFF070C3A)],
    frame: _gold,
    ratingInk: Color(0xFFFFE7A3),
    nameInk: Color(0xFFFFE7A3),
    glow: Color(0xFF6E8BFF),
    facetLight: Color(0xFF8FA8FF),
    facetDark: Color(0xFF02041C),
  );

  static const burgundy = FutCardStyle(
    body: [Color(0xFFB0182F), Color(0xFF7A0C1C), Color(0xFF420511)],
    frame: _gold,
    ratingInk: Color(0xFFFFE3B0),
    nameInk: Color(0xFFF2CF7E),
    glow: Color(0xFFFF6A2B),
    facetLight: Color(0xFFFF6A5A),
    facetDark: Color(0xFF2A0209),
  );

  static const gold = FutCardStyle(
    body: [Color(0xFF8A6116), Color(0xFFC79B3F), Color(0xFFF1D68B)],
    frame: _gold,
    ratingInk: Color(0xFFFFF4D6),
    nameInk: Color(0xFF2A1A05),
    glow: Color(0xFFFFD36B),
    facetLight: Color(0xFFFFF0B8),
    facetDark: Color(0xFF5C3E0A),
    ornament: FutOrnament.filigree,
  );

  static const silver = FutCardStyle(
    body: [Color(0xFFB9C0CC), Color(0xFFD9DEE6), Color(0xFF9AA2B0)],
    frame: _silver,
    ratingInk: Color(0xFFFFFFFF),
    nameInk: Color(0xFF2B3039),
    glow: Color(0xFFFFFFFF),
    facetLight: Color(0xFFFFFFFF),
    facetDark: Color(0xFF6A7382),
  );

  static const mystery = FutCardStyle(
    body: [Color(0xFF1C5FD6), Color(0xFF0B3593), Color(0xFF061B52)],
    frame: _silver,
    ratingInk: Color(0xFFFFFFFF),
    nameInk: Color(0xFFFFFFFF),
    glow: Color(0xFF3FA2FF),
    facetLight: Color(0xFF5FB8FF),
    facetDark: Color(0xFF020A26),
    nameBand: Color(0xFF07215E),
  );

  static FutCardStyle of(FutPalette palette) {
    if (palette == AppColors.futIcon) return icon;
    if (palette == AppColors.futElite) return elite;
    if (palette == AppColors.futBurgundy) return burgundy;
    if (palette == AppColors.futGold) return gold;
    if (palette == AppColors.futMystery) return mystery;
    return silver;
  }
}
