import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class EditAvatar extends StatelessWidget {
  const EditAvatar({super.key, required this.initial});

  final String initial;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 96,
                height: 96,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.me,
                  borderRadius: BorderRadius.circular(34),
                  boxShadow: AppShadows.glow,
                ),
                child: Text(initial, style: AppText.editInitial),
              ),
              PositionedDirectional(
                bottom: -4,
                start: -4,
                child: Container(
                  width: 34,
                  height: 34,
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
          const SizedBox(height: 10),
          Text(context.tr(AppStrings.changePhoto), style: AppText.changePhoto),
        ],
      ),
    );
  }
}
