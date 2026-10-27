import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppText {
  static TextStyle _cairo(
    double size, {
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.tx,
    double? height,
    List<Shadow>? shadows,
  }) {
    return GoogleFonts.cairo(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      shadows: shadows,
    );
  }

  static const List<Shadow> outline = [
    Shadow(color: AppColors.stk2, offset: Offset(0, 6)),
    Shadow(color: AppColors.stk, offset: Offset(2.5, 0)),
    Shadow(color: AppColors.stk, offset: Offset(-2.5, 0)),
    Shadow(color: AppColors.stk, offset: Offset(0, 2.5)),
    Shadow(color: AppColors.stk, offset: Offset(0, -2.5)),
    Shadow(color: AppColors.stk, offset: Offset(1.8, 1.8)),
    Shadow(color: AppColors.stk, offset: Offset(-1.8, -1.8)),
    Shadow(color: AppColors.stk, offset: Offset(1.8, -1.8)),
    Shadow(color: AppColors.stk, offset: Offset(-1.8, 1.8)),
  ];

  static TextStyle get logoNine =>
      GoogleFonts.rubik(fontSize: 40, fontWeight: FontWeight.w900);

  static TextStyle get splashBrand =>
      _cairo(38, weight: FontWeight.w900, height: 1.3, shadows: outline);
  static TextStyle get splashTagline => _cairo(18, weight: FontWeight.w800);

  static TextStyle get headerBrand =>
      _cairo(13, weight: FontWeight.w700, color: AppColors.mu);
  static TextStyle get skip =>
      _cairo(14, weight: FontWeight.w500, color: AppColors.mu);
  static TextStyle get slideTitle =>
      _cairo(31, weight: FontWeight.w900, height: 1.35, shadows: outline);
  static TextStyle get slideBody => _cairo(15,
      weight: FontWeight.w500, color: AppColors.tx2, height: 1.85);
  static TextStyle get button => _cairo(18, weight: FontWeight.w700);

  static TextStyle get versus => _cairo(26,
      weight: FontWeight.w900,
      shadows: const [Shadow(color: AppColors.stk2, offset: Offset(0, 2))]);
  static TextStyle get timer => _cairo(14, weight: FontWeight.w800);
  static TextStyle get cardInitial => _cairo(30, weight: FontWeight.w900);
  static TextStyle get cardName => _cairo(17, weight: FontWeight.w800);
  static TextStyle get tag =>
      _cairo(11, weight: FontWeight.w700, color: AppColors.mu);
  static TextStyle get modeNumber =>
      _cairo(72, weight: FontWeight.w900, height: 1);
  static TextStyle get chip => _cairo(12, weight: FontWeight.w800);
  static TextStyle get pill =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.tx2);
  static TextStyle get sticker => _cairo(22,
      weight: FontWeight.w900, color: AppColors.stickerInk, height: 1.2);
  static TextStyle get stickerSmall =>
      _cairo(18, weight: FontWeight.w900, color: AppColors.stickerInk);

  static TextStyle get avatarLarge => _cairo(26, weight: FontWeight.w900);
  static TextStyle get avatarSmall => _cairo(22, weight: FontWeight.w900);
  static TextStyle get podiumName => _cairo(13, weight: FontWeight.w700);
  static TextStyle get podiumRank =>
      _cairo(30, weight: FontWeight.w900, height: 1);

  static TextStyle get loginTitle =>
      _cairo(30, weight: FontWeight.w900, height: 1.35, shadows: outline);
  static TextStyle get loginSubtitle =>
      _cairo(15, color: AppColors.tx2, height: 1.7);
  static TextStyle get terms => _cairo(12, color: AppColors.mu, height: 1.8);
  static TextStyle get termsLink => _cairo(12,
      weight: FontWeight.w700, color: AppColors.priInk, height: 1.8);
  static TextStyle get perk => _cairo(13, weight: FontWeight.w800);
  static TextStyle get social => _cairo(16, weight: FontWeight.w700);
  static TextStyle get toast => _cairo(13, weight: FontWeight.w600);

  static TextStyle get playerLevel =>
      _cairo(26, weight: FontWeight.w900, height: 1);
  static TextStyle get playerLevelLabel => _cairo(10,
      weight: FontWeight.w800, color: AppColors.priInk, height: 1);
  static TextStyle get playerTag => _cairo(10, weight: FontWeight.w800);
  static TextStyle get playerHeadline => _cairo(17, weight: FontWeight.w900);
  static TextStyle get statValue =>
      _cairo(14, weight: FontWeight.w900, height: 1.3);
  static TextStyle get statLabel => _cairo(10,
      weight: FontWeight.w800, color: AppColors.paleBlue, height: 1.3);
  static TextStyle get checkMark => _cairo(18,
      weight: FontWeight.w900, color: AppColors.checkInk, height: 1);
}
