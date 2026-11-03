import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/tinted_icon_box.dart';
import 'package:fii90/feature/match/mock_model/match_mode.dart';
import 'package:fii90/feature/match/presentation/view/widgets/rule_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModeRulesSheet extends StatelessWidget {
  const ModeRulesSheet({super.key, required this.mode});

  final MatchMode mode;

  static Future<void> show(BuildContext context, MatchMode mode) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.scrim,
      isScrollControlled: true,
      builder: (_) => ModeRulesSheet(mode: mode),
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
                  icon: mode.icon,
                  tint: mode.accent,
                  ink: mode.ink,
                  size: 60.r,
                  radius: 22.r,
                  iconSize: 30.r,
                  tintAlpha: .16,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                context.tr(mode.nameKey),
                textAlign: TextAlign.center,
                style: AppText.dialogTitle,
              ),
              SizedBox(height: 6.h),
              Text(
                context.tr(mode.hookKey),
                textAlign: TextAlign.center,
                style: AppText.dialogBody,
              ),
              SizedBox(height: 16.h),
              for (var i = 0; i < mode.ruleKeys.length; i++) ...[
                if (i > 0) SizedBox(height: 8.h),
                RulePill(
                  number: i + 1,
                  text: context.tr(mode.ruleKeys[i]),
                  accent: mode.accent,
                  ink: mode.ink,
                ),
              ],
              SizedBox(height: 18.h),
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
                    context.tr(AppStrings.close),
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
