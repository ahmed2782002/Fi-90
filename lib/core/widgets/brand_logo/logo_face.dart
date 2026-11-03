import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_icons.dart';
import '../../constants/app_images.dart';
import '../../theme/app_text.dart';
import 'logo_face_painter.dart';

class LogoFace extends StatelessWidget {
  const LogoFace({super.key, required this.intro});

  final double intro;

  double get _flyT => (intro / .5).clamp(0.0, 1.0);
  double get _flyEase => 1 - math.pow(1 - _flyT, 3).toDouble();
  double get _flyOpacity => (_flyT * 4).clamp(0.0, 1.0);
  double get _flyScale => .45 + .55 * _flyEase;
  double get _nineEase =>
      1 - math.pow(1 - ((intro - .45) / .4).clamp(0.0, 1.0), 2).toDouble();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.r,
      height: 56.r,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: LogoFacePainter(
                nineStyle: AppText.logoNine,
                nineOpacity: _nineEase,
                nineDy: 6 * (1 - _nineEase),
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: _flyOpacity,
              child: Transform(
                transform: Matrix4.identity()
                  ..translateByDouble(
                    -34 * (1 - _flyEase),
                    40 * (1 - _flyEase),
                    0,
                    1,
                  )
                  ..scaleByDouble(_flyScale, _flyScale, 1, 1),
                child: SvgPicture.asset(
                  AppIcons.ball,
                  width: 56.r,
                  height: 56.r,
                ),
              ),
            ),
          ),
          Positioned(
            left: 32.6.w,
            top: 30.6.r,
            width: 14.r,
            height: 22.5.r,
            child: Image.asset(AppImages.brandFi, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
