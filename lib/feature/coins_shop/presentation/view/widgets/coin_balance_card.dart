import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinBalanceCard extends StatelessWidget {
  const CoinBalanceCard({super.key, required this.coins});

  final String coins;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        gradient: AppColors.shopBalance,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(
          color: AppColors.tint(AppColors.gold, .6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.tint(AppColors.goldGlow, .22),
            blurRadius: 22,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 72.r,
            height: 72.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.tint(AppColors.goldGlow, .55),
                  blurRadius: 22,
                ),
              ],
            ),
            child: const Image(image: AssetImage(AppImages.coin90)),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(AppStrings.balance),
                  style: AppText.shopBalanceLabel,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      coins,
                      textDirection: TextDirection.ltr,
                      style: AppText.shopBalanceValue,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      context.tr(AppStrings.coinsUnit),
                      style: AppText.shopBalanceUnit,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
