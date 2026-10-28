import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class SlideLayout extends StatelessWidget {
  const SlideLayout({
    super.key,
    required this.illustration,
    required this.title,
    required this.body,
  });

  final Widget illustration;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(width: 346, height: 340, child: illustration),
          ),
        ),
        const SizedBox(height: 26),
        Enter(
          fx: Fx.fadeUp,
          delay: const Duration(milliseconds: 150),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppText.slideTitle,
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Text(
                  body,
                  textAlign: TextAlign.center,
                  style: AppText.slideBody,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
