import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class InviteActions extends StatelessWidget {
  const InviteActions({
    super.key,
    required this.acceptLabel,
    required this.declineLabel,
    required this.onAccept,
    required this.onDecline,
  });

  final String acceptLabel;
  final String declineLabel;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
            label: acceptLabel,
            height: 40,
            style: AppText.actionButton(13),
            onTap: onAccept,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: PressScale(
            onTap: onDecline,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: AppColors.line2),
              ),
              child: Text(
                declineLabel,
                style: AppText.fieldText(
                  AppColors.tx,
                  size: 13,
                  weight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
