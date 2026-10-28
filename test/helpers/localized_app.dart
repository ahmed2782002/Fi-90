import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_localization.dart';
import 'package:fii90/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> pumpLocalized(WidgetTester tester, Widget home) async {
  SharedPreferences.setMockInitialValues({});
  EasyLocalization.logger.enableBuildModes = [];
  await tester.runAsync(EasyLocalization.ensureInitialized);
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    EasyLocalization(
      supportedLocales: AppLocalization.supported,
      path: AppLocalization.path,
      startLocale: AppLocalization.arabic,
      fallbackLocale: AppLocalization.arabic,
      child: BlocProvider(
        create: (_) => ThemeCubit(true),
        child: Builder(
          builder: (context) => MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            home: home,
          ),
        ),
      ),
    ),
  );
  await settleAsync(tester);
}

Future<void> settleAsync(WidgetTester tester) async {
  for (var i = 0; i < 5; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 50)),
    );
    await tester.pump(const Duration(milliseconds: 300));
  }
}
