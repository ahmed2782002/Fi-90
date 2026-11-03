import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/tinted_icon_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutSheet extends StatelessWidget {
  const LogoutSheet({super.key, required this.onConfirm});

  final VoidCallback onConfirm;

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.scrim,
      // Default sheets cap at 9/16 of the screen, which clips this card on
      // short devices; let it size to its content instead.
      isScrollControlled: true,
      builder: (_) => LogoutSheet(onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        12,
        0,
        12,
        26 + MediaQuery.paddingOf(context).bottom,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
        decoration: BoxDecoration(
          color: AppColors.s1,
          borderRadius: BorderRadius.circular(34.r),
          border: Border.all(color: AppColors.line2),
          boxShadow: AppShadows.sh2,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: TintedIconBox(
                  icon: AppIcons.logout,
                  tint: AppColors.bad,
                  ink: AppColors.badInk,
                  size: 60.r,
                  radius: 22.r,
                  iconSize: 28.r,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                context.tr(AppStrings.logoutQuestion),
                textAlign: TextAlign.center,
                style: AppText.dialogTitle,
              ),
              SizedBox(height: 12.h),
              Text(
                context.tr(AppStrings.logoutBody),
                textAlign: TextAlign.center,
                style: AppText.dialogBody,
              ),
              SizedBox(height: 18.h),
              PressScale(
                onTap: onConfirm,
                child: Container(
                  height: 54.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.bad,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Text(
                    context.tr(AppStrings.logoutConfirm),
                    style: AppText.actionButton(16),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              PressScale(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: 50.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999.r),
                    border: Border.all(color: AppColors.line2),
                  ),
                  child: Text(
                    context.tr(AppStrings.cancel),
                    style: AppText.cancel,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
