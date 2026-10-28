import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/floating_logo.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/load_bar.dart';
import 'package:flutter/material.dart';

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
            const SizedBox(height: 26),
            Text(
              'في 90',
              textDirection: TextDirection.ltr,
              style: AppText.splashBrand,
            ),
            const SizedBox(height: 6),
            Text('مين يعرف الكورة أكتر؟', style: AppText.splashTagline),
            const LoadBar(progress: 1),
          ],
        ),
        ColoredBox(color: AppColors.bg),
      ],
    );
  }
}
