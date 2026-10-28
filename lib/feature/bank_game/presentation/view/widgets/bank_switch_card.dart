import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class BankSwitchCard extends StatelessWidget {
  const BankSwitchCard({
    super.key,
    required this.team,
    required this.banked,
    required this.lost,
    required this.nextLabel,
    required this.onNext,
  });

  final String team;
  final int banked;
  final int lost;
  final String nextLabel;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Enter(
      fx: Fx.fadeIn,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.line),
          boxShadow: AppShadows.sh1,
        ),
        child: Column(
          spacing: 12,
          children: [
            Text(
              context.tr(AppStrings.teamQuestionsDone, args: [team]),
              textAlign: TextAlign.center,
              style: AppText.dialogTitle,
            ),
            Text.rich(
              TextSpan(
                text: context.tr(AppStrings.bankedTotal),
                children: [
                  TextSpan(text: ' $banked', style: AppText.budgetBig),
                ],
              ),
              style: AppText.ruleBody,
            ),
            if (lost > 0)
              Text(
                context.tr(AppStrings.lostUnbanked, args: ['$lost']),
                style: AppText.feedbackNote(AppColors.badInk),
              ),
            PrimaryButton(label: nextLabel, onTap: onNext, height: 56),
          ],
        ),
      ),
    );
  }
}
