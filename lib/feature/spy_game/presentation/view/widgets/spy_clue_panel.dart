import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/friends_app/initial_badge.dart';
import 'package:fii90/core/widgets/match_app/answer_input.dart';
import 'package:flutter/material.dart';

class SpyCluePanel extends StatelessWidget {
  const SpyCluePanel({
    super.key,
    required this.round,
    required this.name,
    required this.palette,
    required this.draft,
    required this.onSay,
  });

  final int round;
  final String name;
  final PlayerPalette palette;
  final TextEditingController draft;
  final VoidCallback onSay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.s2,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                context.tr(AppStrings.roundN, args: ['$round']),
                style: AppText.stagePill,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                context.tr(AppStrings.afterSecondRound),
                textAlign: TextAlign.end,
                style: AppText.cardCaption,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.s1,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: palette.fill, width: 1.5),
            boxShadow: AppShadows.sh1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              Row(
                spacing: 10,
                children: [
                  InitialBadge(
                    name: name,
                    palette: palette,
                    size: 40,
                    radius: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr(AppStrings.turnOf, args: [name]),
                        style: AppText.optionTitle,
                      ),
                      Text(
                        context.tr(AppStrings.sayOneWord),
                        style: AppText.cardCaption,
                      ),
                    ],
                  ),
                ],
              ),
              AnswerInput(
                controller: draft,
                hint: context.tr(AppStrings.oneWordHint),
                sendLabel: context.tr(AppStrings.record),
                onSend: onSay,
                height: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
