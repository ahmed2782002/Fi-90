import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/startup/app_preloader.dart';
import 'package:fii90/core/theme/app_theme.dart';
import 'package:fii90/core/theme/theme_cubit.dart';
import 'package:fii90/core/utils/app_screen.dart';
import 'package:fii90/feature/coins_shop/presentation/view_model/coins_cubit.dart';
import 'package:fii90/feature/splash/presentation/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final themeCubit = ThemeCubit(await ThemeCubit.loadDark());
  SystemChrome.setSystemUIOverlayStyle(AppTheme.overlay);
  await AppScreen.init();
  await AppPreloader.load();
  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supported,
      path: AppLocalization.path,
      startLocale: AppLocalization.arabic,
      fallbackLocale: AppLocalization.arabic,
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: themeCubit),
          // App-wide so match screens (pushed on the root navigator) can
          // credit their coin rewards to the same balance home shows.
          BlocProvider(create: (_) => CoinsCubit()),
        ],
        child: const Fii90App(),
      ),
    ),
  );
}

class Fii90App extends StatelessWidget {
  const Fii90App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, bool>(
      listener: (_, _) => AppTheme.refresh(),
      builder: (context, _) => ScreenUtilInit(
        designSize: AppScreen.designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) => MaterialApp(
          onGenerateTitle: (context) => context.tr(AppStrings.appName),
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          builder: (context, child) =>
              KeyedSubtree(key: ValueKey(context.locale), child: child!),
          theme: AppTheme.data,
          // fix ui --> fix RenderFlex
          // add md files agent
          // create network class in core
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
