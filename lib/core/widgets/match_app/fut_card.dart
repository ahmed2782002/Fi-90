import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      width: 252.r,
      height: 373.r,
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
                      left: 92.w,
                      top: 40.r,
                      width: 156.r,
                      height: 186.r,
                      child: Center(
                        child: Text(
                          initial,
                          style: AppText.futInitial(AppColors.tint(ink, .35)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 17.w,
                      top: 42.r,
                      width: 67.r,
                      child: Column(
                        children: [
                          Text(rating, style: AppText.futRating(ink)),
                          SizedBox(height: 4.h),
                          Text(position, style: AppText.futPosition(ink)),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 14.w,
                      right: 14.w,
                      top: 229.r,
                      height: 35.r,
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
                      left: 18.w,
                      right: 18.w,
                      top: 268.r,
                      height: 1.5.r,
                      child: ColoredBox(color: AppColors.tint(ink, .45)),
                    ),
                    Positioned(
                      left: 28.w,
                      right: 28.w,
                      top: 277.r,
                      child: Row(
                        children: [
                          for (final half in [0, 3])
                            Expanded(
                              child: Column(
                                children: [
                                  for (var i = half; i < half + 3; i++)
                                    SizedBox(
                                      height: 23.r,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          SizedBox(
                                            width: 30.r,
                                            child: Text(
                                              statValues[i],
                                              textAlign: TextAlign.right,
                                              style: AppText.futStatValue(ink),
                                            ),
                                          ),
                                          SizedBox(width: 7.w),
                                          SizedBox(
                                            width: 41.r,
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
                      left: 125.3.w,
                      top: 279.r,
                      width: 1.5.r,
                      height: 64.r,
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
