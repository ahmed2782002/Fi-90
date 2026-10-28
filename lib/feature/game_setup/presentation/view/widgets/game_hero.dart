import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class GameHero extends StatelessWidget {
  const GameHero({
    super.key,
    required this.image,
    required this.hero,
    required this.title,
    required this.length,
    required this.ratio,
    this.zoom = 1,
  });

  final String image;
  final List<Color> hero;
  final String title;
  final String length;
  final double ratio;
  final double zoom;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: ratio,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: hero,
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.line),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Transform.scale(
              scale: zoom,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -.2),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0, .6],
                  colors: [
                    AppColors.tint(AppColors.groundShadow, .85),
                    AppColors.tint(AppColors.groundShadow, 0),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              start: 16,
              end: 16,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppText.gameHeroTitle),
                  Text(length, style: AppText.heroLength),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
