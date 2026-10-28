import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/result_tag.dart';
import 'package:fii90/feature/journey/mock_model/match_record.dart';
import 'package:flutter/material.dart';

class LastMatchTile extends StatelessWidget {
  const LastMatchTile({super.key, required this.record});

  final MatchRecord record;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        children: [
          ResultTag(
            label: context.tr(record.result.labelKey),
            color: record.result.color,
            background: record.result.background,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              context.tr(
                AppStrings.versus,
                args: [context.tr(record.opponentKey)],
              ),
              style: AppText.lastOpponent,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            record.score,
            textDirection: TextDirection.ltr,
            style: AppText.lastScore,
          ),
          const SizedBox(width: 12),
          Text(context.tr(record.dateKey), style: AppText.meta),
        ],
      ),
    );
  }
}
