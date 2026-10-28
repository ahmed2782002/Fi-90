import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/game_setup/presentation/view/widgets/team_names_card.dart';
import 'package:flutter/material.dart';

class TeamSlotsSection extends StatelessWidget {
  const TeamSlotsSection({super.key, required this.slots, required this.pairs});

  final List<List<TextEditingController>> slots;
  final bool pairs;

  @override
  Widget build(BuildContext context) {
    final cards = [
      for (final (i, team) in slots.indexed)
        TeamNamesCard(
          label: context.tr(switch ((pairs, i)) {
            (true, 0) => AppStrings.firstTeam,
            (true, _) => AppStrings.secondTeam,
            (false, 0) => AppStrings.firstPlayer,
            (false, _) => AppStrings.secondPlayer,
          }),
          color: AppColors.player(i).fill,
          fields: [
            for (final (j, c) in (pairs ? team : team.take(1)).indexed)
              (
                controller: c,
                hint: pairs
                    ? context.tr(AppStrings.playerN, args: ['${j + 1}'])
                    : context.tr(AppStrings.theName),
              ),
          ],
        ),
    ];
    return pairs
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 10,
            children: cards,
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [for (final c in cards) Expanded(child: c)],
          );
  }
}
