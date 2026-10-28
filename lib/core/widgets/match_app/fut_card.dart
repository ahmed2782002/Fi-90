import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text.dart';
import 'fut_card_clipper.dart';

class FutCard extends StatelessWidget {
  const FutCard({
    super.key,
    required this.palette,
    required this.rating,
    required this.position,
    required this.name,
    required this.initial,
    required this.statLabels,
    required this.statValues,
  });

  final FutPalette palette;
  final String rating;
  final String position;
  final String name;
  final String initial;
  final List<String> statLabels;
  final List<String> statValues;

  @override
  Widget build(BuildContext context) {
    final ink = palette.ink;
    return SizedBox(
      width: 252,
      height: 373,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: const FutCardClipper(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: palette.frame,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: const FutCardClipper(inset: 3.5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: palette.background,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 92,
                      top: 40,
                      width: 156,
                      height: 186,
                      child: Center(
                        child: Text(
                          initial,
                          style: AppText.futInitial(AppColors.tint(ink, .35)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 17,
                      top: 42,
                      width: 67,
                      child: Column(
                        children: [
                          Text(rating, style: AppText.futRating(ink)),
                          const SizedBox(height: 4),
                          Text(position, style: AppText.futPosition(ink)),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 14,
                      right: 14,
                      top: 229,
                      height: 35,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          name,
                          maxLines: 1,
                          style: AppText.futName(ink),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      right: 18,
                      top: 268,
                      height: 1.5,
                      child: ColoredBox(color: AppColors.tint(ink, .45)),
                    ),
                    Positioned(
                      left: 28,
                      right: 28,
                      top: 277,
                      child: Row(
                        children: [
                          for (final half in [0, 3])
                            Expanded(
                              child: Column(
                                children: [
                                  for (var i = half; i < half + 3; i++)
                                    SizedBox(
                                      height: 23,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            child: Text(
                                              statValues[i],
                                              textAlign: TextAlign.right,
                                              style: AppText.futStatValue(ink),
                                            ),
                                          ),
                                          const SizedBox(width: 7),
                                          SizedBox(
                                            width: 41,
                                            child: Text(
                                              statLabels[i],
                                              style: AppText.futStatLabel(ink),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 125.3,
                      top: 279,
                      width: 1.5,
                      height: 64,
                      child: ColoredBox(color: AppColors.tint(ink, .45)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
