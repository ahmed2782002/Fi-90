import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:flutter/material.dart';

/// Squad size the two sides fight over in the auction.
enum AuctionSize {
  five(
    5,
    100,
    AppStrings.fiveVsFive,
    AppStrings.fiveVsFiveHint,
    AppImages.matchFive,
  ),
  eleven(
    11,
    250,
    AppStrings.elevenVsEleven,
    AppStrings.elevenVsElevenHint,
    AppImages.matchFull,
  );

  const AuctionSize(
    this.players,
    this.budget,
    this.titleKey,
    this.hintKey,
    this.image,
  );

  final int players;
  final int budget;
  final String titleKey;
  final String hintKey;
  final String image;
}

/// League the auction pool is drawn from (not used for filtering yet).
/// [all] means no league filter — every player is in the pool.
enum AuctionLeague {
  all(
    AppStrings.leagueAll,
    AppStrings.leagueAllHint,
    AppImages.leagueAll,
    Color(0xFF3FD4FF),
  ),
  laLiga(
    AppStrings.leagueSpain,
    AppStrings.leagueSpainHint,
    AppImages.leagueSpain,
    Color(0xFFFF4B4B),
  ),
  premier(
    AppStrings.leagueEngland,
    AppStrings.leagueEnglandHint,
    AppImages.leagueEngland,
    Color(0xFFB45CFF),
  ),
  egypt(
    AppStrings.leagueEgypt,
    AppStrings.leagueEgyptHint,
    AppImages.leagueEgypt,
    Color(0xFFFFC640),
  ),
  serieA(
    AppStrings.leagueItaly,
    AppStrings.leagueItalyHint,
    AppImages.leagueItaly,
    Color(0xFF2EE59D),
  );

  const AuctionLeague(this.nameKey, this.hintKey, this.image, this.accent);

  final String nameKey;
  final String hintKey;
  final String image;
  final Color accent;
}

/// One-time power card a player carries into the auction (one per auction).
enum AuctionPowerCard {
  swap(
    AppStrings.swapCard,
    AppStrings.swapCardHint,
    AppImages.powerSwap,
    Color(0xFF3FD4FF),
  ),
  golden(
    AppStrings.goldenCard,
    AppStrings.goldenCardHint,
    AppImages.powerGolden,
    Color(0xFFFFC640),
  ),
  reveal(
    AppStrings.revealCard,
    AppStrings.revealCardHint,
    AppImages.powerReveal,
    Color(0xFFB98CFF),
  ),
  freeze(
    AppStrings.freezeCard,
    AppStrings.freezeCardHint,
    AppImages.powerFreeze,
    Color(0xFF9FF3FF),
  );

  const AuctionPowerCard(this.titleKey, this.hintKey, this.image, this.accent);

  final String titleKey;
  final String hintKey;
  final String image;
  final Color accent;
}

/// What the player picked on the setup screen before finding an opponent.
/// The defaults — every league and no card — are the "just play" entry.
class AuctionConfig {
  const AuctionConfig({
    this.squad = AuctionSize.eleven,
    this.league = AuctionLeague.all,
    this.card,
  });

  final AuctionSize squad;
  final AuctionLeague league;

  /// The single power card taken in, or `null` to play without one.
  final AuctionPowerCard? card;

  AuctionConfig copyWith({AuctionSize? squad, AuctionLeague? league}) =>
      AuctionConfig(
        squad: squad ?? this.squad,
        league: league ?? this.league,
        card: card,
      );

  AuctionConfig withCard(AuctionPowerCard? card) =>
      AuctionConfig(squad: squad, league: league, card: card);
}
