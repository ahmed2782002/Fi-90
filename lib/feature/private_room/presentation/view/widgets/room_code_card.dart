import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomCodeCard extends StatelessWidget {
  const RoomCodeCard({
    super.key,
    required this.code,
    required this.link,
    required this.onCopy,
    required this.onWhatsapp,
    required this.onShare,
  });

  final String code;
  final String link;
  final VoidCallback onCopy;
  final VoidCallback onWhatsapp;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        spacing: 12.r,
        children: [
          Text(context.tr(AppStrings.roomCode), style: AppText.pageIntro),
          Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.ltr,
            spacing: 8.r,
            children: [
              for (final c in code.characters)
                Container(
                  width: 56.r,
                  height: 66.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.s2,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(c, style: AppText.roomCodeChar),
                ),
            ],
          ),
          Container(
            padding: EdgeInsetsDirectional.fromSTEB(14.w, 6.h, 6.w, 6.h),
            decoration: BoxDecoration(
              color: AppColors.s2,
              borderRadius: BorderRadius.circular(999.r),
              border: Border.all(color: AppColors.line),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    link,
                    textDirection: TextDirection.ltr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.roomLink,
                  ),
                ),
                PressScale(
                  onTap: onCopy,
                  child: Container(
                    height: 36.r,
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.s1,
                      borderRadius: BorderRadius.circular(999.r),
                      boxShadow: AppShadows.sh1,
                    ),
                    child: Text(
                      context.tr(AppStrings.copy),
                      style: AppText.roomCopy,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            spacing: 8.r,
            children: [
              Expanded(
                child: PressScale(
                  onTap: onWhatsapp,
                  child: Container(
                    height: 46.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.whatsapp,
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Text(
                      context.tr(AppStrings.sendWhatsapp),
                      style: AppText.whatsappButton,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  label: context.tr(AppStrings.shareLink),
                  onTap: onShare,
                  height: 46.r,
                  style: AppText.roomShare,
                ),
              ),
            ],
          ),
          Text(
            context.tr(AppStrings.roomShareHint),
            textAlign: TextAlign.center,
            style: AppText.caption,
          ),
        ],
      ),
    );
  }
}
