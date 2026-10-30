import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppText {
  static TextStyle _cairo(
    double size, {
    FontWeight weight = FontWeight.w400,
    Color? color,
    double? height,
    List<Shadow>? shadows,
    double? letterSpacing,
    bool tabular = false,
  }) {
    return GoogleFonts.cairo(
      fontSize: size,
      fontWeight: weight,
      color: color ?? AppColors.tx,
      height: height,
      shadows: shadows,
      letterSpacing: letterSpacing,
      fontFeatures: tabular ? const [FontFeature.tabularFigures()] : null,
    );
  }

  static List<Shadow> get outline => [
    Shadow(color: AppColors.stk2, offset: Offset(0, 6)),
    Shadow(color: AppColors.stk, offset: Offset(2.5, 0)),
    Shadow(color: AppColors.stk, offset: Offset(-2.5, 0)),
    Shadow(color: AppColors.stk, offset: Offset(0, 2.5)),
    Shadow(color: AppColors.stk, offset: Offset(0, -2.5)),
    Shadow(color: AppColors.stk, offset: Offset(1.8, 1.8)),
    Shadow(color: AppColors.stk, offset: Offset(-1.8, -1.8)),
    Shadow(color: AppColors.stk, offset: Offset(1.8, -1.8)),
    Shadow(color: AppColors.stk, offset: Offset(-1.8, 1.8)),
  ];

  static TextStyle get logoNine =>
      GoogleFonts.rubik(fontSize: 40, fontWeight: FontWeight.w900);

  static TextStyle get splashBrand => _cairo(
    38,
    weight: FontWeight.w900,
    height: 1.3,
    shadows: outline,
    color: AppColors.white,
  );
  static TextStyle get splashTagline => _cairo(18, weight: FontWeight.w800);

  static TextStyle get headerBrand =>
      _cairo(13, weight: FontWeight.w700, color: AppColors.mu);
  static TextStyle get skip =>
      _cairo(14, weight: FontWeight.w500, color: AppColors.mu);
  static TextStyle get slideTitle => _cairo(
    31,
    weight: FontWeight.w900,
    height: 1.35,
    shadows: outline,
    color: AppColors.white,
  );
  static TextStyle get slideBody =>
      _cairo(15, weight: FontWeight.w500, color: AppColors.tx2, height: 1.85);
  static TextStyle get button =>
      _cairo(18, weight: FontWeight.w700, color: AppColors.white);

  static TextStyle get versus => _cairo(
    26,
    weight: FontWeight.w900,
    shadows: [Shadow(color: AppColors.stk2, offset: Offset(0, 2))],
    color: AppColors.white,
  );
  static TextStyle get timer => _cairo(14, weight: FontWeight.w800);
  static TextStyle get cardInitial => _cairo(30, weight: FontWeight.w900);
  static TextStyle get cardName => _cairo(17, weight: FontWeight.w800);
  static TextStyle get tag =>
      _cairo(11, weight: FontWeight.w700, color: AppColors.mu);
  static TextStyle get modeNumber =>
      _cairo(72, weight: FontWeight.w900, height: 1);
  static TextStyle get chip => _cairo(12, weight: FontWeight.w800);
  static TextStyle get pill =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.tx2);
  static TextStyle get sticker => _cairo(
    22,
    weight: FontWeight.w900,
    color: AppColors.stickerInk,
    height: 1.2,
  );
  static TextStyle get stickerSmall =>
      _cairo(18, weight: FontWeight.w900, color: AppColors.stickerInk);

  static TextStyle get avatarLarge => _cairo(26, weight: FontWeight.w900);
  static TextStyle get avatarSmall => _cairo(22, weight: FontWeight.w900);
  static TextStyle get podiumName => _cairo(13, weight: FontWeight.w700);
  static TextStyle get podiumRank =>
      _cairo(30, weight: FontWeight.w900, height: 1);

  static TextStyle get loginTitle => _cairo(
    30,
    weight: FontWeight.w900,
    height: 1.35,
    shadows: outline,
    color: AppColors.white,
  );
  static TextStyle get loginSubtitle =>
      _cairo(15, color: AppColors.tx2, height: 1.7);
  static TextStyle get terms => _cairo(12, color: AppColors.mu, height: 1.8);
  static TextStyle get termsLink =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.priInk, height: 1.8);
  static TextStyle get perk => _cairo(13, weight: FontWeight.w800);
  static TextStyle get social => _cairo(16, weight: FontWeight.w700);
  static TextStyle get toast => _cairo(13, weight: FontWeight.w600);

  static TextStyle get playerLevel =>
      _cairo(26, weight: FontWeight.w900, height: 1, color: AppColors.white);
  static TextStyle get playerLevelLabel =>
      _cairo(10, weight: FontWeight.w800, color: AppColors.priInk, height: 1);
  static TextStyle get playerTag =>
      _cairo(10, weight: FontWeight.w800, color: AppColors.white);
  static TextStyle get playerHeadline =>
      _cairo(17, weight: FontWeight.w900, color: AppColors.white);
  static TextStyle get statValue =>
      _cairo(14, weight: FontWeight.w900, height: 1.3, color: AppColors.white);
  static TextStyle get statLabel => _cairo(
    10,
    weight: FontWeight.w800,
    color: AppColors.paleBlue,
    height: 1.3,
  );
  static TextStyle get checkMark =>
      _cairo(18, weight: FontWeight.w900, color: AppColors.checkInk, height: 1);

  static TextStyle get coins =>
      _cairo(18, weight: FontWeight.w900, height: 1, letterSpacing: .3);
  static TextStyle get countBadge => _cairo(
    11,
    weight: FontWeight.w800,
    color: AppColors.white,
    height: 20 / 11,
  );
  static TextStyle get onlineCount =>
      _cairo(12, weight: FontWeight.w500, color: AppColors.white);
  static TextStyle get heroWatermark => _cairo(
    120,
    weight: FontWeight.w800,
    color: AppColors.tint(AppColors.white, .1),
    height: 1,
    letterSpacing: -6,
  );
  static TextStyle get heroTitle => _cairo(
    32,
    weight: FontWeight.w900,
    height: 1.25,
    shadows: outline,
    color: AppColors.white,
  );
  static TextStyle get heroSubtitle =>
      _cairo(14, color: AppColors.tint(AppColors.white, .85), height: 1.6);
  static TextStyle get heroButton =>
      _cairo(18, weight: FontWeight.w800, color: AppColors.playInk);
  static TextStyle get heroArrow =>
      _cairo(20, weight: FontWeight.w800, color: AppColors.playInk);
  static TextStyle get sectionTitle => _cairo(17, weight: FontWeight.w700);
  static TextStyle get sectionHint =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.priInk);
  static TextStyle get sectionLink =>
      _cairo(13, weight: FontWeight.w500, color: AppColors.priInk);
  static TextStyle get modeTitle =>
      _cairo(15, weight: FontWeight.w800, height: 1.35);
  static TextStyle get modeSubtitle =>
      _cairo(11, weight: FontWeight.w500, color: AppColors.tx2, height: 1.5);
  static TextStyle get ringLabel => _cairo(14, weight: FontWeight.w800);
  static TextStyle get dailyMeta =>
      _cairo(11, weight: FontWeight.w500, color: AppColors.goldInk);
  static TextStyle get dailyTitle =>
      _cairo(15, weight: FontWeight.w700, height: 1.5);
  static TextStyle get xpBadge =>
      _cairo(14, weight: FontWeight.w900, color: AppColors.stickerInk);
  static TextStyle resultTag(Color color) =>
      _cairo(12, weight: FontWeight.w700, color: color);
  static TextStyle get lastOpponent => _cairo(14, weight: FontWeight.w500);
  static TextStyle get lastScore =>
      _cairo(18, weight: FontWeight.w800, tabular: true);
  static TextStyle get meta => _cairo(12, color: AppColors.mu);
  static TextStyle navLabel(Color color) =>
      _cairo(11, weight: FontWeight.w500, color: color);

  static TextStyle get screenTitle => _cairo(24, weight: FontWeight.w800);
  static TextStyle get screenSubtitle =>
      _cairo(13, weight: FontWeight.w500, color: AppColors.mu, height: 1.7);
  static TextStyle get gameTitle =>
      _cairo(18, weight: FontWeight.w800, height: 1.35);
  static TextStyle get gameDescription =>
      _cairo(11.5, color: AppColors.mu, height: 1.6);
  static TextStyle get gameLength => _cairo(
    10,
    weight: FontWeight.w700,
    color: AppColors.tx2,
    height: 18 / 10,
  );

  static TextStyle segment(Color color) =>
      _cairo(14, weight: FontWeight.w800, color: color);
  static TextStyle segmentSmall(Color color) =>
      _cairo(13, weight: FontWeight.w700, color: color);
  static TextStyle filter(Color color) =>
      _cairo(13, weight: FontWeight.w500, color: color);
  static TextStyle leaderInitial(double size, Color color) =>
      _cairo(size, weight: FontWeight.w800, color: color);
  static TextStyle get leaderName => _cairo(13, weight: FontWeight.w500);
  static TextStyle leaderRank(double size, Color color) =>
      _cairo(size, weight: FontWeight.w800, color: color);
  static TextStyle get rankIndex =>
      _cairo(14, weight: FontWeight.w700, color: AppColors.mu);
  static TextStyle get rowInitial => _cairo(14, weight: FontWeight.w700);
  static TextStyle get rowName => _cairo(14, weight: FontWeight.w500);
  static TextStyle get rowScore =>
      _cairo(15, weight: FontWeight.w700, tabular: true);
  static TextStyle get myRank =>
      _cairo(15, weight: FontWeight.w800, color: AppColors.meInk);
  static TextStyle get myInitial =>
      _cairo(14, weight: FontWeight.w800, color: AppColors.meOn);
  static TextStyle get myName => _cairo(14, weight: FontWeight.w700);
  static TextStyle get myBoard => _cairo(11, color: AppColors.mu);
  static TextStyle get historyOpponent => _cairo(15, weight: FontWeight.w700);
  static TextStyle get historyScore => _cairo(20, weight: FontWeight.w800);

  static TextStyle get profileInitial =>
      _cairo(32, weight: FontWeight.w800, color: AppColors.white);
  static TextStyle get profileName =>
      _cairo(24, weight: FontWeight.w800, color: AppColors.white);
  static TextStyle get profileTag =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.white);
  static TextStyle get profileRank =>
      _cairo(30, weight: FontWeight.w800, height: 1, color: AppColors.white);
  static TextStyle get profileRankLabel =>
      _cairo(11, color: AppColors.tint(AppColors.white, .8));
  static TextStyle get xpProgress => _cairo(
    11,
    weight: FontWeight.w500,
    color: AppColors.tint(AppColors.white, .85),
  );
  static TextStyle statPillValue(Color color) =>
      _cairo(22, weight: FontWeight.w800, color: color, height: 1);
  static TextStyle get statPillLabel => _cairo(11, color: AppColors.mu);
  static TextStyle get cardTitle => _cairo(15, weight: FontWeight.w700);
  static TextStyle get performanceLabel => _cairo(13, weight: FontWeight.w500);
  static TextStyle get performanceValue => _cairo(13, weight: FontWeight.w700);
  static TextStyle get groupTitle => _cairo(
    12,
    weight: FontWeight.w700,
    color: AppColors.dim,
    letterSpacing: .5,
  );
  static TextStyle get rowTitle => _cairo(14, weight: FontWeight.w700);
  static TextStyle get rowSubtitle => _cairo(12, color: AppColors.mu);
  static TextStyle get rowCoins =>
      _cairo(13, weight: FontWeight.w800, color: AppColors.goldInk);
  static TextStyle get rowBadge => _cairo(
    11,
    weight: FontWeight.w800,
    color: AppColors.white,
    height: 22 / 11,
  );
  static TextStyle get logout =>
      _cairo(15, weight: FontWeight.w800, color: AppColors.badInk);
  static TextStyle get version =>
      _cairo(11, weight: FontWeight.w500, color: AppColors.dim);

  static TextStyle get sheetTitle => _cairo(22, weight: FontWeight.w900);
  static TextStyle get sheetSubtitle =>
      _cairo(13, weight: FontWeight.w500, color: AppColors.mu);
  static TextStyle get sheetClose =>
      _cairo(18, weight: FontWeight.w700, color: AppColors.mu, height: 1);
  static TextStyle get optionTitle => _cairo(16, weight: FontWeight.w800);
  static TextStyle get optionSubtitle =>
      _cairo(12, color: AppColors.mu, height: 1.6);

  static TextStyle toastMessage(Color color) =>
      _cairo(14, weight: FontWeight.w700, color: color);
  static TextStyle get pageTitle => _cairo(22, weight: FontWeight.w900);
  static TextStyle get pageIntro =>
      _cairo(14, color: AppColors.mu, height: 1.8);
  static TextStyle get fieldLabel =>
      _cairo(13, weight: FontWeight.w700, color: AppColors.mu);
  static TextStyle fieldText(
    Color color, {
    double size = 15,
    double? height,
    FontWeight weight = FontWeight.w600,
  }) => _cairo(size, weight: weight, color: color, height: height);
  static TextStyle get linked =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.okInk);
  static TextStyle get changePhoto =>
      _cairo(13, weight: FontWeight.w600, color: AppColors.priInk);
  static TextStyle get editInitial =>
      _cairo(40, weight: FontWeight.w900, color: AppColors.meOn);
  static TextStyle get editPlus =>
      _cairo(16, weight: FontWeight.w800, color: AppColors.white, height: 1);
  static TextStyle actionButton(double size, {Color? color}) =>
      _cairo(size, weight: FontWeight.w800, color: color ?? AppColors.white);
  static TextStyle selectChip(Color color) =>
      _cairo(13, weight: FontWeight.w700, color: color);
  static TextStyle get faqQuestion =>
      _cairo(14, weight: FontWeight.w700, height: 1.6);
  static TextStyle get faqAnswer =>
      _cairo(13, color: AppColors.tx2, height: 1.9);
  static TextStyle faqIcon(Color color) =>
      _cairo(16, weight: FontWeight.w800, color: color, height: 1);
  static TextStyle get legalTitle => _cairo(15, weight: FontWeight.w800);
  static TextStyle get legalBody =>
      _cairo(14, color: AppColors.tx2, height: 1.9);
  static TextStyle get updated =>
      _cairo(12, weight: FontWeight.w500, color: AppColors.dim);
  static TextStyle get note => _cairo(12, color: AppColors.dim);
  static TextStyle get renewNote =>
      _cairo(11, color: AppColors.dim, height: 1.8);
  static TextStyle get balanceLabel =>
      _cairo(12, weight: FontWeight.w600, color: AppColors.balanceLabel);
  static TextStyle get balanceValue =>
      _cairo(30, weight: FontWeight.w900, color: AppColors.white, height: 1.2);
  static TextStyle get balanceHint =>
      _cairo(12, weight: FontWeight.w500, color: AppColors.balanceHint);
  static TextStyle get saveBadge =>
      _cairo(10, weight: FontWeight.w800, color: AppColors.stickerInk);
  static TextStyle get popularBadge =>
      _cairo(11, weight: FontWeight.w800, color: AppColors.stickerInk);
  static TextStyle planName(Color color) =>
      _cairo(19, weight: FontWeight.w900, color: color);
  static TextStyle get planTag =>
      _cairo(12, weight: FontWeight.w500, color: AppColors.mu);
  static TextStyle get planPrice =>
      _cairo(22, weight: FontWeight.w900, height: 1.2);
  static TextStyle get planPer =>
      _cairo(11, weight: FontWeight.w500, color: AppColors.mu);
  static TextStyle get feature =>
      _cairo(13, weight: FontWeight.w500, color: AppColors.tx2);
  static TextStyle get featureCheck =>
      _cairo(11, weight: FontWeight.w800, color: AppColors.okInk, height: 1);
  static TextStyle get codeLabel =>
      _cairo(13, weight: FontWeight.w500, color: AppColors.mu);
  static TextStyle get codeValue =>
      _cairo(14, weight: FontWeight.w800, letterSpacing: 1);
  static TextStyle get shareCode =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.priInk);
  static TextStyle get listHeader =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.dim);
  static TextStyle buddyInitial(Color color) =>
      _cairo(18, weight: FontWeight.w800, color: color);
  static TextStyle buddyStatus(Color color) => _cairo(12, color: color);
  static TextStyle get acceptMark =>
      _cairo(16, weight: FontWeight.w800, color: AppColors.checkInk, height: 1);
  static TextStyle get declineMark =>
      _cairo(15, weight: FontWeight.w800, color: AppColors.mu, height: 1);
  static TextStyle get dialogTitle => _cairo(21, weight: FontWeight.w900);
  static TextStyle get dialogBody =>
      _cairo(14, color: AppColors.mu, height: 1.7);
  static TextStyle get cancel => _cairo(15, weight: FontWeight.w700);

  static TextStyle _barlow(
    double size,
    Color color, {
    FontWeight weight = FontWeight.w800,
    double height = 1,
    double? letterSpacing,
  }) => GoogleFonts.barlowCondensed(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
  );

  static TextStyle display(double size, {Color? color}) => _cairo(
    size,
    weight: FontWeight.w900,
    height: 1.15,
    color: color ?? AppColors.white,
    shadows: outline,
  );
  static TextStyle countdown(double size) => _cairo(
    size,
    weight: FontWeight.w900,
    height: 1,
    color: AppColors.white,
    shadows: outline,
    tabular: true,
  );
  static TextStyle points(double size) => _cairo(
    size,
    weight: FontWeight.w900,
    height: 1.1,
    color: AppColors.stickerInk,
  );
  static TextStyle get caption =>
      _cairo(12, weight: FontWeight.w500, color: AppColors.mu, height: 1.6);
  static TextStyle get statusLine =>
      _cairo(13, weight: FontWeight.w600, color: AppColors.tx2);
  static TextStyle get ghostButton => _cairo(14, weight: FontWeight.w700);
  static TextStyle get secondaryButton => _cairo(15, weight: FontWeight.w800);
  static TextStyle get detailLine =>
      _cairo(13, weight: FontWeight.w600, color: AppColors.tx2, height: 1.6);

  static TextStyle hudInitial(Color color) =>
      _cairo(15, weight: FontWeight.w900, color: color);
  static TextStyle get hudName => _cairo(12, weight: FontWeight.w800);
  static TextStyle get hudScore =>
      _cairo(20, weight: FontWeight.w900, height: 1.1, tabular: true);
  static TextStyle hudMode(Color color) =>
      _cairo(11, weight: FontWeight.w800, color: color);
  static TextStyle get scoreDelta =>
      _cairo(13, weight: FontWeight.w900, color: AppColors.stickerInk);
  static TextStyle get ringCount =>
      _cairo(15, weight: FontWeight.w900, tabular: true);
  static TextStyle leadTag(Color color) =>
      _cairo(10, weight: FontWeight.w800, color: color);

  static TextStyle get searchTimer =>
      _cairo(14, weight: FontWeight.w700, color: AppColors.mu, tabular: true);
  static TextStyle get ping =>
      _cairo(11, weight: FontWeight.w700, color: AppColors.okInk);
  static TextStyle get latency =>
      _cairo(11, weight: FontWeight.w600, color: AppColors.mu);
  static TextStyle bigInitial(double size, Color color) =>
      _cairo(size, weight: FontWeight.w900, color: color);
  static TextStyle get vsName =>
      _cairo(18, weight: FontWeight.w900, color: AppColors.white);
  static TextStyle vsTag(Color color) =>
      _cairo(11, weight: FontWeight.w800, color: color);
  static TextStyle get sideName => _cairo(14, weight: FontWeight.w800);
  static TextStyle get readyChip =>
      _cairo(11, weight: FontWeight.w800, color: AppColors.okInk);
  static TextStyle get readyCount =>
      _cairo(13, weight: FontWeight.w700, color: AppColors.mu);

  static TextStyle get introRound =>
      _cairo(13, weight: FontWeight.w800, color: AppColors.mu);
  static TextStyle get introHook =>
      _cairo(17, weight: FontWeight.w700, color: AppColors.tx2, height: 1.5);
  static TextStyle ruleNumber(Color color) =>
      _cairo(13, weight: FontWeight.w900, color: color);
  static TextStyle get ruleText =>
      _cairo(14, weight: FontWeight.w600, height: 1.6);
  static TextStyle modeTag(Color color) =>
      _cairo(11, weight: FontWeight.w800, color: color);
  static TextStyle get stagePill =>
      _cairo(12, weight: FontWeight.w800, color: AppColors.tx2);
  static TextStyle progressChip(Color color) =>
      _cairo(11, weight: FontWeight.w900, color: color);

  static TextStyle resultTitle(Color color) =>
      _cairo(22, weight: FontWeight.w900, color: color);
  static TextStyle resultMark(Color color) =>
      _cairo(28, weight: FontWeight.w900, color: color, height: 1);
  static TextStyle get resultSub =>
      _cairo(13, weight: FontWeight.w500, color: AppColors.mu, height: 1.6);
  static TextStyle get bigScore =>
      _cairo(44, weight: FontWeight.w900, height: 1, tabular: true);
  static TextStyle get finalScore => _cairo(
    56,
    weight: FontWeight.w900,
    height: 1,
    color: AppColors.white,
    shadows: outline,
    tabular: true,
  );
  static TextStyle get finalDash =>
      _cairo(40, weight: FontWeight.w900, color: AppColors.dim);
  static TextStyle summaryWinner(Color color) =>
      _cairo(12, weight: FontWeight.w800, color: color);
  static TextStyle get summaryPoints =>
      _cairo(13, weight: FontWeight.w900, color: AppColors.goldInk);
  static TextStyle get pointsCaption =>
      _cairo(11, weight: FontWeight.w600, color: AppColors.mu);
  static TextStyle get pointsValue =>
      _cairo(18, weight: FontWeight.w900, color: AppColors.goldInk);
  static TextStyle get coinBonus =>
      _cairo(13, weight: FontWeight.w800, color: AppColors.goldInk);
  static TextStyle get cardHeading => _cairo(15, weight: FontWeight.w800);
  static TextStyle get cardCaption =>
      _cairo(12, weight: FontWeight.w600, color: AppColors.mu);

  static TextStyle turnHeading(Color color) =>
      _cairo(17, weight: FontWeight.w900, color: color);
  static TextStyle turnTag(Color color) =>
      _cairo(11, weight: FontWeight.w800, color: color);
  static TextStyle timerValue(Color color) => _cairo(
    22,
    weight: FontWeight.w900,
    color: color,
    height: 1,
    tabular: true,
  );
  static TextStyle get timeoutZero =>
      _cairo(22, weight: FontWeight.w900, color: AppColors.badInk, height: 1);
  static TextStyle get questionText =>
      _cairo(17, weight: FontWeight.w800, height: 1.55);
  static TextStyle get strikeMark =>
      _cairo(15, weight: FontWeight.w900, color: AppColors.white, height: 1);
  static TextStyle get strikesNote =>
      _cairo(11, weight: FontWeight.w700, color: AppColors.mu);
  static TextStyle get boardTitle =>
      _cairo(13, weight: FontWeight.w800, color: AppColors.dim);
  static TextStyle get boardHint =>
      _cairo(13, weight: FontWeight.w500, color: AppColors.dim);
  static TextStyle get boardChip => _cairo(13, weight: FontWeight.w800);
  static TextStyle get struckAnswer => _cairo(
    13,
    weight: FontWeight.w700,
    color: AppColors.dim,
  ).copyWith(decoration: TextDecoration.lineThrough);
  static TextStyle get dupBanner =>
      _cairo(13, weight: FontWeight.w800, color: AppColors.goldInk);
  static TextStyle get exhaustedTitle =>
      _cairo(15, weight: FontWeight.w900, color: AppColors.goldInk);
  static TextStyle feedbackTitle(Color color, double size) =>
      _cairo(size, weight: FontWeight.w900, color: color, height: 1.3);
  static TextStyle feedbackSub(Color color) =>
      _cairo(13, weight: FontWeight.w700, color: color, height: 1.6);
  static TextStyle feedbackNote(Color color) =>
      _cairo(13, weight: FontWeight.w700, color: color, height: 1.6);
  static TextStyle feedbackMark(Color color) =>
      _cairo(20, weight: FontWeight.w900, color: color, height: 1);
  static TextStyle passChip(Color color, {bool struck = false}) => _cairo(
    12,
    weight: FontWeight.w900,
    color: color,
  ).copyWith(decoration: struck ? TextDecoration.lineThrough : null);
  static TextStyle passWord(Color color, {bool struck = false}) => _cairo(
    16,
    weight: FontWeight.w900,
    color: color,
  ).copyWith(decoration: struck ? TextDecoration.lineThrough : null);
  static TextStyle passHint(Color color) =>
      _cairo(11, weight: FontWeight.w700, color: color);
  static TextStyle get passHintMuted =>
      _cairo(11, weight: FontWeight.w600, color: AppColors.dim);
  static TextStyle get lockNote =>
      _cairo(12, weight: FontWeight.w600, color: AppColors.mu);
  static TextStyle get lastCall =>
      _cairo(13, weight: FontWeight.w800, color: AppColors.badInk);
  static TextStyle get bothHint =>
      _cairo(12, weight: FontWeight.w600, color: AppColors.mu);
  static TextStyle get waitLabel =>
      _cairo(14, weight: FontWeight.w700, color: AppColors.opInk);
  static TextStyle get noPoints =>
      _cairo(14, weight: FontWeight.w800, color: AppColors.mu);
  static TextStyle get newQuestion =>
      _cairo(12, weight: FontWeight.w800, color: AppColors.meInk);

  static TextStyle get buzzerQuestion =>
      _cairo(19, weight: FontWeight.w800, height: 1.55);
  static TextStyle bellLabel(Color color) =>
      _cairo(13, weight: FontWeight.w800, color: color);
  static TextStyle bellStatus(Color color) =>
      _cairo(15, weight: FontWeight.w700, color: color, height: 1.6);
  static TextStyle get goBadge =>
      _cairo(12, weight: FontWeight.w900, color: AppColors.stickerInk);
  static TextStyle get knockout =>
      _cairo(13, weight: FontWeight.w800, color: AppColors.badInk);
  static TextStyle get wrongGuess => _cairo(
    13,
    weight: FontWeight.w700,
    color: AppColors.badInk,
  ).copyWith(decoration: TextDecoration.lineThrough);

  static TextStyle get comebackTitle => _cairo(15, weight: FontWeight.w900);
  static TextStyle get clubName => _cairo(14, weight: FontWeight.w800);
  static TextStyle get clubYear =>
      _cairo(11, weight: FontWeight.w600, color: AppColors.mu, tabular: true);
  static TextStyle get clubAbbr =>
      _cairo(13, weight: FontWeight.w900, color: AppColors.white);
  static TextStyle get hiddenClub =>
      _cairo(13, weight: FontWeight.w600, color: AppColors.dim);
  static TextStyle get hiddenMark =>
      _cairo(15, weight: FontWeight.w900, color: AppColors.dim);

  static TextStyle get budgetLabel =>
      _cairo(10, weight: FontWeight.w700, color: AppColors.mu);
  static TextStyle get budgetValue => _cairo(
    16,
    weight: FontWeight.w900,
    color: AppColors.goldInk,
    tabular: true,
  );
  static TextStyle get budgetBig =>
      _cairo(20, weight: FontWeight.w900, color: AppColors.goldInk);
  static TextStyle get formation =>
      _cairo(13, weight: FontWeight.w600, color: AppColors.mu, height: 1.5);
  static TextStyle clueNumber(Color color) =>
      _cairo(12, weight: FontWeight.w800, color: color);
  static TextStyle clueText(Color color) =>
      _cairo(14, weight: FontWeight.w700, color: color, height: 1.5);
  static TextStyle get bidPrice => _cairo(
    34,
    weight: FontWeight.w900,
    color: AppColors.goldInk,
    height: 1.1,
    tabular: true,
  );
  static TextStyle holderName(Color color) =>
      _cairo(15, weight: FontWeight.w800, color: color);
  static TextStyle bidAction(Color color) =>
      _cairo(20, weight: FontWeight.w900, color: color);
  static TextStyle get bidHint =>
      _cairo(12, weight: FontWeight.w500, color: AppColors.mu, height: 1.6);
  static TextStyle get bidWaiting =>
      _cairo(13, weight: FontWeight.w700, color: AppColors.tx2);
  static TextStyle revealTag(Color color) =>
      _cairo(13, weight: FontWeight.w900, color: color);
  static TextStyle get revealMessage =>
      _cairo(15, weight: FontWeight.w800, color: AppColors.white, height: 1.6);
  static TextStyle get revealName =>
      _cairo(14, weight: FontWeight.w800, color: AppColors.white);
  static TextStyle pitchName(Color color) =>
      _cairo(16, weight: FontWeight.w900, color: color, height: 1.3);
  static TextStyle get pitchSub =>
      _cairo(11, weight: FontWeight.w600, color: AppColors.mu, height: 1.3);
  static TextStyle get coachCaption =>
      _cairo(9.5, weight: FontWeight.w600, color: AppColors.mu, height: 1.2);
  static TextStyle get coachName =>
      _cairo(12, weight: FontWeight.w800, height: 1.2);
  static TextStyle get slotLabel =>
      _cairo(10, weight: FontWeight.w700, color: AppColors.dim);
  static TextStyle get slotEmpty =>
      _cairo(10, weight: FontWeight.w600, color: AppColors.dim);
  static TextStyle get tokenName =>
      _cairo(11, weight: FontWeight.w800, height: 1.3);
  static TextStyle tokenPrice(Color color) =>
      _cairo(9.5, weight: FontWeight.w700, color: color);
  static TextStyle get aiMatchTag =>
      _cairo(11, weight: FontWeight.w800, color: AppColors.white);
  static TextStyle get simMinute =>
      _cairo(15, weight: FontWeight.w900, color: AppColors.neon);
  static TextStyle get simTeam =>
      _cairo(14, weight: FontWeight.w800, color: AppColors.white);
  static TextStyle get simAverage =>
      _cairo(11, weight: FontWeight.w600, color: AppColors.paleBlue);
  static TextStyle get simScore => _cairo(
    52,
    weight: FontWeight.w900,
    height: 1,
    color: AppColors.white,
    letterSpacing: -1,
    shadows: const [Shadow(color: AppColors.logoDeep, offset: Offset(0, 4))],
  );
  static TextStyle get simColon =>
      _cairo(52, weight: FontWeight.w900, height: 1, color: AppColors.paleBlue);
  static TextStyle get penaltiesLine =>
      _cairo(13, weight: FontWeight.w800, color: AppColors.compareBad);
  static TextStyle get powerLabel =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.mu);
  static TextStyle powerValue(Color color) =>
      _cairo(14, weight: FontWeight.w900, color: color);
  static TextStyle get eventMinute => _cairo(12, weight: FontWeight.w800);
  static TextStyle eventText(bool goal) =>
      _cairo(13, weight: goal ? FontWeight.w800 : FontWeight.w500, height: 1.5);
  static TextStyle get goalBadge =>
      _cairo(11, weight: FontWeight.w900, color: AppColors.stickerInk);
  static TextStyle get fullTime =>
      _cairo(15, weight: FontWeight.w900, color: AppColors.neon);
  static TextStyle fullTimeWinner(Color color) =>
      _cairo(22, weight: FontWeight.w900, color: color);
  static TextStyle get fullTimePoints =>
      _cairo(20, weight: FontWeight.w900, color: AppColors.stickerInk);

  static TextStyle futRating(Color color) =>
      _barlow(54, color, height: .9, letterSpacing: -1);
  static TextStyle futPosition(Color color) =>
      _barlow(24, color, weight: FontWeight.w700, letterSpacing: .5);
  static TextStyle futName(Color color) =>
      _barlow(33, color, letterSpacing: .5);
  static TextStyle futStatValue(Color color) => _barlow(23, color);
  static TextStyle futStatLabel(Color color) =>
      _barlow(20, color, weight: FontWeight.w600, letterSpacing: .4);
  static TextStyle futInitial(Color color) =>
      _barlow(110, color, weight: FontWeight.w900);
  static TextStyle miniRating(Color color) =>
      _barlow(14, color, weight: FontWeight.w900);
  static TextStyle miniInitial(Color color) =>
      _barlow(22, color, weight: FontWeight.w900);

  static TextStyle get roomCodeChar =>
      _cairo(36, weight: FontWeight.w800, color: AppColors.priInk);
  static TextStyle get roomLink =>
      _cairo(13, weight: FontWeight.w600, color: AppColors.tx2);
  static TextStyle get roomCopy =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.priInk);
  static TextStyle get whatsappButton =>
      _cairo(14, weight: FontWeight.w800, color: AppColors.whatsappInk);
  static TextStyle get roomShare =>
      _cairo(14, weight: FontWeight.w800, color: AppColors.white);

  static TextStyle get gameLayerTitle =>
      _cairo(18, weight: FontWeight.w900, height: 1.3);
  static TextStyle get gameSubtitle =>
      _cairo(12, weight: FontWeight.w600, color: AppColors.mu, height: 1.3);
  static TextStyle get gameHeroTitle =>
      _cairo(20, weight: FontWeight.w900, color: AppColors.white);
  static TextStyle get heroLength => _cairo(
    12,
    weight: FontWeight.w700,
    color: AppColors.tint(AppColors.white, .9),
  );
  static TextStyle get ruleBody =>
      _cairo(14, weight: FontWeight.w500, color: AppColors.tx2, height: 1.75);
  static TextStyle get teamLabel => _cairo(13, weight: FontWeight.w800);
  static TextStyle get removeMark =>
      _cairo(18, weight: FontWeight.w800, color: AppColors.mu, height: 1);
  static TextStyle get chipName =>
      _cairo(12, weight: FontWeight.w800, height: 1.25);
  static TextStyle get chipCaption =>
      _cairo(10, weight: FontWeight.w600, color: AppColors.mu, height: 1.25);
  static TextStyle chipValue(Color color) =>
      _cairo(20, weight: FontWeight.w900, color: color);
  static TextStyle get turnBanner => _cairo(14, weight: FontWeight.w800);
  static TextStyle get turnBannerSub =>
      _cairo(12, weight: FontWeight.w600, color: AppColors.tx2);
  static TextStyle photoTag(Color color) =>
      _cairo(10, weight: FontWeight.w800, color: color, height: 1.4);
  static TextStyle judge(Color color) =>
      _cairo(17, weight: FontWeight.w900, color: color);
  static TextStyle endValue(Color color) =>
      _cairo(32, weight: FontWeight.w900, color: color, height: 1.1);
  static TextStyle get cardNumber => _cairo(
    10,
    weight: FontWeight.w900,
    color: AppColors.paleBlue,
    letterSpacing: 1,
  );
  static TextStyle get actCardName =>
      _cairo(8.5, weight: FontWeight.w800, color: AppColors.tx, height: 1.25);
  static TextStyle get cardResult =>
      _cairo(9, weight: FontWeight.w900, color: AppColors.white, height: 1);
  static TextStyle get peekNote =>
      _cairo(15, weight: FontWeight.w800, color: AppColors.tx2, height: 1.7);
  static TextStyle get levelTag =>
      _cairo(12, weight: FontWeight.w900, color: AppColors.levelInk);
  static TextStyle get secretName =>
      _cairo(22, weight: FontWeight.w900, height: 1.3);
  static TextStyle get secretCaption => _cairo(
    11,
    weight: FontWeight.w700,
    color: AppColors.m4,
    letterSpacing: .5,
  );
  static TextStyle actTimer(Color color) =>
      _cairo(56, weight: FontWeight.w900, color: color, height: 1);
  static TextStyle ladderStep(Color color) =>
      _cairo(14, weight: FontWeight.w900, color: color);
  static TextStyle get questionFor =>
      _cairo(13, weight: FontWeight.w800, color: AppColors.white);
  static TextStyle get bankQuestion =>
      _cairo(21, weight: FontWeight.w800, color: AppColors.white, height: 1.6);
  static TextStyle get bankAnswer =>
      _cairo(16, weight: FontWeight.w800, color: AppColors.answerReveal);
  static TextStyle get cardTitleBig =>
      _cairo(24, weight: FontWeight.w900, height: 1.4);
  static TextStyle spyMark(double size) => _cairo(
    size,
    weight: FontWeight.w900,
    color: AppColors.spyRed,
    height: 1.2,
  );
  static TextStyle get spyHint => _cairo(
    13,
    weight: FontWeight.w600,
    color: AppColors.spyPale,
    height: 1.7,
  );
  static TextStyle get wordChip => _cairo(12, weight: FontWeight.w700);
  static TextStyle get shopBalanceLabel =>
      _cairo(13, weight: FontWeight.w600, color: AppColors.shopLabel);
  static TextStyle get shopBalanceValue => _cairo(
    34,
    weight: FontWeight.w900,
    color: AppColors.shopCoins,
    height: 1.1,
  );
  static TextStyle get shopBalanceUnit =>
      _cairo(14, weight: FontWeight.w700, color: AppColors.white);
  static TextStyle packTag(Color color) =>
      _cairo(10, weight: FontWeight.w800, color: color, height: 1.8);
  static TextStyle get packAmount =>
      _cairo(22, weight: FontWeight.w900, height: 1.2);
  static TextStyle get packBonus =>
      _cairo(11, weight: FontWeight.w800, color: AppColors.okInk);
  static TextStyle get shopTip =>
      _cairo(12, weight: FontWeight.w600, color: AppColors.tx2, height: 1.7);
  static TextStyle get shopTipValue => _cairo(
    12,
    weight: FontWeight.w700,
    color: AppColors.goldInk,
    height: 1.7,
  );
  static TextStyle get shopNotice =>
      _cairo(11, color: AppColors.dim, height: 1.7);
  static TextStyle get readAll =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.priInk);
  static TextStyle get notificationsMuted => _cairo(
    12,
    weight: FontWeight.w600,
    color: AppColors.goldInk,
    height: 1.7,
  );
  static TextStyle get notificationsGroup =>
      _cairo(12, weight: FontWeight.w700, color: AppColors.dim);
  static TextStyle notificationGlyph(Color color) =>
      _cairo(14, weight: FontWeight.w900, color: color);
  static TextStyle get notificationTitle =>
      _cairo(14, weight: FontWeight.w700, height: 1.5);
  static TextStyle get notificationTime =>
      _cairo(11, weight: FontWeight.w500, color: AppColors.dim);
  static TextStyle get notificationBody =>
      _cairo(13, color: AppColors.tx2, height: 1.7);
  static TextStyle get notificationPoints =>
      _cairo(13, weight: FontWeight.w900, color: AppColors.stickerInk);
  static TextStyle get emptyTitle => _cairo(15, weight: FontWeight.w700);
  static TextStyle get emptyHint => _cairo(13, color: AppColors.mu);
}
