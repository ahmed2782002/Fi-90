import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key, required this.coins});

  final int coins;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppColors.grad,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.neon, width: 1.5),
        boxShadow: AppShadows.glow,
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.coin, width: 52, height: 52),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(AppStrings.balance),
                  style: AppText.balanceLabel,
                ),
                Text(
                  context.tr(AppStrings.coinsAmount, args: ['$coins']),
                  style: AppText.balanceValue,
                ),
                Text(
                  context.tr(AppStrings.coinsPerWin),
                  style: AppText.balanceHint,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
