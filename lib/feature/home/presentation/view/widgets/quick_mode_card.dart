import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class QuickModeCard extends StatelessWidget {
  const QuickModeCard({
    super.key,
    required this.title,
    required this.hint,
    required this.image,
    required this.accent,
    required this.glow,
    required this.contain,
    required this.onTap,
  });

  final String title;
  final String hint;
  final String image;
  final Color accent;
  final Color glow;
  final bool contain;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.tint(accent, .5), width: 1.5),
          boxShadow: AppShadows.card(glow),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: ColoredBox(
                color: AppColors.bg,
                child: Image.asset(
                  image,
                  fit: contain ? BoxFit.contain : BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.tint(accent, .35),
                      width: 1.5,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 30,
                      decoration: BoxDecoration(
                        color: accent,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: AppShadows.accent(glow),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: AppText.modeTitle),
                          Text(
                            hint,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppText.modeSubtitle,
                          ),
                        ],
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
