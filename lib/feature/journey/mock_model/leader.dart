import 'package:fii90/core/localization/app_strings.dart';

class Leader {
  const Leader({required this.nameKey, required this.score});

  final String nameKey;
  final String score;

  static const boards = [
    AppStrings.boardGlobal,
    AppStrings.boardWeekly,
    AppStrings.boardMonthly,
    AppStrings.boardFriends,
    AppStrings.boardSeason,
  ];

  static const myRanks = ['#128', '#34', '#61', '#3', '#212'];
  static const myScore = '2,340';

  static const mock = [
    Leader(nameKey: AppStrings.mockPlayerKarim, score: ''),
    Leader(nameKey: AppStrings.mockPlayerYousef, score: ''),
    Leader(nameKey: AppStrings.mockPlayerMariam, score: ''),
    Leader(nameKey: AppStrings.mockPlayerSara, score: '4,980'),
    Leader(nameKey: AppStrings.mockPlayerOmar, score: '4,812'),
    Leader(nameKey: AppStrings.mockPlayerHassan, score: '4,640'),
    Leader(nameKey: AppStrings.mockPlayerNour, score: '4,420'),
  ];
}
