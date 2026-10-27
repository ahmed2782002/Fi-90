import 'dart:ui' show ImageFilter;

import 'package:fii90/core/animation/app_curves.dart';
import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/brand_logo/brand_logo.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/float_layer.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/logo_slab.dart';
import 'package:flutter/material.dart';

class FloatingLogo extends StatelessWidget {
  const FloatingLogo({super.key, required this.intro});

  final double intro;

  static const _period = Duration(milliseconds: 4500);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 250,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 10,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    radius: .5,
                    colors: [
                      AppColors.tint(AppColors.cy, .42),
                      AppColors.tint(AppColors.pri, .18),
                      AppColors.tint(AppColors.pri, 0),
                    ],
                    stops: const [0, .55, .75],
                  ),
                ),
              ),
            ),
          ),
          Loop(
            period: _period,
            builder: (context, t, _) => SizedBox(
              width: 196,
              height: 196,
              child: Stack(
                children: [
                  FloatLayer(
                    wave: AppCurves.wave(t),
                    offset: const Offset(6, 14),
                    depth: -20,
                    child: const LogoSlab(colors: [AppColors.logoDeep, AppColors.logoInk]),
                  ),
                  FloatLayer(
                    wave: AppCurves.wave(t),
                    offset: const Offset(3, 7),
                    depth: -10,
                    child: const LogoSlab(colors: [AppColors.priD, AppColors.stk2]),
                  ),
                  FloatLayer(wave: AppCurves.wave(t), child: BrandLogo.hero(intro: intro)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Loop(
              period: _period,
              builder: (context, t, _) => Opacity(
                opacity: .55 - .2 * AppCurves.wave(t),
                child: Transform.scale(
                  scale: 1 - .14 * AppCurves.wave(t),
                  child: Container(
                    width: 150,
                    height: 22,
                    decoration: BoxDecoration(
                      gradient: AppGradients.closestSide([
                        AppColors.tint(AppColors.groundShadow, .75),
                        AppColors.tint(AppColors.groundShadow, 0),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
