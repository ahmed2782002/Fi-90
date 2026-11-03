import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/animation/app_curves.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/floating_logo.dart';
import 'package:fii90/feature/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashHero extends StatelessWidget {
  const SplashHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Enter(
          fx: Fx.pop,
          duration: const Duration(milliseconds: 800),
          curve: AppCurves.pop,
          fade: false,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: SplashCubit.introDuration,
            builder: (context, intro, _) => FloatingLogo(intro: intro),
          ),
        ),
        SizedBox(height: 26.h),
        Enter(
          fx: Fx.fadeUp,
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 300),
          child: Column(
            children: [
              Text(
                context.tr(AppStrings.appName),
                textDirection: TextDirection.ltr,
                style: AppText.splashBrand,
              ),
              SizedBox(height: 14.h),
              Text(
                context.tr(AppStrings.splashTagline),
                style: AppText.splashTagline,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
