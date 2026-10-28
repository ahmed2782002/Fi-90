import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class PlaySheetHeader extends StatelessWidget {
  const PlaySheetHeader({
    super.key,
    required this.subtitle,
    required this.onClose,
  });

  final String subtitle;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 42,
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.line2,
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 2, 4, 4),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(AppStrings.whoToPlay),
                      style: AppText.sheetTitle,
                    ),
                    Text(subtitle, style: AppText.sheetSubtitle),
                  ],
                ),
              ),
              Semantics(
                button: true,
                label: context.tr(AppStrings.close),
                child: PressScale(
                  onTap: onClose,
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.s2,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.line),
                    ),
                    child: Text('✕', style: AppText.sheetClose),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
