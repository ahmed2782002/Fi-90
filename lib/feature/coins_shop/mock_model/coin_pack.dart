import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum CoinPackTag {
  none(null),
  bestSeller(AppStrings.packBestSeller),
  bestValue(AppStrings.packBestValue);

  const CoinPackTag(this.labelKey);

  final String? labelKey;

  Color get color => this == bestValue ? AppColors.ok : AppColors.gold;

  Color get ink =>
      this == bestValue ? AppColors.checkInk : AppColors.stickerInk;

  double get glow => this == bestValue ? .25 : .28;
}

class CoinPack {
  const CoinPack({
    required this.amount,
    required this.bonus,
    required this.price,
    required this.coinSize,
    this.tag = CoinPackTag.none,
  });

  final int amount;
  final int bonus;
  final String price;
  final double coinSize;
  final CoinPackTag tag;

  int get total => amount + bonus;

  static const mock = [
    CoinPack(amount: 100, bonus: 0, price: '29.99', coinSize: 62),
    CoinPack(amount: 300, bonus: 30, price: '79.99', coinSize: 66),
    CoinPack(
      amount: 700,
      bonus: 100,
      price: '149.99',
      coinSize: 70,
      tag: CoinPackTag.bestSeller,
    ),
    CoinPack(amount: 1500, bonus: 300, price: '299.99', coinSize: 72),
    CoinPack(
      amount: 3500,
      bonus: 900,
      price: '599.99',
      coinSize: 76,
      tag: CoinPackTag.bestValue,
    ),
    CoinPack(amount: 8000, bonus: 2500, price: '1,199.99', coinSize: 80),
  ];
}
