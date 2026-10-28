import 'package:flutter/material.dart';

abstract final class AppLocalization {
  static const path = 'assets/translations';
  static const arabic = Locale('ar');
  static const english = Locale('en');
  static const supported = [arabic, english];
}
