import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../top_gloss.dart';
import 'logo_face.dart';
import 'logo_inset_painter.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo._({
    super.key,
    required this.size,
    required this.faceSize,
    required this.radius,
    required this.borderWidth,
    required this.highlight,
    required this.shadows,
    required this.glossStop,
    required this.glossAlpha,
    required this.insetTop,
    required this.insetBottomBlur,
    this.intro = 1,
  });

  BrandLogo.small({Key? key})
      : this._(
          key: key,
          size: 64,
          faceSize: 61,
          radius: 22,
          borderWidth: 1.5,
          highlight: AppColors.logoSmallHighlight,
          shadows: [
            BoxShadow(color: AppColors.tint(AppColors.cy, .35), blurRadius: 18),
          ],
          glossStop: .42,
          glossAlpha: .22,
          insetTop: 2,
          insetBottomBlur: 8,
        );

  BrandLogo.hero({Key? key, double intro = 1})
      : this._(
          key: key,
          size: 196,
          faceSize: 192,
          radius: 58,
          borderWidth: 2,
          highlight: AppColors.logoHeroHighlight,
          shadows: [
            BoxShadow(color: AppColors.tint(AppColors.cy, .5), blurRadius: 34),
            BoxShadow(color: AppColors.tint(AppColors.pri, .45), blurRadius: 80),
          ],
          glossStop: .40,
          glossAlpha: .26,
          insetTop: 4,
          insetBottomBlur: 24,
          intro: intro,
        );

  final double size;
  final double faceSize;
  final double radius;
  final double borderWidth;
  final Color highlight;
  final List<BoxShadow> shadows;
  final double glossStop;
  final double glossAlpha;
  final double insetTop;
  final double insetBottomBlur;
  final double intro;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.cy, width: borderWidth),
        boxShadow: shadows,
        gradient: RadialGradient(
          center: const Alignment(-.4, -.8),
          radius: 1.05,
          colors: [highlight, AppColors.gradStart, AppColors.priD, AppColors.logoDeep],
          stops: const [0, .4, .75, 1],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius - borderWidth),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: LogoInsetPainter(
                  radius: radius - borderWidth,
                  topLight: insetTop,
                  bottomBlur: insetBottomBlur,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              width: faceSize,
              height: faceSize,
              child: FittedBox(child: LogoFace(intro: intro)),
            ),
            TopGloss(fraction: glossStop, alpha: glossAlpha),
          ],
        ),
      ),
    );
  }
}
