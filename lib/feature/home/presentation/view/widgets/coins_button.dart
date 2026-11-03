import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              height: 44.r,
              margin: EdgeInsetsDirectional.only(start: 14.w),
              padding: EdgeInsetsDirectional.only(start: 44.w, end: 6.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999.r),
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
                    constraints: BoxConstraints(minWidth: 28.r),
                    child: Text(
                      '$coins',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      style: AppText.coins,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 32.r,
                    height: 32.r,
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
                      width: 16.r,
                      height: 16.r,
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              start: 0,
              top: -3,
              child: Image(
                image: AssetImage(AppImages.coin90),
                width: 50.r,
                height: 50.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
