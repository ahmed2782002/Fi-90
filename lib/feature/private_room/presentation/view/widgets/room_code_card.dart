import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        spacing: 12,
        children: [
          Text(context.tr(AppStrings.roomCode), style: AppText.pageIntro),
          Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.ltr,
            spacing: 8,
            children: [
              for (final c in code.characters)
                Container(
                  width: 56,
                  height: 66,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.s2,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(c, style: AppText.roomCodeChar),
                ),
            ],
          ),
          Container(
            padding: const EdgeInsetsDirectional.fromSTEB(14, 6, 6, 6),
            decoration: BoxDecoration(
              color: AppColors.s2,
              borderRadius: BorderRadius.circular(999),
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
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.s1,
                      borderRadius: BorderRadius.circular(999),
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
            spacing: 8,
            children: [
              Expanded(
                child: PressScale(
                  onTap: onWhatsapp,
                  child: Container(
                    height: 46,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.whatsapp,
                      borderRadius: BorderRadius.circular(999),
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
                  height: 46,
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
