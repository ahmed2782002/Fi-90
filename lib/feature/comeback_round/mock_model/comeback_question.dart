import 'package:fii90/core/localization/localized_text.dart';
import 'package:fii90/feature/comeback_round/mock_model/comeback_clubs.dart';
import 'package:fii90/feature/comeback_round/mock_model/comeback_players.dart';

enum ComebackDifficulty { easy, medium, hard }

class ComebackQuestion {
  const ComebackQuestion({
    required this.id,
    required this.difficulty,
    required this.name,
    required this.aliases,
    required this.meta,
    required this.wrong,
    required this.clubs,
  });

  final String id;
  final ComebackDifficulty difficulty;
  final LocalizedText name;
  final List<String> aliases;
  final LocalizedText meta;
  final List<String> wrong;

  /// Career stints, oldest first: the club and the year the player joined.
  final List<({ComebackClub club, String year})> clubs;

  /// Photo shown when the player is revealed.
  String get image => 'assets/image/comeback/player_images/$id.webp';

  static const mock = comebackPlayers;
}
