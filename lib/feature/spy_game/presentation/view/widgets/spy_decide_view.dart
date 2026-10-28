import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/spy_game/presentation/view/widgets/spy_choice_tile.dart';
import 'package:flutter/material.dart';

class SpyDecideView extends StatelessWidget {
  const SpyDecideView({
    super.key,
    required this.round,
    required this.onVote,
    required this.onMore,
  });

  final int round;
  final VoidCallback onVote;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Enter(
          fx: Fx.fadeIn,
          child: Column(
            spacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.s2,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  context.tr(AppStrings.roundDone, args: ['$round']),
                  style: AppText.stagePill,
                ),
              ),
              Text(
                context.tr(AppStrings.voteOrMore),
                textAlign: TextAlign.center,
                style: AppText.cardTitleBig,
              ),
              Text(
                context.tr(AppStrings.voteOrMoreHint),
                textAlign: TextAlign.center,
                style: AppText.pageIntro,
              ),
            ],
          ),
        ),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: SpyChoiceTile(
                label: context.tr(AppStrings.letsVote),
                badge: '✓',
                color: AppColors.redGlow,
                onTap: onVote,
              ),
            ),
            Expanded(
              child: SpyChoiceTile(
                label: context.tr(AppStrings.oneMoreRound),
                badge: '↻',
                color: AppColors.neon,
                badgeColor: AppColors.pri,
                onTap: onMore,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
