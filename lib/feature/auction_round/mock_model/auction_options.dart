import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:flutter/material.dart';

/// Squad size the two sides fight over in the auction.
enum AuctionSize {
  five(5, 100, '1-2-1', AppStrings.fiveVsFive, AppStrings.fiveVsFiveHint),
  eleven(
    11,
    250,
    '4-3-3',
    AppStrings.elevenVsEleven,
    AppStrings.elevenVsElevenHint,
  );

  const AuctionSize(
    this.players,
    this.budget,
    this.shape,
    this.titleKey,
    this.hintKey,
  );

  final int players;
  final int budget;
  final String shape;
  final String titleKey;
  final String hintKey;
}

/// League the auction pool is drawn from (not used for filtering yet).
enum AuctionLeague {
  laLiga(AppStrings.leagueSpain, AppStrings.leagueSpainHint, 'ESP', [
    Color(0xFFFF4B4B),
    Color(0xFFB8001F),
  ]),
  premier(AppStrings.leagueEngland, AppStrings.leagueEnglandHint, 'ENG', [
    Color(0xFFB45CFF),
    Color(0xFF3D0A6E),
  ]),
  egypt(AppStrings.leagueEgypt, AppStrings.leagueEgyptHint, 'EGY', [
    Color(0xFFFFC640),
    Color(0xFFC8102E),
  ]),
  serieA(AppStrings.leagueItaly, AppStrings.leagueItalyHint, 'ITA', [
    Color(0xFF3FD4FF),
    Color(0xFF0B3BA8),
  ]);

  const AuctionLeague(this.nameKey, this.hintKey, this.code, this.colors);

  final String nameKey;
  final String hintKey;
  final String code;
  final List<Color> colors;
}

/// One-time power cards a player carries into the auction.
enum AuctionPowerCard {
  swap(AppStrings.swapCard, AppStrings.swapCardHint, AppIcons.swap),
  golden(AppStrings.goldenCard, AppStrings.goldenCardHint, AppIcons.crown);

  const AuctionPowerCard(this.titleKey, this.hintKey, this.icon);

  final String titleKey;
  final String hintKey;
  final String icon;
}

/// What the player picked on the setup screen before finding an opponent.
class AuctionConfig {
  const AuctionConfig({
    this.squad = AuctionSize.eleven,
    this.league = AuctionLeague.laLiga,
    this.cards = const {AuctionPowerCard.swap, AuctionPowerCard.golden},
  });

  final AuctionSize squad;
  final AuctionLeague league;
  final Set<AuctionPowerCard> cards;

  AuctionConfig copyWith({
    AuctionSize? squad,
    AuctionLeague? league,
    Set<AuctionPowerCard>? cards,
  }) => AuctionConfig(
    squad: squad ?? this.squad,
    league: league ?? this.league,
    cards: cards ?? this.cards,
  );

  AuctionConfig toggle(AuctionPowerCard card) {
    final next = {...cards};
    if (!next.remove(card)) next.add(card);
    return copyWith(cards: next);
  }
}
