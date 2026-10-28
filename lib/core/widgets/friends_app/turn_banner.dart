import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class TurnBanner extends StatelessWidget {
  const TurnBanner({
    super.key,
    required this.color,
    required this.title,
    this.subtitle,
  });

  final Color color;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final sub = subtitle;
    return Container(
      constraints: const BoxConstraints(minHeight: 44),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.mix(color, .12, AppColors.s1),
        borderRadius: BorderRadius.circular(sub == null ? 999 : 24),
        border: Border.all(color: color, width: 1.5),
      ),
      child: sub == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                Flexible(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppText.turnBanner,
                  ),
                ),
              ],
            )
          : Column(
              spacing: 2,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppText.turnBanner,
                ),
                Text(
                  sub,
                  textAlign: TextAlign.center,
                  style: AppText.turnBannerSub,
                ),
              ],
            ),
    );
  }
}
