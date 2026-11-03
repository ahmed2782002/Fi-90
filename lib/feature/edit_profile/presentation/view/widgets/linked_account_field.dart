import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkedAccountField extends StatelessWidget {
  const LinkedAccountField({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.tr(AppStrings.linkedAccount), style: AppText.fieldLabel),
        SizedBox(height: 6.h),
        Container(
          height: 52.r,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
            color: AppColors.s1,
            borderRadius: BorderRadius.circular(999.r),
            border: Border.all(color: AppColors.line2, width: 1.5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.google, width: 18.r, height: 18.r),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  email,
                  textDirection: TextDirection.ltr,
                  textAlign: Directionality.of(context) == TextDirection.rtl
                      ? TextAlign.right
                      : TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.fieldText(AppColors.tx, size: 14.r),
                ),
              ),
              SizedBox(width: 10.w),
              Text(context.tr(AppStrings.linked), style: AppText.linked),
            ],
          ),
        ),
      ],
    );
  }
}
