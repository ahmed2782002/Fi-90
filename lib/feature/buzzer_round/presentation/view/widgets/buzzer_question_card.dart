import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class BuzzerQuestionCard extends StatelessWidget {
  const BuzzerQuestionCard({
    super.key,
    required this.progress,
    required this.question,
    required this.countdown,
  });

  final String progress;
  final String question;
  final int? countdown;

  @override
  Widget build(BuildContext context) {
    final count = countdown;
    return Container(
      constraints: const BoxConstraints(minHeight: 124),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.tint(AppColors.m3, .14),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  context.tr(AppStrings.modeBell),
                  style: AppText.modeTag(AppColors.m3Ink),
                ),
              ),
              Text(
                context.tr(AppStrings.questionPoints, args: [progress, '+15']),
                style: AppText.meta,
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (count != null)
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final f in [1.0, .68]) ...[
                        FractionallySizedBox(
                          widthFactor: f,
                          child: Container(
                            height: 14,
                            margin: const EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              color: AppColors.s2,
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                Text('$count', style: AppText.readyCount),
              ],
            )
          else
            Enter(
              fx: Fx.fadeUp,
              duration: const Duration(milliseconds: 350),
              child: Text(question, style: AppText.buzzerQuestion),
            ),
        ],
      ),
    );
  }
}
