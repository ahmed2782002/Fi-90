import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class PlayerStat extends StatelessWidget {
  const PlayerStat({super.key, required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value, style: AppText.statValue),
        Text(context.tr(label), style: AppText.statLabel),
      ],
    );
  }
}
