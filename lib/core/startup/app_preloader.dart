import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_icons.dart';
import '../constants/app_images.dart';
import '../theme/app_text.dart';
import '../widgets/app_background/tiled_svg.dart';

abstract final class AppPreloader {
  static const _timeout = Duration(seconds: 4);

  static Future<void> load() async {
    await Future.wait(
      [
        _fonts(),
        TiledSvg.precache(AppImages.patternTile),
        TiledSvg.precache(AppImages.starsTile),
        _svg(AppIcons.ball),
        _image(AppImages.brandFi),
      ].map((task) => task.timeout(_timeout).catchError((_) => null)),
    );
  }

  static Future<void> _fonts() {
    AppText.logoNine;
    AppText.splashBrand;
    AppText.splashTagline;
    AppText.slideTitle;
    AppText.slideBody;
    AppText.button;
    return GoogleFonts.pendingFonts();
  }

  static Future<void> _svg(String asset) {
    final loader = SvgAssetLoader(asset);
    return svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }

  static Future<void> _image(String asset) {
    final done = Completer<void>();
    final stream = AssetImage(asset).resolve(ImageConfiguration.empty);
    late final ImageStreamListener listener;
    listener = ImageStreamListener(
      (_, _) {
        stream.removeListener(listener);
        if (!done.isCompleted) done.complete();
      },
      onError: (_, _) {
        stream.removeListener(listener);
        if (!done.isCompleted) done.complete();
      },
    );
    stream.addListener(listener);
    return done.future;
  }
}
