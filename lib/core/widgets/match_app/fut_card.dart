import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import 'fut_card_art.dart';
import 'fut_card_style.dart';

/// FUT-style shield card: tier art, the player's cut-out photo blended into
/// the card, and the overall rating only (no attribute breakdown).
///
/// Laid out on a fixed 300×400 canvas; wrap it in a [FittedBox] to size it.
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

  /// Asset path of the player's cut-out; null shows a big [initial] (used by
  /// the mystery card), a missing asset shows a silhouette.
  final String? photo;

  static const width = 300.0;
  static const height = 400.0;

  @override
  Widget build(BuildContext context) {
    final style = FutCardStyle.of(palette);
    final src = photo;
    final darkInk = style.ratingInk.computeLuminance() < .3;
    final shadow = [
      darkInk
          ? Shadow(
              color: Colors.white.withValues(alpha: .8),
              offset: const Offset(0, 1.5),
              blurRadius: 2,
            )
          : Shadow(color: Colors.black.withValues(alpha: .35), blurRadius: 6),
    ];
    final silhouette = Align(
      alignment: Alignment.bottomCenter,
      child: Icon(
        Icons.person_rounded,
        size: 200,
        color: AppColors.tint(style.nameInk, .25),
      ),
    );
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: CustomPaint(painter: FutCardArt(style: style)),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: const FutBodyClipper(),
              child: Stack(
                children: [
                  if (src == null)
                    Positioned(
                      left: 96,
                      top: 70,
                      width: 170,
                      height: 190,
                      child: Center(
                        child: Text(
                          initial,
                          style: AppText.futInitial(
                            style.ratingInk.withValues(alpha: .35),
                          ).copyWith(fontSize: 170),
                        ),
                      ),
                    )
                  else
                    Positioned(
                      left: 92,
                      top: 56,
                      width: 184,
                      height: 221,
                      child: ShaderMask(
                        blendMode: BlendMode.dstIn,
                        shaderCallback: (rect) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.transparent,
                          ],
                          stops: [0, .8, 1],
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
                            stops: [0, .1, .92, 1],
                          ).createShader(rect),
                          child: Image.asset(
                            src,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            filterQuality: FilterQuality.medium,
                            errorBuilder: (_, _, _) => silhouette,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 38,
            top: 66,
            width: 84,
            child: Column(
              children: [
                Text(
                  rating,
                  style: AppText.futRating(style.ratingInk)
                      .copyWith(fontSize: 66, height: .9, shadows: shadow),
                ),
                const SizedBox(height: 4),
                Text(
                  position,
                  style: AppText.futPosition(style.ratingInk)
                      .copyWith(fontSize: 28, shadows: shadow),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 48,
                  height: 1.4,
                  color: style.ratingInk.withValues(alpha: .6),
                ),
              ],
            ),
          ),
          Positioned(
            left: 44,
            right: 44,
            top: 262,
            height: 46,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                name,
                maxLines: 1,
                style: AppText.futName(style.nameInk).copyWith(
                  fontSize: 42,
                  letterSpacing: 1,
                  shadows: [
                    Shadow(
                      color: style.ratingInk.withValues(alpha: .35),
                      offset: const Offset(0, 1),
                      blurRadius: 1,
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
