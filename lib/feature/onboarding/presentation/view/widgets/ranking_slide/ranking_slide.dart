import 'package:fii90/core/animation/bob.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/stage_app/info_chip.dart';
import 'package:fii90/core/widgets/stage_app/score_sticker.dart';
import 'package:fii90/core/widgets/stage_app/stage_glow.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/ranking_slide/podium_place.dart';
import 'package:flutter/material.dart';

class RankingSlide extends StatelessWidget {
  const RankingSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: StageGlow()),
        const Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PodiumPlace(
                rank: '1', name: 'أحمد', initial: 'أ', xp: '2,480 XP', barHeight: 150,
                accent: AppColors.gold, ink: AppColors.goldInk,
                fill: AppColors.me, onFill: AppColors.meOn, avatarSize: 62, crowned: true,
                avatarDelay: 400, nameDelay: 450, barDelay: 50,
              ),
              SizedBox(width: 10),
              PodiumPlace(
                rank: '2', name: 'سارة', initial: 'س', xp: '2,210 XP', barHeight: 108,
                accent: AppColors.m4, ink: AppColors.m4Ink,
                fill: AppColors.s3, onFill: AppColors.tx, avatarSize: 52,
                avatarDelay: 530, nameDelay: 580, barDelay: 180,
              ),
              SizedBox(width: 10),
              PodiumPlace(
                rank: '3', name: 'عمر', initial: 'ع', xp: '1,960 XP', barHeight: 80,
                accent: AppColors.op, ink: AppColors.opInk,
                fill: AppColors.op, onFill: AppColors.opOn, avatarSize: 52,
                avatarDelay: 650, nameDelay: 700, barDelay: 300,
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 14,
          start: 14,
          child: Enter(
            fx: Fx.pop,
            delay: const Duration(milliseconds: 750),
            child: Bob(child: ScoreSticker(text: '+40', style: AppText.sticker)),
          ),
        ),
        PositionedDirectional(
          top: 22,
          end: 14,
          child: Enter(
            fx: Fx.fadeUp,
            delay: const Duration(milliseconds: 850),
            child: InfoChip(
              height: 36,
              hPad: 14,
              label: 'طلعت 3 مراكز',
              leading: Text('▲', style: AppText.pill.copyWith(color: AppColors.okInk)),
              style: AppText.pill,
            ),
          ),
        ),
      ],
    );
  }
}
