import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class InvalidRoomOverlay extends StatelessWidget {
  const InvalidRoomOverlay({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          color: AppColors.scrim,
          padding: const EdgeInsets.all(24),
          alignment: Alignment.center,
          child: Enter(
            fx: Fx.pop,
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.s1,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: AppColors.line2),
                boxShadow: AppShadows.sh2,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Text(
                    context.tr(AppStrings.invalidRoom),
                    textAlign: TextAlign.center,
                    style: AppText.dialogTitle,
                  ),
                  Text(
                    context.tr(AppStrings.invalidRoomHint),
                    textAlign: TextAlign.center,
                    style: AppText.dialogBody,
                  ),
                  const SizedBox(height: 4),
                  PrimaryButton(
                    label: context.tr(AppStrings.retypeCode),
                    onTap: onRetry,
                    height: 54,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
