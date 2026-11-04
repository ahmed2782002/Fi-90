import 'dart:math';

import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/localization/localized_text.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';

/// One auction lot: [a] is the hidden player both sides bid on, [b] is the
/// player the side that passed gets for free.
class AuctionPair {
  const AuctionPair({required this.slot, required this.a, required this.b});

  final String slot;
  final String a;
  final String b;

  List<LocalizedText> get clues => AuctionPlayer.all[a]!.clues;

  bool get coach => slot == 'CO';

  String get slotKey => slotKeyOf(slot);

  static String slotKeyOf(String slot) => switch (slot.substring(0, 2)) {
    'GK' => AppStrings.slotGoalkeeper,
    'DF' => AppStrings.slotDefence,
    'MF' => AppStrings.slotMidfield,
    'FW' => AppStrings.slotAttack,
    _ => AppStrings.slotCoach,
  };

  static PlayerRole roleOf(String slot) => switch (slot.substring(0, 2)) {
    'GK' => PlayerRole.gk,
    'DF' => PlayerRole.df,
    'MF' => PlayerRole.mf,
    'FW' => PlayerRole.fw,
    _ => PlayerRole.co,
  };

  /// Preferred card position per slot, so full-back slots get full-backs.
  static const _labelFor = {'DF2': 'RB', 'DF4': 'LB'};

  static const fiveSlots = ['GK', 'DF', 'MF1', 'MF2', 'FW', 'CO'];
  static const elevenSlots = [
    'GK',
    'DF1',
    'DF2',
    'DF3',
    'DF4',
    'MF1',
    'MF2',
    'MF3',
    'FW1',
    'FW2',
    'FW3',
    'CO',
  ];

  /// Draws a fresh set of lots from the whole player pool, with no player
  /// appearing twice in the same auction.
  static List<AuctionPair> draw(int size, Random random) {
    final used = <String>{};
    String pick(PlayerRole role, String? label) {
      List<AuctionPlayer> options(bool strict) => [
        for (final p in AuctionPlayer.pool)
          if (p.role == role &&
              !used.contains(p.id) &&
              (!strict || label == null || p.label == label))
            p,
      ];
      final list = options(true).isNotEmpty ? options(true) : options(false);
      final p = list[random.nextInt(list.length)];
      used.add(p.id);
      return p.id;
    }

    return [
      for (final slot in size == 11 ? elevenSlots : fiveSlots)
        AuctionPair(
          slot: slot,
          a: pick(roleOf(slot), _labelFor[slot]),
          b: pick(roleOf(slot), _labelFor[slot]),
        ),
    ];
  }
}
