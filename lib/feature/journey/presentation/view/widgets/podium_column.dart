import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class PodiumColumn extends StatelessWidget {
  const PodiumColumn({
    super.key,
    required this.name,
    required this.rank,
    required this.avatarSize,
    required this.avatarRadius,
    required this.initialSize,
    required this.barHeight,
    required this.rankSize,
    required this.rankColor,
    this.first = false,
  });

  final String name;
  final int rank;
  final double avatarSize;
  final double avatarRadius;
  final double initialSize;
  final double barHeight;
  final double rankSize;
  final Color rankColor;
  final bool first;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: avatarSize,
            height: avatarSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: first ? AppColors.gold : AppColors.s3,
              borderRadius: BorderRadius.circular(avatarRadius),
              boxShadow: first
                  ? [
                      BoxShadow(
                        color: AppColors.tint(AppColors.gold, .4),
                        offset: const Offset(0, 10),
                        blurRadius: 30,
                      ),
                    ]
                  : null,
            ),
            child: Text(
              name.characters.first,
              style: AppText.leaderInitial(
                initialSize,
                first ? AppColors.leaderGoldInk : AppColors.tx,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(name, style: AppText.leaderName),
          const SizedBox(height: 6),
          Container(
            height: barHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: first ? null : AppColors.s1,
              gradient: first
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.mix(AppColors.gold, .26, AppColors.s1),
                        AppColors.s1,
                      ],
                    )
                  : null,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
                bottom: Radius.circular(6),
              ),
              border: first
                  ? Border.all(color: AppColors.gold, width: 1.5)
                  : Border.all(color: AppColors.line),
            ),
            child: Text(
              '$rank',
              style: AppText.leaderRank(rankSize, rankColor),
            ),
          ),
        ],
      ),
    );
  }
}
