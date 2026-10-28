import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:flutter/material.dart';

class FriendCodeCard extends StatelessWidget {
  const FriendCodeCard({super.key, required this.code, required this.onShare});

  final String code;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.s2,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Text(context.tr(AppStrings.yourCode), style: AppText.codeLabel),
          const SizedBox(width: 4),
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
          const SizedBox(width: 10),
          PressScale(
            onTap: onShare,
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.s1,
                borderRadius: BorderRadius.circular(999),
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
