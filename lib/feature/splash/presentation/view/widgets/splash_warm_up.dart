import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/floating_logo.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/load_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashWarmUp extends StatelessWidget {
  const SplashWarmUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FloatingLogo(intro: 1),
            SizedBox(height: 26.h),
            Text(
              context.tr(AppStrings.appName),
              textDirection: TextDirection.ltr,
              style: AppText.splashBrand,
            ),
            SizedBox(height: 8.h),
            Text(
              context.tr(AppStrings.splashTagline),
              style: AppText.splashTagline,
            ),
            const LoadBar(progress: 1),
          ],
        ),
        ColoredBox(color: AppColors.bg),
      ],
    );
  }
}
