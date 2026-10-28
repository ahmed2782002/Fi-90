import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/spy_game/presentation/view/widgets/spy_choice_tile.dart';
import 'package:flutter/material.dart';

class SpyVoteView extends StatelessWidget {
  const SpyVoteView({
    super.key,
    required this.players,
    required this.voter,
    required this.suspects,
    required this.selected,
    required this.onSelect,
    required this.onConfirm,
  });

  final List<String> players;
  final int voter;
  final List<int> suspects;
  final int? selected;
  final ValueChanged<int> onSelect;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final choice = selected;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.s1,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: AppColors.player(voter).fill, width: 1.5),
            boxShadow: AppShadows.sh1,
          ),
          child: Column(
            spacing: 6,
            children: [
              Text(
                context.tr(AppStrings.votesNow, args: [players[voter]]),
                style: AppText.resultTitle(AppColors.tx),
              ),
              Text(
                context.tr(
                  AppStrings.whoIsSpyVote,
                  args: ['${voter + 1}', '${players.length}'],
                ),
                textAlign: TextAlign.center,
                style: AppText.cardCaption,
              ),
            ],
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.15,
          children: [
            for (final j in suspects)
              SpyChoiceTile(
                label: players[j],
                badge: players[j].characters.first,
                color: AppColors.redGlow,
                badgeColor: AppColors.player(j).fill,
                badgeInk: AppColors.player(j).on,
                selected: choice == j,
                tag: context.tr(AppStrings.suspect),
                onTap: () => onSelect(j),
              ),
          ],
        ),
        PressScale(
          onTap: onConfirm,
          child: Container(
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: choice == null ? AppColors.transparent : AppColors.redGlow,
              borderRadius: BorderRadius.circular(999),
              border: choice == null
                  ? Border.all(color: AppColors.line2, width: 1.5)
                  : null,
            ),
            child: Text(
              choice == null
                  ? context.tr(AppStrings.pickSuspect)
                  : context.tr(AppStrings.confirmVote, args: [players[choice]]),
              style: choice == null ? AppText.boardHint : AppText.roomShare,
            ),
          ),
        ),
      ],
    );
  }
}
