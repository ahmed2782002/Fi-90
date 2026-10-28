import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';
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
        const SizedBox(height: 6),
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: AppColors.s1,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.line2, width: 1.5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.google, width: 18, height: 18),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  email,
                  textDirection: TextDirection.ltr,
                  textAlign: Directionality.of(context) == TextDirection.rtl
                      ? TextAlign.right
                      : TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.fieldText(AppColors.tx, size: 14),
                ),
              ),
              const SizedBox(width: 10),
              Text(context.tr(AppStrings.linked), style: AppText.linked),
            ],
          ),
        ),
      ],
    );
  }
}
