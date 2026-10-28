import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import 'fut_card_clipper.dart';

class MiniFutCard extends StatelessWidget {
  const MiniFutCard({
    super.key,
    required this.palette,
    required this.rating,
    required this.initial,
    this.highlight,
  });

  final FutPalette palette;
  final int rating;
  final String initial;
  final Color? highlight;

  @override
  Widget build(BuildContext context) {
    final glow = highlight;
    return Container(
      width: 52,
      height: 72,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.tint(AppColors.black, .35),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
          if (glow != null) BoxShadow(color: glow, blurRadius: 7),
        ],
        borderRadius: BorderRadius.circular(10),
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
                    Positioned(
                      left: 4,
                      top: 9,
                      child: Text(
                        '$rating',
                        style: AppText.miniRating(palette.ink),
                      ),
                    ),
                    Positioned.fill(
                      top: 18,
                      child: Center(
                        child: Text(
                          initial,
                          style: AppText.miniInitial(
                            AppColors.tint(palette.ink, .6),
                          ),
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
