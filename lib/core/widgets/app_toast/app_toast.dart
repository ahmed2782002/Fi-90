import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../animation/enter.dart';
import '../../animation/fx.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_text.dart';
import 'toast_message.dart';

abstract final class AppToast {
  static OverlayEntry? _entry;
  static Timer? _timer;

  static void show(
    BuildContext context,
    ToastMessage message, {
    OverlayState? overlay,
  }) {
    final target = overlay ?? Overlay.of(context, rootOverlay: true);
    final args = message.translateArgs
        ? [for (final arg in message.args) context.tr(arg)]
        : message.args;
    final text = message.translate
        ? context.tr(message.key, args: args)
        : message.key;
    _hide();
    final entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 120,
        left: 0,
        right: 0,
        child: IgnorePointer(
          child: Material(
            type: MaterialType.transparency,
            child: Center(
              child: Enter(
                fx: Fx.fadeUp,
                duration: const Duration(milliseconds: 250),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 330),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: message.kind.background,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: AppShadows.sh2,
                  ),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AppText.toastMessage(message.kind.foreground),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    _entry = entry;
    target.insert(entry);
    _timer = Timer(const Duration(milliseconds: 1800), _hide);
  }

  static void _hide() {
    _timer?.cancel();
    _entry?.remove();
    _entry = null;
  }
}
