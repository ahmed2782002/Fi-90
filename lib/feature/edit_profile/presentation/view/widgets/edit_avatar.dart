import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAvatar extends StatelessWidget {
  const EditAvatar({super.key, required this.initial});

  final String initial;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 96.r,
                height: 96.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.me,
                  borderRadius: BorderRadius.circular(34.r),
                  boxShadow: AppShadows.glow,
                ),
                child: Text(initial, style: AppText.editInitial),
              ),
              PositionedDirectional(
                bottom: -4,
                start: -4,
                child: Container(
                  width: 34.r,
                  height: 34.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: AppColors.grad,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.neon, width: 1.5),
                  ),
                  child: Text('+', style: AppText.editPlus),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(context.tr(AppStrings.changePhoto), style: AppText.changePhoto),
        ],
      ),
    );
  }
}
