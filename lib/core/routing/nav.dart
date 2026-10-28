import 'package:flutter/material.dart';

abstract final class Nav {
  static Future<void> replace(BuildContext context, Widget page) {
    return Navigator.of(context).pushReplacement(_fade(page));
  }

  static Future<void> push(BuildContext context, Widget page) {
    return Navigator.of(context).push(_fade(page));
  }

  static Future<void> popAndPush(BuildContext context, Widget page) {
    final navigator = Navigator.of(context)..pop();
    return navigator.push(_fade(page));
  }

  static Future<void> resetTo(BuildContext context, Widget page) {
    return Navigator.of(
      context,
      rootNavigator: true,
    ).pushAndRemoveUntil(_fade(page), (_) => false);
  }

  static PageRouteBuilder<void> _fade(Widget page) => PageRouteBuilder<void>(
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
