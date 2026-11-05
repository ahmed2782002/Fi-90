import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import 'fut_card_art.dart';
import 'fut_card_style.dart';

/// Small shield card used on the pitch: tier art, cut-out photo and rating.
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
              size: 48.r,
              color: AppColors.tint(style.nameInk, .3),
            ),
          );
    return SizedBox(
      width: 52.r,
      height: 72.r,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _ShadowPainter(glow: highlight),
              child: CustomPaint(
                painter: FutCardArt(style: style, wings: false, name: false),
              ),
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: const FutBodyClipper(wings: false, inset: 8),
              child: Padding(
                padding: EdgeInsets.only(left: 14.r, top: 8.r),
                child: src == null
                    ? fallback
                    : ShaderMask(
                        blendMode: BlendMode.dstIn,
                        shaderCallback: (rect) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.transparent],
                          stops: [.7, 1],
                        ).createShader(rect),
                        child: Image.asset(
                          src,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          errorBuilder: (_, _, _) => fallback,
                        ),
                      ),
              ),
            ),
          ),
          Positioned(
            left: 5.r,
            top: 10.r,
            child: Text(
              '$rating',
              style: AppText.miniRating(style.ratingInk).copyWith(
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: .55),
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

/// Drop shadow (and optional highlight glow) that follows the shield shape.
class _ShadowPainter extends CustomPainter {
  const _ShadowPainter({this.glow});

  final Color? glow;

  @override
  void paint(Canvas canvas, Size size) {
    final shape = futShieldPath(Offset.zero & size);
    canvas.drawPath(
      shape.shift(const Offset(0, 4)),
      Paint()
        ..color = Colors.black.withValues(alpha: .35)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );
    if (glow case final g?) {
      canvas.drawPath(
        shape,
        Paint()
          ..color = g
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
      );
    }
  }

  @override
  bool shouldRepaint(_ShadowPainter old) => old.glow != glow;
}
