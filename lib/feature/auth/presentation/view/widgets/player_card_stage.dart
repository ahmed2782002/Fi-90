import 'dart:math' as math;

import 'package:fii90/core/localization/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/stage_app/dot.dart';
import 'package:fii90/core/widgets/stage_app/info_chip.dart';
import 'package:fii90/core/widgets/stage_app/score_sticker.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/floating_perk.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/tilting_player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerCardStage extends StatelessWidget {
  const PlayerCardStage({super.key});

  static const _matchBottom = .04;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: _buildStage);
  }

  Widget _buildStage(BuildContext context, BoxConstraints box) {
    // The two bottom chips sit on opposite sides, but longer copy (English)
    // makes them wide enough to meet in the middle, and a short stage pushes
    // them onto each other. Keep the rank chip at least one chip-row above
    // the match chip so they never overlap.
    final rowFraction = (34.r + 8.r) / box.maxHeight;
    final rankBottom = math.max(.12, _matchBottom + rowFraction);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              width: 260.r,
              height: 260.r,
              child: TiltingPlayerCard(),
            ),
          ),
        ),
        FloatingPerk(
          top: .06,
          start: .04,
          delay: 200,
          child: ScoreSticker(
            text: '+150 XP',
            style: AppText.stickerSmall,
            rotateDeg: -6,
            ring: 2,
          ),
        ),
        FloatingPerk(
          top: .14,
          end: .02,
          delay: 900,
          child: InfoChip(
            label: context.tr(AppStrings.perkLevelRewards),
            leading: Dot(AppColors.cy, size: 8.r, glow: true),
            style: AppText.perk,
            hPad: 13,
          ),
        ),
        FloatingPerk(
          bottom: rankBottom,
          start: 0,
          delay: 1500,
          child: InfoChip(
            label: context.tr(AppStrings.perkRankSaved),
            leading: Text(
              '▲',
              style: AppText.perk.copyWith(color: AppColors.okInk),
            ),
            style: AppText.perk,
            hPad: 13,
          ),
        ),
        FloatingPerk(
          bottom: _matchBottom,
          end: .06,
          delay: 500,
          child: InfoChip(
            label: context.tr(AppStrings.perkMatchHistory),
            leading: Dot(AppColors.op, size: 8.r),
            style: AppText.perk,
            hPad: 13,
          ),
        ),
      ],
    );
  }
}
