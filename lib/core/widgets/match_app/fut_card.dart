import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import 'fut_card_style.dart';

/// FUT-style card: the tier's background art with the player's cut-out photo,
/// overall rating, position and name drawn on top.
///
/// Laid out on a fixed [width]×[height] canvas (the art's proportions); wrap
/// it in a [FittedBox] to size it.
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
  static const height = width / FutCardStyle.aspect;

  static const _photoLeft = .30 * width;
  static const _photoRight = .135 * width;
  static const _photoTop = .115 * height;

  @override
  Widget build(BuildContext context) {
    final style = FutCardStyle.of(palette);
    final src = photo;
    final shadow = _shadow(style.ratingInk);
    final photoBottom = style.photoBottom * height;
    final silhouette = Align(
      alignment: Alignment.bottomCenter,
      child: Icon(
        Icons.person_rounded,
        size: 190,
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
            child: Image.asset(
              style.art,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.medium,
            ),
          ),
          Positioned(
            left: _photoLeft,
            right: _photoRight,
            top: _photoTop,
            height: photoBottom - _photoTop,
            child: src == null
                ? Center(
                    child: Text(
                      initial,
                      style: AppText.futInitial(
                        style.ratingInk.withValues(alpha: .35),
                      ).copyWith(fontSize: 160),
                    ),
                  )
                : _Faded(
                    child: Image.asset(
                      src,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      filterQuality: FilterQuality.medium,
                      errorBuilder: (_, _, _) => silhouette,
                    ),
                  ),
          ),
          Positioned(
            left: .12 * width,
            top: .15 * height,
            width: 92,
            child: Column(
              children: [
                Text(
                  rating,
                  style: AppText.futRating(
                    style.ratingInk,
                  ).copyWith(fontSize: 64, height: .9, shadows: shadow),
                ),
                const SizedBox(height: 4),
                Text(
                  position,
                  style: AppText.futPosition(
                    style.ratingInk,
                  ).copyWith(fontSize: 26, shadows: shadow),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 44,
                  height: 1.4,
                  color: style.ratingInk.withValues(alpha: .6),
                ),
              ],
            ),
          ),
          Positioned(
            left: .17 * width,
            right: .17 * width,
            top: style.nameCenter * height - 22,
            height: 44,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                name,
                maxLines: 1,
                style: AppText.futName(style.nameInk).copyWith(
                  fontSize: 38,
                  letterSpacing: 1,
                  shadows: _shadow(style.nameInk),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Soft light halo for dark ink, dark shadow for light ink.
List<Shadow> _shadow(Color ink) => [
  ink.computeLuminance() < .3
      ? Shadow(
          color: Colors.white.withValues(alpha: .55),
          offset: const Offset(0, 1),
          blurRadius: 2,
        )
      : Shadow(color: Colors.black.withValues(alpha: .5), blurRadius: 6),
];

/// Fades the photo out at the bottom and the sides so it melts into the art.
class _Faded extends StatelessWidget {
  const _Faded({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white, Colors.white, Colors.transparent],
        stops: [0, .78, 1],
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
          stops: [0, .1, .9, 1],
        ).createShader(rect),
        child: child,
      ),
    );
  }
}
