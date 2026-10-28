import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class SideScoreCard extends StatelessWidget {
  const SideScoreCard({
    super.key,
    required this.name,
    required this.initial,
    required this.score,
    required this.fill,
    required this.onFill,
    required this.ink,
    this.leadLabel,
  });

  final String name;
  final String initial;
  final int score;
  final Color fill;
  final Color onFill;
  final Color ink;
  final String? leadLabel;

  @override
  Widget build(BuildContext context) {
    final lead = leadLabel;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.tint(fill, .4), width: 1.5),
          boxShadow: AppShadows.sh1,
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: fill,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Text(initial, style: AppText.bigInitial(17, onFill)),
            ),
            const SizedBox(height: 6),
            Text(name, style: AppText.sideName),
            const SizedBox(height: 6),
            Text('$score', style: AppText.bigScore),
            if (lead != null) ...[
              const SizedBox(height: 6),
              Text(lead, style: AppText.leadTag(ink)),
            ],
          ],
        ),
      ),
    );
  }
}
