import 'package:fii90/core/localization/localized_text.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/auction_round/mock_model/players/coaches.dart';
import 'package:fii90/feature/auction_round/mock_model/players/elite_players.dart';
import 'package:fii90/feature/auction_round/mock_model/players/gold_players.dart';
import 'package:fii90/feature/auction_round/mock_model/players/icon_players.dart';
import 'package:fii90/feature/auction_round/mock_model/players/silver_players.dart';

enum PlayerRole { gk, df, mf, fw, co }

/// A player (or coach) that can be put up in the auction round.
///
/// [clues] go from broad to narrow: the first fits many players, the second
/// narrows it down, and the third is close but still leaves a couple of
/// believable candidates.
class AuctionPlayer {
  const AuctionPlayer({
    required this.id,
    required this.name,
    required this.short,
    required this.role,
    required this.rating,
    required this.clues,
    this.label,
    this.legend = false,
  });

  final String id;
  final LocalizedText name;
  final LocalizedText short;
  final PlayerRole role;
  final int rating;
  final List<LocalizedText> clues;
  final String? label;
  final bool legend;

  String get card => short.en.toUpperCase();

  String get photo => 'assets/image/players/$id.jpg';

  String get position =>
      label ??
      switch (role) {
        PlayerRole.gk => 'GK',
        PlayerRole.df => 'CB',
        PlayerRole.mf => 'CM',
        PlayerRole.fw => 'ST',
        PlayerRole.co => 'MGR',
      };

  FutPalette get palette => legend
      ? AppColors.futIcon
      : rating >= 90
      ? AppColors.futElite
      : rating >= 85
      ? AppColors.futBurgundy
      : rating >= 80
      ? AppColors.futGold
      : AppColors.futSilver;

  /// Hidden attributes used only by the match simulator; derived from the
  /// rating and role so the data files only need the overall.
  List<int> get stats {
    final shape = switch (role) {
      PlayerRole.gk => const [2, -1, -12, 3, -30, 1],
      PlayerRole.df => const [-6, -25, -10, -12, 3, 2],
      PlayerRole.mf => const [-6, -6, 3, 2, -12, -6],
      PlayerRole.fw => const [2, 2, -6, 1, -40, -8],
      PlayerRole.co => const [2, 0, 0, 1, 0, 0],
    };
    final seed = id.codeUnits.fold(7, (h, c) => (h * 31 + c) & 0xFFFF);
    return [
      for (var i = 0; i < 6; i++)
        (rating + shape[i] + ((seed >> i) % 5) - 2).clamp(30, 99),
    ];
  }

  static final List<AuctionPlayer> pool = [
    ...elitePlayers,
    ...goldPlayers,
    ...silverPlayers,
    ...iconPlayers,
    ...coaches,
  ];

  static final Map<String, AuctionPlayer> all = {for (final p in pool) p.id: p};
}
