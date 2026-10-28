import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/friends_app/initial_badge.dart';
import 'package:flutter/material.dart';

class SpyWordsList extends StatelessWidget {
  const SpyWordsList({
    super.key,
    required this.players,
    required this.words,
    this.title,
  });

  final List<String> players;
  final List<({int player, List<String> words})> words;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final heading = title;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 6,
      children: [
        if (heading != null && words.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Text(heading, style: AppText.listHeader),
          ),
        for (final (:player, :words) in words)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.s1,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.line),
            ),
            child: Row(
              spacing: 10,
              children: [
                InitialBadge(
                  name: players[player],
                  palette: AppColors.player(player),
                ),
                Text(players[player], style: AppText.chipName),
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final w in words)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.s2,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(w, style: AppText.wordChip),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
