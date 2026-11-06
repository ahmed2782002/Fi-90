import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import 'fut_card_style.dart';

/// Small card used on the pitch: tier art, cut-out photo and rating.
class MiniFutCard extends StatelessWidget {
  const MiniFutCard({
    super.key,
    required this.palette,
    required this.rating,
    required this.initial,
    this.photo,
    this.highlight,
  });

  final FutPalette palette;
  final int rating;
  final String initial;
  final String? photo;
  final Color? highlight;

  @override
  Widget build(BuildContext context) {
    final style = FutCardStyle.of(palette);
    final src = photo;
    final w = 54.r;
    final h = w / FutCardStyle.aspect;
    final fallback = src == null
        ? Center(
            child: Text(
              initial,
              style: AppText.miniInitial(AppColors.tint(style.nameInk, .6)),
            ),
          )
        : Align(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.person_rounded,
              size: 40.r,
              color: AppColors.tint(style.nameInk, .3),
            ),
          );
    final light = style.ratingInk.computeLuminance() >= .3;
    return SizedBox(
      width: w,
      height: h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Drop shadow (and optional highlight glow) behind the card body.
          Positioned(
            left: w * .12,
            right: w * .12,
            top: h * .08,
            bottom: h * .08,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .35),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                  if (highlight case final g?)
                    BoxShadow(color: g, blurRadius: 10, spreadRadius: 1),
                ],
              ),
            ),
          ),
          Positioned.fill(child: Image.asset(style.art, fit: BoxFit.fill)),
          Positioned(
            left: w * .24,
            right: w * .13,
            top: h * .12,
            height: h * (style.photoBottom - .12) + h * .06,
            child: src == null
                ? fallback
                : ShaderMask(
                    blendMode: BlendMode.dstIn,
                    shaderCallback: (rect) => const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.transparent],
                      stops: [.72, 1],
                    ).createShader(rect),
                    child: Image.asset(
                      src,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (_, _, _) => fallback,
                    ),
                  ),
          ),
          Positioned(
            left: w * .15,
            top: h * .14,
            child: Text(
              '$rating',
              style: AppText.miniRating(style.ratingInk).copyWith(
                shadows: [
                  Shadow(
                    color: light
                        ? Colors.black.withValues(alpha: .6)
                        : Colors.white.withValues(alpha: .7),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
