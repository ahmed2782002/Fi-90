import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class FriendGameCard extends StatelessWidget {
  const FriendGameCard({
    super.key,
    required this.title,
    required this.description,
    required this.length,
    required this.image,
    required this.hero,
    required this.zoom,
    required this.onTap,
  });

  final String title;
  final String description;
  final String length;
  final String image;
  final List<Color> hero;
  final double zoom;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 262),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.mix(AppColors.cy, .4, AppColors.line),
            width: 1.5,
          ),
          boxShadow: AppShadows.sh1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 183 / 136,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-.5, -.866),
                    end: const Alignment(.5, .866),
                    colors: hero,
                    stops: const [0, .55, 1],
                  ),
                ),
                child: ClipRect(
                  child: Transform.scale(
                    scale: zoom,
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppText.gameTitle),
                    const SizedBox(height: 6),
                    Text(description, style: AppText.gameDescription),
                    const Spacer(),
                    const SizedBox(height: 6),
                    Container(
                      constraints: const BoxConstraints(minHeight: 22),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.s2,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        length,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.gameLength,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
