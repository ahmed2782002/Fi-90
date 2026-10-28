import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/answer_input.dart';
import 'package:fii90/core/widgets/match_app/countdown_ring.dart';
import 'package:fii90/core/widgets/match_app/spin_ring.dart';
import 'package:flutter/material.dart';

class BuzzerAnswerZone extends StatelessWidget {
  const BuzzerAnswerZone({
    super.key,
    required this.controller,
    required this.seconds,
    required this.onSend,
    required this.verifying,
    this.reboundFrom,
  });

  final TextEditingController controller;
  final int seconds;
  final VoidCallback onSend;
  final bool verifying;
  final String? reboundFrom;

  @override
  Widget build(BuildContext context) {
    final rebound = reboundFrom;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (rebound != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.tint(AppColors.me, .14),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              context.tr(AppStrings.reboundChance, args: [rebound]),
              style: AppText.modeTag(AppColors.meInk),
            ),
          ),
          const SizedBox(height: 16),
        ],
        CountdownRing(
          size: 112,
          width: 9.5,
          progress: seconds / 7,
          color: seconds <= 2 ? AppColors.bad : AppColors.me,
          child: Text('$seconds', style: AppText.countdown(44)),
        ),
        const SizedBox(height: 16),
        Text(
          context.tr(AppStrings.answerNow),
          style: AppText.feedbackTitle(AppColors.meInk, 21),
        ),
        const SizedBox(height: 16),
        AnswerInput(
          controller: controller,
          hint: context.tr(AppStrings.playerNameHint),
          sendLabel: context.tr(AppStrings.send),
          onSend: onSend,
          height: 58,
        ),
        if (verifying) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpinRing(size: 16, color: AppColors.pri, width: 2),
              const SizedBox(width: 8),
              Text(context.tr(AppStrings.verifying), style: AppText.statusLine),
            ],
          ),
        ],
      ],
    );
  }
}
