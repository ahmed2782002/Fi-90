import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_text_field.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class RoomJoinForm extends StatelessWidget {
  const RoomJoinForm({
    super.key,
    required this.controller,
    required this.onJoin,
  });

  final TextEditingController controller;
  final VoidCallback onJoin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Text(context.tr(AppStrings.typeRoomCode), style: AppText.pageIntro),
        AppTextField(
          controller: controller,
          hint: '• • • •',
          height: 78,
          ltr: true,
          fontSize: 40,
          weight: FontWeight.w800,
          accent: AppColors.pri,
          onSubmitted: onJoin,
        ),
        Text(context.tr(AppStrings.roomCodeDemo), style: AppText.caption),
        PrimaryButton(label: context.tr(AppStrings.join), onTap: onJoin),
      ],
    );
  }
}
