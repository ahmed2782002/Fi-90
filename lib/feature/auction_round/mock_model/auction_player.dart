import 'package:fii90/core/localization/localized_text.dart';
import 'package:fii90/core/theme/app_colors.dart';

enum PlayerRole { gk, df, mf, fw, co }

class AuctionPlayer {
  const AuctionPlayer({
    required this.name,
    required this.short,
    required this.card,
    required this.role,
    required this.rating,
    required this.stats,
    this.label,
    this.legend = false,
  });

  final LocalizedText name;
  final LocalizedText short;
  final String card;
  final PlayerRole role;
  final int rating;
  final List<int> stats;
  final String? label;
  final bool legend;

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

  List<String> get statLabels => switch (role) {
    PlayerRole.gk => const ['DIV', 'HAN', 'KIC', 'REF', 'SPD', 'POS'],
    PlayerRole.co => const ['TAC', 'ATT', 'DEF', 'MOT', 'EXP', 'MAN'],
    _ => const ['PAC', 'SHO', 'PAS', 'DRI', 'DEF', 'PHY'],
  };

  static const all = {
    'navas': AuctionPlayer(
      name: LocalizedText('كيلور نافاس', 'Keylor Navas'),
      short: LocalizedText('نافاس', 'Navas'),
      card: 'NAVAS',
      role: PlayerRole.gk,
      rating: 86,
      stats: [87, 83, 72, 89, 55, 84],
    ),
    'buffon': AuctionPlayer(
      name: LocalizedText('جانلويجي بوفون', 'Gianluigi Buffon'),
      short: LocalizedText('بوفون', 'Buffon'),
      card: 'BUFFON',
      role: PlayerRole.gk,
      rating: 92,
      legend: true,
      stats: [89, 88, 74, 90, 52, 91],
    ),
    'vandijk': AuctionPlayer(
      name: LocalizedText('فيرجيل فان دايك', 'Virgil van Dijk'),
      short: LocalizedText('فان دايك', 'Van Dijk'),
      card: 'VAN DIJK',
      role: PlayerRole.df,
      rating: 90,
      stats: [78, 60, 71, 72, 91, 89],
    ),
    'ramos': AuctionPlayer(
      name: LocalizedText('سيرجيو راموس', 'Sergio Ramos'),
      short: LocalizedText('راموس', 'Ramos'),
      card: 'RAMOS',
      role: PlayerRole.df,
      rating: 91,
      stats: [75, 62, 74, 72, 90, 86],
    ),
    'park': AuctionPlayer(
      name: LocalizedText('بارك جي سونغ', 'Park Ji-sung'),
      short: LocalizedText('بارك', 'Park'),
      card: 'PARK',
      role: PlayerRole.mf,
      rating: 80,
      legend: true,
      stats: [83, 70, 76, 79, 72, 80],
    ),
    'modric': AuctionPlayer(
      name: LocalizedText('لوكا مودريتش', 'Luka Modrić'),
      short: LocalizedText('مودريتش', 'Modrić'),
      card: 'MODRIĆ',
      role: PlayerRole.mf,
      rating: 91,
      stats: [74, 76, 90, 90, 72, 66],
    ),
    'aboutrika': AuctionPlayer(
      name: LocalizedText('محمد أبوتريكة', 'Mohamed Aboutrika'),
      short: LocalizedText('أبوتريكة', 'Aboutrika'),
      card: 'ABOUTRIKA',
      role: PlayerRole.mf,
      rating: 88,
      legend: true,
      stats: [78, 85, 88, 89, 48, 70],
    ),
    'kante': AuctionPlayer(
      name: LocalizedText('نجولو كانتي', "N'Golo Kanté"),
      short: LocalizedText('كانتي', 'Kanté'),
      card: 'KANTÉ',
      role: PlayerRole.mf,
      rating: 88,
      stats: [77, 66, 75, 82, 87, 82],
    ),
    'salah': AuctionPlayer(
      name: LocalizedText('محمد صلاح', 'Mohamed Salah'),
      short: LocalizedText('صلاح', 'Salah'),
      card: 'SALAH',
      role: PlayerRole.fw,
      rating: 91,
      stats: [91, 87, 81, 90, 45, 75],
    ),
    'nunez': AuctionPlayer(
      name: LocalizedText('داروين نونيز', 'Darwin Núñez'),
      short: LocalizedText('نونيز', 'Núñez'),
      card: 'NÚÑEZ',
      role: PlayerRole.fw,
      rating: 78,
      stats: [89, 79, 66, 75, 40, 84],
    ),
    'hakimi': AuctionPlayer(
      name: LocalizedText('أشرف حكيمي', 'Achraf Hakimi'),
      short: LocalizedText('حكيمي', 'Hakimi'),
      card: 'HAKIMI',
      role: PlayerRole.df,
      label: 'RB',
      rating: 86,
      stats: [92, 75, 80, 82, 78, 77],
    ),
    'cafu': AuctionPlayer(
      name: LocalizedText('كافو', 'Cafu'),
      short: LocalizedText('كافو', 'Cafu'),
      card: 'CAFU',
      role: PlayerRole.df,
      label: 'RB',
      rating: 90,
      legend: true,
      stats: [89, 68, 80, 81, 86, 84],
    ),
    'maldini': AuctionPlayer(
      name: LocalizedText('باولو مالديني', 'Paolo Maldini'),
      short: LocalizedText('مالديني', 'Maldini'),
      card: 'MALDINI',
      role: PlayerRole.df,
      rating: 94,
      legend: true,
      stats: [83, 58, 76, 74, 95, 85],
    ),
    'puyol': AuctionPlayer(
      name: LocalizedText('كارليس بويول', 'Carles Puyol'),
      short: LocalizedText('بويول', 'Puyol'),
      card: 'PUYOL',
      role: PlayerRole.df,
      rating: 89,
      legend: true,
      stats: [78, 50, 66, 64, 91, 88],
    ),
    'robertson': AuctionPlayer(
      name: LocalizedText('آندي روبرتسون', 'Andy Robertson'),
      short: LocalizedText('روبرتسون', 'Robertson'),
      card: 'ROBERTSON',
      role: PlayerRole.df,
      label: 'LB',
      rating: 85,
      stats: [84, 62, 82, 77, 80, 76],
    ),
    'marcelo': AuctionPlayer(
      name: LocalizedText('مارسيلو', 'Marcelo'),
      short: LocalizedText('مارسيلو', 'Marcelo'),
      card: 'MARCELO',
      role: PlayerRole.df,
      label: 'LB',
      rating: 87,
      stats: [82, 72, 84, 88, 77, 78],
    ),
    'iniesta': AuctionPlayer(
      name: LocalizedText('أندريس إنييستا', 'Andrés Iniesta'),
      short: LocalizedText('إنييستا', 'Iniesta'),
      card: 'INIESTA',
      role: PlayerRole.mf,
      rating: 91,
      legend: true,
      stats: [76, 74, 91, 93, 64, 63],
    ),
    'debruyne': AuctionPlayer(
      name: LocalizedText('كيفن دي بروين', 'Kevin De Bruyne'),
      short: LocalizedText('دي بروين', 'De Bruyne'),
      card: 'DE BRUYNE',
      role: PlayerRole.mf,
      rating: 91,
      stats: [74, 88, 94, 87, 64, 78],
    ),
    'benzema': AuctionPlayer(
      name: LocalizedText('كريم بنزيما', 'Karim Benzema'),
      short: LocalizedText('بنزيما', 'Benzema'),
      card: 'BENZEMA',
      role: PlayerRole.fw,
      rating: 90,
      stats: [78, 90, 83, 87, 39, 78],
    ),
    'drogba': AuctionPlayer(
      name: LocalizedText('ديدييه دروجبا', 'Didier Drogba'),
      short: LocalizedText('دروجبا', 'Drogba'),
      card: 'DROGBA',
      role: PlayerRole.fw,
      rating: 88,
      legend: true,
      stats: [84, 88, 72, 80, 40, 90],
    ),
    'mahrez': AuctionPlayer(
      name: LocalizedText('رياض محرز', 'Riyad Mahrez'),
      short: LocalizedText('محرز', 'Mahrez'),
      card: 'MAHREZ',
      role: PlayerRole.fw,
      label: 'RW',
      rating: 85,
      stats: [83, 80, 82, 90, 38, 62],
    ),
    'henry': AuctionPlayer(
      name: LocalizedText('تييري هنري', 'Thierry Henry'),
      short: LocalizedText('هنري', 'Henry'),
      card: 'HENRY',
      role: PlayerRole.fw,
      rating: 93,
      legend: true,
      stats: [94, 91, 83, 91, 45, 80],
    ),
    'guardiola': AuctionPlayer(
      name: LocalizedText('بيب جوارديولا', 'Pep Guardiola'),
      short: LocalizedText('جوارديولا', 'Guardiola'),
      card: 'GUARDIOLA',
      role: PlayerRole.co,
      rating: 93,
      stats: [96, 93, 85, 90, 92, 91],
    ),
    'mourinho': AuctionPlayer(
      name: LocalizedText('جوزيه مورينيو', 'José Mourinho'),
      short: LocalizedText('مورينيو', 'Mourinho'),
      card: 'MOURINHO',
      role: PlayerRole.co,
      rating: 87,
      stats: [90, 78, 93, 92, 95, 84],
    ),
  };
}
