import 'package:flutter/material.dart';

import '../../constants/app_images.dart';
import '../../theme/app_colors.dart';

/// One card tier: the background art plus the colours and positions of what
/// is drawn on top of it.
///
/// All positions are fractions of the art (1083×1452, card plus the glow
/// around it), so they hold at any size.
class FutCardStyle {
  const FutCardStyle({
    required this.art,
    required this.ratingInk,
    required this.nameInk,
    required this.photoBottom,
    required this.nameCenter,
  });

  /// Background art asset.
  final String art;
  final Color ratingInk;
  final Color nameInk;

  /// Where the photo fades out (top of the name area).
  final double photoBottom;

  /// Vertical centre of the name.
  final double nameCenter;

  /// Width / height of the art.
  static const aspect = 1083 / 1452;

  static const icon = FutCardStyle(
    art: AppImages.cardIcon,
    ratingInk: Color(0xFF7A5512),
    nameInk: Color(0xFF5A3D0C),
    photoBottom: .655,
    nameCenter: .755,
  );

  static const elite = FutCardStyle(
    art: AppImages.cardElite,
    ratingInk: Color(0xFFFFE7A3),
    nameInk: Color(0xFFFFE7A3),
    photoBottom: .64,
    nameCenter: .665,
  );

  static const burgundy = FutCardStyle(
    art: AppImages.cardBurgundy,
    ratingInk: Color(0xFFFFE3B0),
    nameInk: Color(0xFFF2CF7E),
    photoBottom: .64,
    nameCenter: .665,
  );

  static const gold = FutCardStyle(
    art: AppImages.cardGold,
    ratingInk: Color(0xFF3A2606),
    nameInk: Color(0xFF2A1A05),
    photoBottom: .645,
    nameCenter: .697,
  );

  static const silver = FutCardStyle(
    art: AppImages.cardSilver,
    ratingInk: Color(0xFF1E232B),
    nameInk: Color(0xFF1E232B),
    photoBottom: .645,
    nameCenter: .697,
  );

  /// Face-down card in the auction lot: the elite art.
  static const mystery = FutCardStyle(
    art: AppImages.cardElite,
    ratingInk: Color(0xFFFFFFFF),
    nameInk: Color(0xFFFFFFFF),
    photoBottom: .64,
    nameCenter: .665,
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
