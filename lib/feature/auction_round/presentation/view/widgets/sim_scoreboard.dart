import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class SimScoreboard extends StatelessWidget {
  const SimScoreboard({
    super.key,
    required this.minuteLabel,
    required this.progress,
    required this.goalsMe,
    required this.goalsOpp,
    required this.meAverage,
    required this.oppAverage,
    required this.opponent,
    this.penalties,
  });

  final String minuteLabel;
  final double progress;
  final int goalsMe;
  final int goalsOpp;
  final int meAverage;
  final int oppAverage;
  final String opponent;
  final String? penalties;

  @override
  Widget build(BuildContext context) {
    final pens = penalties;
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final teams = [
      (context.tr(AppStrings.yourTeam), meAverage),
      (opponent, oppAverage),
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColors.grad,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.neon, width: 1.5),
        boxShadow: AppShadows.glow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.tint(AppColors.black, .25),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  context.tr(AppStrings.aiMatch),
                  style: AppText.aiMatchTag,
                ),
              ),
              Text(
                minuteLabel,
                textDirection: TextDirection.ltr,
                style: AppText.simMinute,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              for (final (i, (name, avg)) in teams.indexed) ...[
                if (i == 1)
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '${rtl ? goalsOpp : goalsMe}'),
                        TextSpan(text: ' : ', style: AppText.simColon),
                        TextSpan(text: '${rtl ? goalsMe : goalsOpp}'),
                      ],
                    ),
                    textDirection: TextDirection.ltr,
                    style: AppText.simScore,
                  ),
                Expanded(
                  child: Column(
                    children: [
                      Text(name, style: AppText.simTeam),
                      Text('⌀ $avg', style: AppText.simAverage),
                    ],
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5,
              color: AppColors.neon,
              backgroundColor: AppColors.tint(AppColors.white, .18),
            ),
          ),
          if (pens != null) ...[
            const SizedBox(height: 12),
            Text(
              context.tr(AppStrings.penalties, args: [pens]),
              textAlign: TextAlign.center,
              style: AppText.penaltiesLine,
            ),
          ],
        ],
      ),
    );
  }
}
