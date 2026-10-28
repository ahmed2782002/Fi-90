import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinsButton extends StatelessWidget {
  const CoinsButton({super.key, required this.coins, required this.onTap});

  final int coins;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: context.tr(AppStrings.buyCoins),
      child: PressScale(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 44,
              margin: const EdgeInsetsDirectional.only(start: 14),
              padding: const EdgeInsetsDirectional.only(start: 44, end: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.s2, AppColors.s1],
                ),
                border: Border.all(color: AppColors.tint(AppColors.gold, .45)),
                boxShadow: AppShadows.sh1,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 28),
                    child: Text(
                      '$coins',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      style: AppText.coins,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.coinLight, AppColors.coinDeep],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.tint(AppColors.gold, .4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      AppIcons.plus,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ],
              ),
            ),
            const PositionedDirectional(
              start: 0,
              top: -3,
              child: Image(
                image: AssetImage(AppImages.coin90),
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
