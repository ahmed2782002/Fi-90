import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XpCard extends StatelessWidget {
  const XpCard({
    super.key,
    required this.title,
    required this.xp,
    required this.progress,
    required this.rankLine,
    required this.coins,
  });

  final String title;
  final int xp;
  final double progress;
  final String rankLine;
  final int? coins;

  @override
  Widget build(BuildContext context) {
    final bonus = coins;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: AppText.cardTitle)),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.skewX(-.1763),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '+$xp XP',
                    textDirection: TextDirection.ltr,
                    style: AppText.points(22),
                  ),
                ),
              ),
              if (bonus != null) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 12, 5),
                  decoration: BoxDecoration(
                    color: AppColors.s1,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.gold, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.coin, width: 18, height: 18),
                      const SizedBox(width: 6),
                      Text(
                        '+$bonus',
                        textDirection: TextDirection.ltr,
                        style: AppText.coinBonus,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOut,
              builder: (context, value, _) => Container(
                height: 8,
                color: AppColors.s3,
                alignment: AlignmentDirectional.centerStart,
                child: FractionallySizedBox(
                  widthFactor: value,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.pri, AppColors.goldGlow],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('LV 24', style: AppText.meta),
              Text(rankLine, style: AppText.meta),
            ],
          ),
        ],
      ),
    );
  }
}
