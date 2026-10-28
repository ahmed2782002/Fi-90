import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/act_game/presentation/view/widgets/act_card_tile.dart';
import 'package:fii90/feature/act_game/presentation/view_model/act_game_state.dart';
import 'package:flutter/material.dart';

class ActDeckGrid extends StatelessWidget {
  const ActDeckGrid({
    super.key,
    required this.deck,
    required this.shuffles,
    required this.onPick,
  });

  final List<DeckCard> deck;
  final int shuffles;
  final ValueChanged<int> onPick;

  static const rows = [(0, 3), (3, 3), (6, 4)];

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: ValueKey(shuffles),
      tween: Tween(begin: shuffles == 0 ? 0 : 1, end: 0),
      duration: const Duration(milliseconds: 850),
      builder: (context, t, child) => Transform.rotate(
        angle: t * .06 * (shuffles.isOdd ? 1 : -1),
        child: child,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          spacing: 10,
          children: [
            for (final (start, count) in rows)
              Row(
                spacing: 10,
                children: [
                  for (var i = start; i < start + count; i++)
                    Expanded(
                      child: ActCardTile(
                        number: i + 1,
                        name: deck[i].result == null
                            ? null
                            : deck[i].card.name.of(context),
                        ok: deck[i].result != null && deck[i].result! >= 0,
                        resultColor: switch (deck[i].result) {
                          null => null,
                          < 0 => AppColors.bad,
                          final r => AppColors.player(r).fill,
                        },
                        onTap: () => onPick(i),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
