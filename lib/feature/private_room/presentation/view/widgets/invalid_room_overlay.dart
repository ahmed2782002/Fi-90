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
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          padding: EdgeInsets.all(24.r),
          alignment: Alignment.center,
          child: Enter(
            fx: Fx.pop,
            child: Container(
              padding: EdgeInsets.all(22.r),
              decoration: BoxDecoration(
                color: AppColors.s1,
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(color: AppColors.line2),
                boxShadow: AppShadows.sh2,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 10.r,
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
                  SizedBox(height: 4.h),
                  PrimaryButton(
                    label: context.tr(AppStrings.retypeCode),
                    onTap: onRetry,
                    height: 54.r,
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
