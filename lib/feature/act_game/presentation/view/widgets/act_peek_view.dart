import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActPeekView extends StatelessWidget {
  const ActPeekView({
    super.key,
    required this.actor,
    required this.team,
    required this.shown,
    required this.name,
    required this.levelLabel,
    required this.levelColor,
    required this.points,
    required this.onReveal,
    required this.onStart,
  });

  final String actor;
  final String team;
  final bool shown;
  final String name;
  final String levelLabel;
  final Color levelColor;
  final int points;
  final VoidCallback onReveal;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14.r,
      children: [
        Text(
          context.tr(AppStrings.phoneWithActor, args: [actor, team]),
          textAlign: TextAlign.center,
          style: AppText.peekNote,
        ),
        if (!shown)
          Semantics(
            button: true,
            label: context.tr(AppStrings.tapToSee),
            child: PressScale(
              onTap: onReveal,
              child: Container(
                width: 236.r,
                height: 354.r,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.cardDeep,
                  borderRadius: BorderRadius.circular(22.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.tint(AppColors.neon, .35),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Transform.scale(
                      scale: 1.14,
                      child: Image.asset(
                        AppImages.cardBackAlt,
                        fit: BoxFit.cover,
                      ),
                    ),
                    PositionedDirectional(
                      start: 14.w,
                      end: 14.w,
                      bottom: 16.r,
                      height: 42.r,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.tint(AppColors.cardDeep, .82),
                          borderRadius: BorderRadius.circular(999.r),
                          border: Border.all(
                            color: AppColors.tint(AppColors.neon, .6),
                          ),
                        ),
                        child: Text(
                          context.tr(AppStrings.tapToSee),
                          style: AppText.roomShare,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        else ...[
          Enter(
            fx: Fx.pop,
            child: Container(
              width: 230.r,
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 16.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, .7],
                  colors: [
                    AppColors.mix(levelColor, .3, AppColors.s1),
                    AppColors.s1,
                  ],
                ),
                borderRadius: BorderRadius.circular(32.r),
                border: Border.all(color: levelColor, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.tint(levelColor, .35),
                    blurRadius: 30,
                  ),
                  ...AppShadows.sh2,
                ],
              ),
              child: Column(
                spacing: 10.r,
                children: [
                  Container(
                    height: 190.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.s2,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Text(
                      name.characters.first,
                      style: AppText.display(80),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: levelColor,
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Text(
                      context.tr(
                        AppStrings.levelPoints,
                        args: [levelLabel, '$points'],
                      ),
                      style: AppText.levelTag,
                    ),
                  ),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: AppText.secretName,
                  ),
                  Text(
                    context.tr(AppStrings.actNoWords),
                    style: AppText.cardCaption,
                  ),
                ],
              ),
            ),
          ),
          PrimaryButton(
            label: context.tr(AppStrings.hideAndStart),
            onTap: onStart,
            height: 56.r,
          ),
        ],
      ],
    );
  }
}
