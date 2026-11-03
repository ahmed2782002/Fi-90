import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendCodeCard extends StatelessWidget {
  const FriendCodeCard({super.key, required this.code, required this.onShare});

  final String code;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.s2,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Row(
        children: [
          Text(context.tr(AppStrings.yourCode), style: AppText.codeLabel),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              code,
              textDirection: TextDirection.ltr,
              textAlign: Directionality.of(context) == TextDirection.rtl
                  ? TextAlign.right
                  : TextAlign.left,
              style: AppText.codeValue,
            ),
          ),
          SizedBox(width: 10.w),
          PressScale(
            onTap: onShare,
            child: Container(
              height: 36.r,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.s1,
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(color: AppColors.line2),
              ),
              child: Text(
                context.tr(AppStrings.shareCode),
                style: AppText.shareCode,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
