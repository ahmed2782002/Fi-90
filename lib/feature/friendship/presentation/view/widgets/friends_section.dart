import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/friendship/mock_model/buddy.dart';
import 'package:fii90/feature/friendship/presentation/view/widgets/buddy_tile.dart';
import 'package:fii90/feature/friendship/presentation/view/widgets/friend_challenge_button.dart';
import 'package:flutter/material.dart';

class FriendsSection extends StatelessWidget {
  const FriendsSection({
    super.key,
    required this.friends,
    required this.onChallenge,
  });

  final List<Buddy> friends;
  final ValueChanged<Buddy> onChallenge;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
          child: Text(
            context.tr(AppStrings.friendsHeader, args: ['${friends.length}']),
            style: AppText.listHeader,
          ),
        ),
        for (final f in friends) ...[
          const SizedBox(height: 16),
          BuddyTile(
            name: f.translated ? context.tr(f.name) : f.name,
            subtitle: context.tr(f.status.labelKey),
            subtitleColor: f.status.labelColor,
            background: f.background,
            foreground: f.foreground,
            dot: f.status.dot,
            actions: [
              FriendChallengeButton(
                label: context.tr(AppStrings.challenge),
                enabled: f.status.canChallenge,
                onTap: () => onChallenge(f),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
