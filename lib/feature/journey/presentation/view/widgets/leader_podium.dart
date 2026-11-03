import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/journey/mock_model/leader.dart';
import 'package:fii90/feature/journey/presentation/view/widgets/podium_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderPodium extends StatelessWidget {
  const LeaderPodium({super.key, required this.leaders});

  final List<Leader> leaders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h, bottom: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PodiumColumn(
            name: context.tr(leaders[1].nameKey),
            rank: 2,
            avatarSize: 50,
            avatarRadius: 16,
            initialSize: 19,
            barHeight: 70,
            rankSize: 24,
            rankColor: AppColors.tx2,
          ),
          SizedBox(width: 8.w),
          PodiumColumn(
            name: context.tr(leaders[0].nameKey),
            rank: 1,
            avatarSize: 60,
            avatarRadius: 20,
            initialSize: 23,
            barHeight: 96,
            rankSize: 30,
            rankColor: AppColors.goldInk,
            first: true,
          ),
          SizedBox(width: 8.w),
          PodiumColumn(
            name: context.tr(leaders[2].nameKey),
            rank: 3,
            avatarSize: 50,
            avatarRadius: 16,
            initialSize: 19,
            barHeight: 56,
            rankSize: 22,
            rankColor: AppColors.opInk,
          ),
        ],
      ),
    );
  }
}
