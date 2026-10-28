import 'package:fii90/core/localization/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/player_stat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPlayerCardBody extends StatelessWidget {
  const NewPlayerCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text('1', style: AppText.playerLevel),
                    Text(
                      context.tr(AppStrings.levelShort),
                      style: AppText.playerLevelLabel,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.tint(AppColors.black, .28),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    context.tr(AppStrings.newPlayer),
                    style: AppText.playerTag,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 76),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.tint(AppColors.black, .2),
                    border: Border.all(
                      color: AppColors.tint(AppColors.cy, .6),
                      width: 2,
                    ),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: 64 / 72,
                    heightFactor: 64 / 72,
                    child: SvgPicture.asset(AppIcons.person),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(context.tr(AppStrings.isItYou), style: AppText.playerHeadline),
          const SizedBox(height: 8),
          Container(height: 1, color: AppColors.tint(AppColors.white, .2)),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlayerStat(value: '0', label: AppStrings.statMatches),
              PlayerStat(value: '0', label: AppStrings.statXp),
              PlayerStat(value: '—', label: AppStrings.statRank),
            ],
          ),
        ],
      ),
    );
  }
}
