import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: onTap,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.tint(AppColors.bad, .1),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.bad, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.logout,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(AppColors.badInk, BlendMode.srcIn),
            ),
            const SizedBox(width: 10),
            Text(context.tr(AppStrings.logout), style: AppText.logout),
          ],
        ),
      ),
    );
  }
}
