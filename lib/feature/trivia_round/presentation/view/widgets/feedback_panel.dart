import 'dart:math' as math;

import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/spin_ring.dart';
import 'package:flutter/material.dart';

class FeedbackPanel extends StatelessWidget {
  const FeedbackPanel({
    super.key,
    required this.background,
    required this.lines,
    this.badge,
    this.badgeColor,
    this.badgeInk,
    this.shake = false,
    this.spinner = false,
  });

  final Color background;
  final List<({String text, TextStyle style})> lines;
  final String? badge;
  final Color? badgeColor;
  final Color? badgeInk;
  final bool shake;
  final bool spinner;

  @override
  Widget build(BuildContext context) {
    final mark = badge;
    final body = Container(
      color: background,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (spinner) const SpinRing(size: 42, color: AppColors.pri),
          if (mark != null)
            Enter(
              fx: Fx.pop,
              duration: const Duration(milliseconds: 450),
              child: Container(
                width: 62,
                height: 62,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  mark,
                  style: AppText.feedbackMark(badgeInk ?? AppColors.white),
                ),
              ),
            ),
          for (final line in lines) ...[
            const SizedBox(height: 8),
            Text(line.text, textAlign: TextAlign.center, style: line.style),
          ],
        ],
      ),
    );
    if (!shake) return body;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 450),
      builder: (context, t, child) => Transform.translate(
        offset: Offset(8 * math.sin(t * math.pi * 4) * (1 - t), 0),
        child: child,
      ),
      child: body,
    );
  }
}
