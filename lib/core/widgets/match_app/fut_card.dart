import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import 'fut_card_clipper.dart';
import 'fut_card_ornaments.dart';

/// FUT-style player card: tier colours, ornate frame, the player's photo and
/// the overall rating only (no attribute breakdown).
class FutCard extends StatelessWidget {
  const FutCard({
    super.key,
    required this.palette,
    required this.rating,
    required this.position,
    required this.name,
    required this.initial,
    this.photo,
  });

  final FutPalette palette;
  final String rating;
  final String position;
  final String name;
  final String initial;

  /// Asset path of the player's photo; falls back to [initial] when null or
  /// missing.
  final String? photo;

  @override
  Widget build(BuildContext context) {
    final ink = palette.ink;
    final src = photo;
    final placeholder = Center(
      child: Text(initial, style: AppText.futInitial(AppColors.tint(ink, .35))),
    );
    return SizedBox(
      width: 252.r,
      height: 373.r,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: const FutCardClipper(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: palette.frame,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: const FutCardClipper(inset: 3.5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: palette.background,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(
                        painter: FutCardOrnaments(
                          ink: ink,
                          accent: palette.frame.first,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 66.r,
                      right: 16.r,
                      top: 30.r,
                      height: 220.r,
                      child: src == null
                          ? placeholder
                          : ShaderMask(
                              blendMode: BlendMode.dstIn,
                              shaderCallback: (rect) => const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.white,
                                  Colors.white,
                                  Colors.transparent,
                                ],
                                stops: [0, .1, .72, 1],
                              ).createShader(rect),
                              child: ShaderMask(
                                blendMode: BlendMode.dstIn,
                                shaderCallback: (rect) => const LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.white,
                                    Colors.white,
                                    Colors.transparent,
                                  ],
                                  stops: [0, .18, .85, 1],
                                ).createShader(rect),
                                child: Image.asset(
                                  src,
                                  fit: BoxFit.cover,
                                  alignment: const Alignment(0, -.6),
                                  filterQuality: FilterQuality.medium,
                                  errorBuilder: (_, _, _) => placeholder,
                                ),
                              ),
                            ),
                    ),
                    Positioned(
                      left: 18.r,
                      top: 50.r,
                      width: 64.r,
                      child: Column(
                        children: [
                          Text(rating, style: AppText.futRating(ink)),
                          SizedBox(height: 4.r),
                          Text(position, style: AppText.futPosition(ink)),
                          SizedBox(height: 6.r),
                          Container(
                            width: 34.r,
                            height: 1.5.r,
                            color: AppColors.tint(ink, .5),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 24.r,
                      right: 24.r,
                      top: 246.r,
                      height: 34.r,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          name,
                          maxLines: 1,
                          style: AppText.futName(ink),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
