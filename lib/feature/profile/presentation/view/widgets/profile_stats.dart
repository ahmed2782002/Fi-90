import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/feature/profile/mock_model/profile_data.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/stat_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key, required this.profile});

  final ProfileData profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatPill(
          value: '${profile.matches}',
          label: context.tr(AppStrings.statMatchesCount),
        ),
        SizedBox(width: 8.w),
        StatPill(
          value: '${profile.wins}',
          label: context.tr(AppStrings.statWins),
          color: AppColors.okInk,
        ),
        SizedBox(width: 8.w),
        StatPill(
          value: '${profile.accuracy}%',
          label: context.tr(AppStrings.statAccuracy),
        ),
        SizedBox(width: 8.w),
        StatPill(
          value: '${profile.streak}',
          label: context.tr(AppStrings.statStreak),
          color: AppColors.goldInk,
        ),
      ],
    );
  }
}
