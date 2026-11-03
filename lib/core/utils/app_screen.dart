import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppScreen {
  // The size the UI was tuned on: every .w/.h/.r/.sp is 1:1 here.
  static const designSize = Size(360, 640);

  // AppText styles are read during preloading, before ScreenUtilInit builds.
  static Future<void> init() async {
    await ScreenUtil.ensureScreenSize();
    ScreenUtil.configure(
      data: MediaQueryData.fromView(PlatformDispatcher.instance.implicitView!),
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}
