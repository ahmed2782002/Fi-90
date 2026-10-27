import 'package:flutter/material.dart';

abstract final class AppColors {
  static const bg = Color(0xFF081536);
  static const bg2 = Color(0xFF0E2160);
  static const s1 = Color(0xFF0F2256);
  static const s2 = Color(0xFF16307A);
  static const s3 = Color(0xFF1D3A8C);
  static const line = Color(0x2E8FCBFF);
  static const line2 = Color(0x663FD4FF);

  static const tx = Color(0xFFFFFFFF);
  static const tx2 = Color(0xFFA9BDE6);
  static const mu = Color(0xFFA9BDE6);
  static const dim = Color(0xFF7B90C2);

  static const pri = Color(0xFF1A1AD6);
  static const priD = Color(0xFF1414A0);
  static const priInk = Color(0xFF8FCBFF);
  static const cy = Color(0xFF3FD4FF);

  static const gold = Color(0xFFFFB400);
  static const goldInk = Color(0xFFFFC640);
  static const me = Color(0xFF3FD4FF);
  static const meOn = Color(0xFF04202B);
  static const op = Color(0xFFA98BFF);
  static const opInk = Color(0xFFC4B2FF);
  static const opOn = Color(0xFF170C3D);
  static const m3 = Color(0xFFE3262B);
  static const m3Ink = Color(0xFFFF6B6F);
  static const m4 = Color(0xFF8FCBFF);
  static const m4Ink = Color(0xFFB5DDFF);
  static const ok = Color(0xFF2EE59D);
  static const okInk = Color(0xFF6FF0BE);
  static const bad = Color(0xFFE3262B);

  static const stk = Color(0xFF1A1AD6);
  static const stk2 = Color(0xFF0B0B7A);

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

  static const grad = LinearGradient(
    begin: Alignment(-0.34, -0.94),
    end: Alignment(0.34, 0.94),
    colors: [gradStart, priD],
  );

  static Color tint(Color c, double p) => c.withValues(alpha: c.a * p);

  static Color mix(Color c, double p, Color base) => Color.lerp(base, c, p)!;
}
