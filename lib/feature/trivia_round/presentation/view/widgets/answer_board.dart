import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class AnswerBoard extends StatelessWidget {
  const AnswerBoard({
    super.key,
    required this.title,
    required this.emptyHint,
    required this.answers,
    this.overlay,
  });

  final String title;
  final String emptyHint;
  final List<({String name, Color dot})> answers;
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    final layer = overlay;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(title, style: AppText.boardTitle),
                const SizedBox(height: 10),
                if (answers.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    child: Text(
                      emptyHint,
                      textAlign: TextAlign.center,
                      style: AppText.boardHint,
                    ),
                  ),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final a in answers)
                      Enter(
                        fx: Fx.pop,
                        duration: const Duration(milliseconds: 350),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.s1,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.line),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: a.dot,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              const SizedBox(width: 7),
                              Text(a.name, style: AppText.boardChip),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (layer != null) Positioned.fill(child: layer),
        ],
      ),
    );
  }
}
