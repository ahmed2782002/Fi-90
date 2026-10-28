import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class SpyFlipCard extends StatelessWidget {
  const SpyFlipCard({
    super.key,
    required this.flipped,
    required this.isSpy,
    required this.secret,
    required this.onFlip,
  });

  final bool flipped;
  final bool isSpy;
  final String secret;
  final VoidCallback onFlip;

  @override
  Widget build(BuildContext context) {
    final edge = isSpy ? AppColors.redGlow : AppColors.neon;
    return PressScale(
      onTap: onFlip,
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: flipped ? math.pi : 0),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutBack,
        builder: (context, angle, _) {
          final front = angle > math.pi / 2;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, .0009)
              ..rotateY(angle),
            child: Container(
              width: 216,
              height: 324,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: isSpy && front ? null : AppColors.cardDeep,
                gradient: isSpy && front ? AppColors.spyCard : null,
                borderRadius: BorderRadius.circular(18),
                border: front ? Border.all(color: edge, width: 2) : null,
                boxShadow: [
                  BoxShadow(color: AppColors.tint(edge, .45), blurRadius: 28),
                ],
              ),
              child: !front
                  ? Image.asset(AppImages.cardBack, fit: BoxFit.cover)
                  : Transform.flip(
                      flipX: true,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: isSpy
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.end,
                          spacing: isSpy ? 14 : 4,
                          children: isSpy
                              ? [
                                  Container(
                                    width: 84,
                                    height: 84,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.spyDeep,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.spyRed,
                                        width: 2,
                                      ),
                                    ),
                                    child: Text(
                                      '؟',
                                      style: AppText.spyMark(44),
                                    ),
                                  ),
                                  Text(
                                    context.tr(AppStrings.spy),
                                    style: AppText.spyMark(34),
                                  ),
                                  Text(
                                    context.tr(AppStrings.youAreSpyHint),
                                    textAlign: TextAlign.center,
                                    style: AppText.spyHint,
                                  ),
                                ]
                              : [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        secret.characters.first,
                                        style: AppText.display(90),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    context.tr(AppStrings.secretPlayer),
                                    style: AppText.secretCaption,
                                  ),
                                  Text(
                                    secret,
                                    textAlign: TextAlign.center,
                                    style: AppText.secretName,
                                  ),
                                ],
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
