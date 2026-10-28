import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/countdown_ring.dart';
import 'package:flutter/material.dart';

class QuestionTimerCard extends StatelessWidget {
  const QuestionTimerCard({
    super.key,
    required this.tag,
    required this.question,
    required this.seconds,
    required this.total,
    required this.ringColor,
    required this.urgent,
  });

  final String tag;
  final String question;
  final int seconds;
  final int total;
  final Color ringColor;
  final bool urgent;

  @override
  Widget build(BuildContext context) {
    final ring = CountdownRing(
      size: 72,
      width: 7.5,
      progress: seconds / total,
      color: ringColor,
      child: Text(
        '$seconds',
        style: AppText.timerValue(urgent ? AppColors.badInk : AppColors.tx),
      ),
    );
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.tint(AppColors.pri, .14),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(tag, style: AppText.modeTag(AppColors.priInk)),
                ),
                const SizedBox(height: 8),
                Text(question, style: AppText.questionText),
              ],
            ),
          ),
          const SizedBox(width: 14),
          urgent
              ? Loop(
                  period: const Duration(milliseconds: 600),
                  builder: (context, t, child) => Transform.scale(
                    scale: 1 + .08 * (1 - (2 * t - 1).abs()),
                    child: child,
                  ),
                  child: ring,
                )
              : ring,
        ],
      ),
    );
  }
}
