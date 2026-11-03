import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/result_tag.dart';
import 'package:fii90/feature/journey/mock_model/match_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.record});

  final MatchRecord record;

  @override
  Widget build(BuildContext context) {
    final mode = record.modeKey;
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ResultTag(
                label: context.tr(record.result.labelKey),
                color: record.result.color,
                background: record.result.background,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  context.tr(
                    AppStrings.versus,
                    args: [context.tr(record.opponentKey)],
                  ),
                  style: AppText.historyOpponent,
                ),
              ),
              Text(
                record.score,
                textDirection: TextDirection.ltr,
                style: AppText.historyScore,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              for (final color in record.modes) ...[
                Container(
                  width: 8.r,
                  height: 8.r,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
                SizedBox(width: 6.w),
              ],
              Text(
                mode == null
                    ? context.tr(
                        AppStrings.roundsCount,
                        args: ['${record.modes.length}'],
                      )
                    : context.tr(mode),
                style: AppText.meta,
              ),
              const Spacer(),
              Text(
                '${context.tr(record.dateKey)} · '
                '${context.tr(AppStrings.minutesShort, args: [record.duration])}',
                style: AppText.meta,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
