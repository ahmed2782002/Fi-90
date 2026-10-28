import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get data => ThemeData(
    brightness: AppColors.isDark ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: AppColors.isDark
        ? ColorScheme.dark(
            primary: AppColors.pri,
            secondary: AppColors.cy,
            surface: AppColors.s1,
          )
        : ColorScheme.light(
            primary: AppColors.pri,
            secondary: AppColors.cy,
            surface: AppColors.s1,
          ),
  );

  static SystemUiOverlayStyle get overlay =>
      AppColors.isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

  static void refresh() {
    SystemChrome.setSystemUIOverlayStyle(overlay);
    void mark(Element element) {
      element.markNeedsBuild();
      element.visitChildren(mark);
    }

    WidgetsBinding.instance.rootElement?.visitChildren(mark);
  }
}
