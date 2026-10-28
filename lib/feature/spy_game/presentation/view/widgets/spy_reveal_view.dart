import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/friends_app/initial_badge.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SpyRevealView extends StatelessWidget {
  const SpyRevealView({
    super.key,
    required this.players,
    required this.spy,
    required this.caught,
    required this.tally,
    required this.options,
    required this.secret,
    required this.guess,
    required this.onGuess,
    required this.onFinish,
  });

  final List<String> players;
  final int spy;
  final bool caught;
  final List<int> tally;
  final List<String> options;
  final String secret;
  final int? guess;
  final ValueChanged<int> onGuess;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    final picked = guess;
    final right = picked != null && options[picked] == secret;
    final spyName = players[spy];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 10,
      children: [
        Enter(
          fx: Fx.fadeUp,
          child: Column(
            spacing: 6,
            children: [
              Text(context.tr(AppStrings.spy), style: AppText.spyMark(14)),
              Text(spyName, style: AppText.cardTitleBig),
              Text(
                context.tr(
                  caught ? AppStrings.spyCaught : AppStrings.spyEscaped,
                ),
                style: AppText.feedbackNote(
                  caught ? AppColors.okInk : AppColors.badInk,
                ),
              ),
            ],
          ),
        ),
        for (final (j, name) in players.indexed)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.s1,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: j == spy ? AppColors.redGlow : AppColors.line,
                width: 1.5,
              ),
            ),
            child: Row(
              spacing: 10,
              children: [
                InitialBadge(name: name, palette: AppColors.player(j)),
                Expanded(child: Text(name, style: AppText.chipName)),
                Text(
                  context.tr(AppStrings.votesCount, args: ['${tally[j]}']),
                  style: AppText.noPoints,
                ),
              ],
            ),
          ),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: picked == null
                ? AppColors.mix(AppColors.bad, .1, AppColors.s1)
                : AppColors.s1,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: picked == null
                  ? AppColors.redGlow
                  : right
                  ? AppColors.okInk
                  : AppColors.badInk,
              width: 1.5,
            ),
          ),
          child: Column(
            spacing: 10,
            children: picked == null
                ? [
                    Text(
                      context.tr(AppStrings.spyGuessPrompt, args: [spyName]),
                      textAlign: TextAlign.center,
                      style: AppText.optionTitle,
                    ),
                    Text(
                      context.tr(AppStrings.spyGuessHint),
                      style: AppText.cardCaption,
                    ),
                    for (var r = 0; r < options.length; r += 2)
                      Row(
                        spacing: 8,
                        children: [
                          for (var i = r; i < r + 2 && i < options.length; i++)
                            Expanded(
                              child: PressScale(
                                onTap: () => onGuess(i),
                                child: Container(
                                  height: 52,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.s1,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color: AppColors.line2,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    options[i],
                                    textAlign: TextAlign.center,
                                    style: AppText.chipName,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ]
                : [
                    Text(
                      right
                          ? context.tr(
                              AppStrings.spyGuessedRight,
                              args: [spyName],
                            )
                          : context.tr(
                              AppStrings.spyGuessedWrong,
                              args: [spyName, options[picked]],
                            ),
                      textAlign: TextAlign.center,
                      style: AppText.feedbackNote(
                        right ? AppColors.okInk : AppColors.badInk,
                      ),
                    ),
                    Text(
                      context.tr(AppStrings.playerWas, args: [secret]),
                      style: AppText.pageIntro,
                    ),
                  ],
          ),
        ),
        if (picked != null)
          PrimaryButton(
            label: context.tr(AppStrings.seePoints),
            onTap: onFinish,
            height: 56,
          ),
      ],
    );
  }
}
