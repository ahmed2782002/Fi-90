import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/friends/mock_model/friend_game.dart';
import 'package:fii90/feature/friends/presentation/view/widgets/friend_game_card.dart';
import 'package:fii90/feature/game_setup/presentation/view/screen/game_setup_screen.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  static const _games = FriendGame.mock;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 9, 18, 110),
        children: [
          Text(
            context.tr(AppStrings.friendsGamesTitle),
            style: AppText.screenTitle,
          ),
          const SizedBox(height: 2),
          Text(
            context.tr(AppStrings.friendsGamesSubtitle),
            style: AppText.screenSubtitle,
          ),
          const SizedBox(height: 14),
          for (var row = 0; row < _games.length; row += 2) ...[
            if (row > 0) const SizedBox(height: 12),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final game in _games.sublist(row, row + 2)) ...[
                    if (game != _games[row]) const SizedBox(width: 12),
                    Expanded(
                      child: FriendGameCard(
                        title: context.tr(game.titleKey),
                        description: context.tr(game.descriptionKey),
                        length: context.tr(game.lengthKey),
                        image: game.image,
                        hero: game.hero,
                        zoom: game.zoom,
                        onTap: () =>
                            Nav.push(context, GameSetupScreen(game: game)),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
