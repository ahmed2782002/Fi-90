import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/friends_app/initial_badge.dart';
import 'package:flutter/material.dart';

class BankQuestionCard extends StatelessWidget {
  const BankQuestionCard({
    super.key,
    required this.player,
    required this.palette,
    required this.levelLabel,
    required this.levelColor,
    required this.question,
    this.answer,
  });

  final String player;
  final PlayerPalette palette;
  final String levelLabel;
  final Color levelColor;
  final String question;
  final String? answer;

  @override
  Widget build(BuildContext context) {
    final reveal = answer;
    return Container(
      constraints: const BoxConstraints(minHeight: 170),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        gradient: AppColors.grad,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.neon, width: 1.5),
        boxShadow: AppShadows.glow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12,
        children: [
          Row(
            children: [
              InitialBadge(name: player, palette: palette),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.tr(AppStrings.questionFor, args: [player]),
                  style: AppText.questionFor,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: levelColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(levelLabel, style: AppText.levelTag),
              ),
            ],
          ),
          Text(question, style: AppText.bankQuestion),
          if (reveal != null)
            Enter(
              fx: Fx.fadeIn,
              duration: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.tint(AppColors.black, .25),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  context.tr(AppStrings.theAnswer, args: [reveal]),
                  style: AppText.bankAnswer,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
