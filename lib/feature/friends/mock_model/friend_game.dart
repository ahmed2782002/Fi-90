import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum FriendGameKind { photo, act, bank, spy }

class FriendGame {
  const FriendGame({
    required this.kind,
    required this.titleKey,
    required this.descriptionKey,
    required this.lengthKey,
    required this.image,
    required this.hero,
    this.zoom = 1,
  });

  final FriendGameKind kind;
  final String titleKey;
  final String descriptionKey;
  final String lengthKey;
  final String image;
  final List<Color> hero;
  final double zoom;

  List<String> get ruleKeys => switch (kind) {
    FriendGameKind.photo => const [
      AppStrings.photoRule1,
      AppStrings.photoRule2,
      AppStrings.photoRule3,
      AppStrings.photoRule4,
    ],
    FriendGameKind.act => const [
      AppStrings.actRule1,
      AppStrings.actRule2,
      AppStrings.actRule3,
      AppStrings.actRule4,
    ],
    FriendGameKind.bank => const [
      AppStrings.bankRule1,
      AppStrings.bankRule2,
      AppStrings.bankRule3,
      AppStrings.bankRule4,
    ],
    FriendGameKind.spy => const [
      AppStrings.spyRule1,
      AppStrings.spyRule2,
      AppStrings.spyRule3,
      AppStrings.spyRule4,
    ],
  };

  Color get accent => switch (kind) {
    FriendGameKind.photo => AppColors.cy,
    FriendGameKind.act => AppColors.op,
    FriendGameKind.bank => AppColors.gold,
    FriendGameKind.spy => AppColors.m3,
  };

  Color get ink => switch (kind) {
    FriendGameKind.photo => AppColors.priInk,
    FriendGameKind.act => AppColors.opInk,
    FriendGameKind.bank => AppColors.goldInk,
    FriendGameKind.spy => AppColors.m3Ink,
  };

  double get heroRatio => kind == FriendGameKind.act ? 3 / 2 : 358 / 150;

  static const mock = [
    FriendGame(
      kind: FriendGameKind.photo,
      titleKey: AppStrings.gamePhotoTitle,
      descriptionKey: AppStrings.gamePhotoDescription,
      lengthKey: AppStrings.gamePhotoLength,
      image: AppImages.gamePhoto,
      hero: AppColors.photoHero,
    ),
    FriendGame(
      kind: FriendGameKind.act,
      titleKey: AppStrings.gameActTitle,
      descriptionKey: AppStrings.gameActDescription,
      lengthKey: AppStrings.gameActLength,
      image: AppImages.gameAct,
      hero: AppColors.actHero,
    ),
    FriendGame(
      kind: FriendGameKind.bank,
      titleKey: AppStrings.gameBankTitle,
      descriptionKey: AppStrings.gameBankDescription,
      lengthKey: AppStrings.gameBankLength,
      image: AppImages.gameBank,
      hero: AppColors.bankHero,
      zoom: 1.12,
    ),
    FriendGame(
      kind: FriendGameKind.spy,
      titleKey: AppStrings.gameSpyTitle,
      descriptionKey: AppStrings.gameSpyDescription,
      lengthKey: AppStrings.gameSpyLength,
      image: AppImages.gameSpy,
      hero: AppColors.spyHero,
    ),
  ];
}
