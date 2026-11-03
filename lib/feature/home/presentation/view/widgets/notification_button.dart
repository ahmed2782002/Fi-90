import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
    required this.count,
    required this.onTap,
  });

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: context.tr(AppStrings.notifications),
      child: PressScale(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 44.r,
              height: 44.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.s1,
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: AppColors.line),
                boxShadow: AppShadows.sh1,
              ),
              child: SvgPicture.asset(
                AppIcons.notification,
                width: 22.r,
                height: 22.r,
                colorFilter: ColorFilter.mode(AppColors.tx2, BlendMode.srcIn),
              ),
            ),
            if (count > 0)
              PositionedDirectional(
                top: -7,
                end: -7,
                child: Container(
                  constraints: BoxConstraints(minWidth: 24.r),
                  height: 24.r,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.bad,
                    borderRadius: BorderRadius.circular(999.r),
                    border: Border.all(color: AppColors.bg, width: 2),
                  ),
                  child: Text('$count', style: AppText.countBadge),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
