import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.onContact});

  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.s2,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.tr(AppStrings.noAnswer), style: AppText.rowTitle),
                Text(
                  context.tr(AppStrings.noAnswerHint),
                  style: AppText.rowSubtitle,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          PrimaryButton(
            label: context.tr(AppStrings.contactUs),
            height: 42,
            expand: false,
            style: AppText.actionButton(13),
            onTap: onContact,
          ),
        ],
      ),
    );
  }
}
