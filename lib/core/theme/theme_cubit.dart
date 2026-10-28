import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_colors.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit(super.dark) {
    AppColors.use(dark: state);
  }

  static const _key = 'dark_theme';

  static Future<bool> loadDark() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? true;
  }

  bool get isDark => state;

  int get index => state ? 0 : 1;

  Future<void> select(int index) async {
    final dark = index == 0;
    if (dark == state) return;
    AppColors.use(dark: dark);
    emit(dark);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, dark);
  }
}
