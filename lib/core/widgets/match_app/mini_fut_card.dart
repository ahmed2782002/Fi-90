import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import 'fut_card_clipper.dart';

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

  Widget _initial() => Center(
    child: Text(
      initial,
      style: AppText.miniInitial(AppColors.tint(palette.ink, .6)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final glow = highlight;
    return Container(
      width: 52.r,
      height: 72.r,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.tint(AppColors.black, .35),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
          if (glow != null) BoxShadow(color: glow, blurRadius: 7),
        ],
        borderRadius: BorderRadius.circular(10.r),
      ),
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
              clipper: const FutCardClipper(inset: 7.7),
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
                      top: 10.r,
                      left: 10.r,
                      child: photo == null
                          ? _initial()
                          : ShaderMask(
                              blendMode: BlendMode.dstIn,
                              shaderCallback: (rect) => const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.white, Colors.transparent],
                                stops: [.6, 1],
                              ).createShader(rect),
                              child: Image.asset(
                                photo!,
                                fit: BoxFit.cover,
                                alignment: const Alignment(0, -.6),
                                errorBuilder: (_, _, _) => _initial(),
                              ),
                            ),
                    ),
                    Positioned(
                      left: 4.w,
                      top: 9.r,
                      child: Text(
                        '$rating',
                        style: AppText.miniRating(palette.ink).copyWith(
                          shadows: [
                            Shadow(
                              color: palette.background.first,
                              blurRadius: 4,
                            ),
                          ],
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
