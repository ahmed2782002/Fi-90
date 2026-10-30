import 'package:flutter/material.dart';

typedef PlayerPalette = ({Color fill, Color on, Color ink});

typedef FutPalette = ({List<Color> background, List<Color> frame, Color ink});

abstract final class AppColors {
  static bool _dark = true;

  static bool get isDark => _dark;

  static void use({required bool dark}) => _dark = dark;

  static Color _pick(int dark, int light) => Color(_dark ? dark : light);

  static Color get bg => _pick(0xFF081536, 0xFFF3F6FF);
  static Color get bg2 => _pick(0xFF0E2160, 0xFFE4ECFF);
  static Color get s1 => _pick(0xFF0F2256, 0xFFFFFFFF);
  static Color get s2 => _pick(0xFF16307A, 0xFFE4ECFF);
  static Color get s3 => _pick(0xFF1D3A8C, 0xFFD2DFFF);
  static Color get line => _pick(0x2E8FCBFF, 0x1A1A1AD6);
  static Color get line2 => _pick(0x663FD4FF, 0x3D1A1AD6);

  static Color get tx => _pick(0xFFFFFFFF, 0xFF0B1A40);
  static Color get tx2 => _pick(0xFFA9BDE6, 0xFF34466E);
  static Color get mu => _pick(0xFFA9BDE6, 0xFF5A6B8C);
  static Color get dim => _pick(0xFF7B90C2, 0xFF8594B6);

  static const pri = Color(0xFF1A1AD6);
  static const priD = Color(0xFF1414A0);
  static Color get priInk => _pick(0xFF8FCBFF, 0xFF1A1AD6);
  static Color get cy => _pick(0xFF3FD4FF, 0xFF009FD9);

  static Color get gold => _pick(0xFFFFB400, 0xFFF5A300);
  static Color get goldInk => _pick(0xFFFFC640, 0xFF8A5A00);
  static Color get me => _pick(0xFF3FD4FF, 0xFF0092D0);
  static Color get meInk => _pick(0xFF7FE3FF, 0xFF006A9A);
  static Color get meOn => _pick(0xFF04202B, 0xFFFFFFFF);
  static Color get op => _pick(0xFFA98BFF, 0xFF6B4EE6);
  static Color get opInk => _pick(0xFFC4B2FF, 0xFF4F33C4);
  static Color get opOn => _pick(0xFF170C3D, 0xFFFFFFFF);
  static Color get m3 => _pick(0xFFE3262B, 0xFFD91F26);
  static Color get m3Ink => _pick(0xFFFF6B6F, 0xFFB3141A);
  static Color get m4 => _pick(0xFF8FCBFF, 0xFF3A7BE0);
  static Color get m4Ink => _pick(0xFFB5DDFF, 0xFF1D55B5);
  static Color get ok => _pick(0xFF2EE59D, 0xFF12B886);
  static Color get okInk => _pick(0xFF6FF0BE, 0xFF07805C);
  static Color get bad => _pick(0xFFE3262B, 0xFFD91F26);
  static Color get badInk => _pick(0xFFFF6B6F, 0xFFB3141A);
  static Color get glass => _pick(0xCC0F2256, 0xD6FFFFFF);
  static Color get scrim => _pick(0xB803091C, 0x6B0B1A40);
  static double get patternOpacity => _dark ? .09 : .16;
  static double get starOpacity => _dark ? .16 : .3;

  static const stk = Color(0xFF1A1AD6);
  static Color get stk2 => _pick(0xFF0B0B7A, 0xFF0F2256);

  static const neon = Color(0xFF3FD4FF);
  static const goldGlow = Color(0xFFFFB400);
  static const redGlow = Color(0xFFE3262B);
  static const m4Glow = Color(0xFF5A8CFF);
  static const playInk = Color(0xFF2A1C7A);
  static const online = Color(0xFF5CFFB5);
  static const coinLight = Color(0xFFFFC93D);
  static const coinDeep = Color(0xFFF5A300);
  static const coinShade = Color(0x59965A00);
  static const leaderGoldInk = Color(0xFF1F1400);
  static const meOnDark = Color(0xFF04202B);
  static const balanceLabel = Color(0xFFA9BDE6);
  static const balanceHint = Color(0xFFCFE0FF);

  static const gradStart = Color(0xFF2A1FD1);
  static const logoHeroHighlight = Color(0xFF5B5CFF);
  static const logoSmallHighlight = Color(0xFF4A4BFF);
  static const logoDeep = Color(0xFF0B0B6E);
  static const logoInk = Color(0xFF05054A);
  static const logoGrid = Color(0xFFCFE6FF);
  static const paleBlue = Color(0xFFCFE0FF);
  static const groundShadow = Color(0xFF000428);
  static const insetShade = Color(0xFF000028);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const googleText = Color(0xFF1F1F1F);
  static const stickerInk = Color(0xFF1A1200);
  static const checkInk = Color(0xFF04140B);
  static const transparent = Color(0x00000000);
  static const goldDeep = Color(0xFFB37E00);
  static const comebackOn = Color(0xFF04201D);
  static const compareGood = Color(0xFF6FF0BE);
  static const compareBad = Color(0xFFFFD966);
  static const whatsapp = Color(0xFF25D366);
  static const levelEasy = Color(0xFF2EE59D);
  static const levelMedium = Color(0xFFFFB400);
  static const levelHard = Color(0xFFFF6B6F);
  static const levelInk = Color(0xFF08122E);
  static const spyRed = Color(0xFFFF5A5F);
  static const spyPale = Color(0xFFFFD6D7);
  static const spyDeep = Color(0xFF0B0F2A);
  static const answerReveal = Color(0xFF7FF0C2);
  static const photoBase = Color(0xFF0B1F4D);
  static const cardDeep = Color(0xFF081536);

  static const spyCard = RadialGradient(
    center: Alignment(0, -.24),
    radius: .9,
    colors: [Color(0xFF5A0A10), Color(0xFF1A0610), Color(0xFF070A1E)],
    stops: [0, .6, 1],
  );

  static PlayerPalette player(int index) => switch (index % 6) {
    0 => (fill: me, on: meOn, ink: meInk),
    1 => (fill: op, on: opOn, ink: opInk),
    2 => (fill: gold, on: stickerInk, ink: goldInk),
    3 => (fill: m3, on: white, ink: m3Ink),
    4 => (fill: ok, on: checkInk, ink: okInk),
    _ => (fill: m4, on: white, ink: m4Ink),
  };

  static Color level(int level) => switch (level) {
    1 => levelEasy,
    2 => levelMedium,
    _ => levelHard,
  };
  static const whatsappInk = Color(0xFF04210F);

  static const tableBase = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF16307A), Color(0xFF081536)],
  );
  static const tableTop = RadialGradient(
    center: Alignment(0, -.3),
    radius: .7,
    colors: [Color(0xFF1D3A8C), Color(0xFF0F2256)],
  );

  static const identityMatrix = <double>[
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ];
  static const dimMatrix = <double>[
    .33,
    .18,
    .04,
    0,
    0,
    .1,
    .4,
    .05,
    0,
    0,
    .1,
    .18,
    .27,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ];

  static const FutPalette futIcon = (
    background: [Color(0xFFFFFDF6), Color(0xFFE8DCBE)],
    frame: [
      Color(0xFFFFF1C2),
      Color(0xFFC2922E),
      Color(0xFFFFF6D6),
      Color(0xFFA97A1E),
    ],
    ink: Color(0xFF4E3508),
  );
  static const FutPalette futElite = (
    background: [Color(0xFF1C2C92), Color(0xFF060A36)],
    frame: [
      Color(0xFFFFF1C2),
      Color(0xFFD4A33A),
      Color(0xFFFFF6D6),
      Color(0xFFB8861E),
    ],
    ink: Color(0xFFFFE7A3),
  );
  static const FutPalette futBurgundy = (
    background: [Color(0xFFA11D37), Color(0xFF460614)],
    frame: [
      Color(0xFFF7D58A),
      Color(0xFFB8862B),
      Color(0xFFF6DC92),
      Color(0xFF8C6418),
    ],
    ink: Color(0xFFFFE3B0),
  );
  static const FutPalette futGold = (
    background: [Color(0xFFEBCB6C), Color(0xFFDDB653), Color(0xFFCFA23D)],
    frame: [Color(0xFFFFF3C4), Color(0xFFB8892A), Color(0xFFFFE9A0)],
    ink: Color(0xFF1E1405),
  );
  static const FutPalette futSilver = (
    background: [Color(0xFFEEF1F6), Color(0xFFAEB7C6), Color(0xFF8E98AA)],
    frame: [Color(0xFFFFFFFF), Color(0xFF8C96A8), Color(0xFFF3F6FF)],
    ink: Color(0xFF121826),
  );
  static const FutPalette futMystery = (
    background: [Color(0xFF1D3A8C), Color(0xFF081536)],
    frame: [
      Color(0xFFAFC0E0),
      Color(0xFF26356A),
      Color(0xFFC9D6F0),
      Color(0xFF1A2448),
    ],
    ink: Color(0xFFFFFFFF),
  );

  static const grad = LinearGradient(
    begin: Alignment(-0.34, -0.94),
    end: Alignment(0.34, 0.94),
    colors: [gradStart, priD],
  );

  static const shopBalance = RadialGradient(
    center: Alignment(.7, -1),
    radius: 1.2,
    colors: [Color(0xFF3B1A6E), Color(0xFF160A3A), Color(0xFF0B0624)],
    stops: [0, .55, 1],
  );
  static const shopLabel = Color(0xFFE9D9FF);
  static const shopCoins = Color(0xFFFFD43F);

  static const photoHero = [
    Color(0xFF5BE0FF),
    Color(0xFF1592E0),
    Color(0xFF0A5BA6),
  ];
  static const actHero = [
    Color(0xFFB9A2FF),
    Color(0xFF7A5CF0),
    Color(0xFF4B2FC4),
  ];
  static const bankHero = [
    Color(0xFFFFE38A),
    Color(0xFFFFB400),
    Color(0xFFD98A00),
  ];
  static const spyHero = [
    Color(0xFFFF8A8D),
    Color(0xFFE3262B),
    Color(0xFF9E1015),
  ];

  static Color tint(Color c, double p) => c.withValues(alpha: c.a * p);

  static Color mix(Color c, double p, Color base) => Color.lerp(base, c, p)!;
}
