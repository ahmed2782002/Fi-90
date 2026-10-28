import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/loop.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/answer_input.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/trivia_round/presentation/view_model/trivia_cubit.dart';
import 'package:flutter/material.dart';

class MyAnswerBar extends StatelessWidget {
  const MyAnswerBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onPass,
    required this.block,
    required this.strikes,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onPass;
  final PassBlock? block;
  final int strikes;

  @override
  Widget build(BuildContext context) {
    final ready = block == null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Loop(
              period: const Duration(seconds: 1),
              builder: (context, t, child) => Opacity(
                opacity: 1 - .7 * (1 - (2 * t - 1).abs()),
                child: child,
              ),
              child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: AppColors.me,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              context.tr(AppStrings.yourTurnAnswer),
              style: AppText.turnHeading(AppColors.meInk),
            ),
          ],
        ),
        const SizedBox(height: 10),
        AnswerInput(
          controller: controller,
          hint: context.tr(AppStrings.typePlayerName),
          sendLabel: context.tr(AppStrings.send),
          onSend: onSend,
        ),
        const SizedBox(height: 10),
        PressScale(
          onTap: onPass,
          child: Container(
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ready ? AppColors.tint(AppColors.gold, .14) : AppColors.s2,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ready ? AppColors.gold : AppColors.line2,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PASS',
                  style: AppText.passWord(
                    ready ? AppColors.goldInk : AppColors.dim,
                    struck: block == PassBlock.used,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  switch (block) {
                    null => context.tr(AppStrings.passUseOnce),
                    PassBlock.locked => context.tr(
                      AppStrings.passLocked,
                      args: ['$strikes'],
                    ),
                    PassBlock.used => context.tr(AppStrings.passUsedAlready),
                    PassBlock.chain => context.tr(AppStrings.passChain),
                  },
                  style: ready
                      ? AppText.passHint(AppColors.goldInk)
                      : AppText.passHintMuted,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
