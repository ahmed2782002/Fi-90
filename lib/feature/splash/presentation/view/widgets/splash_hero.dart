import 'package:fii90/core/animation/app_curves.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/floating_logo.dart';
import 'package:fii90/feature/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';

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
        const SizedBox(height: 26),
        Enter(
          fx: Fx.fadeUp,
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 300),
          child: Column(
            children: [
              Text('في 90',
                  textDirection: TextDirection.ltr, style: AppText.splashBrand),
              const SizedBox(height: 6),
              Text('مين يعرف الكورة أكتر؟', style: AppText.splashTagline),
            ],
          ),
        ),
      ],
    );
  }
}
