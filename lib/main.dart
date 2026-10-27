import 'package:fii90/core/startup/app_preloader.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/splash/presentation/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  await AppPreloader.load();
  runApp(const Fii90App());
}

class Fii90App extends StatelessWidget {
  const Fii90App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'في 90',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.pri,
          secondary: AppColors.cy,
          surface: AppColors.s1,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
