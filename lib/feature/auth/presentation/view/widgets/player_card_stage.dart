import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/stage_app/dot.dart';
import 'package:fii90/core/widgets/stage_app/info_chip.dart';
import 'package:fii90/core/widgets/stage_app/score_sticker.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/floating_perk.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/tilting_player_card.dart';
import 'package:flutter/material.dart';

class PlayerCardStage extends StatelessWidget {
  const PlayerCardStage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Positioned.fill(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(width: 260, height: 260, child: TiltingPlayerCard()),
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
            label: 'مستوى ومكافآت',
            leading: const Dot(AppColors.cy, size: 8, glow: true),
            style: AppText.perk,
            hPad: 13,
          ),
        ),
        FloatingPerk(
          bottom: .12,
          start: 0,
          delay: 1500,
          child: InfoChip(
            label: 'ترتيبك محفوظ',
            leading: Text('▲', style: AppText.perk.copyWith(color: AppColors.okInk)),
            style: AppText.perk,
            hPad: 13,
          ),
        ),
        FloatingPerk(
          bottom: .04,
          end: .06,
          delay: 500,
          child: InfoChip(
            label: 'سجل مبارياتك',
            leading: const Dot(AppColors.op, size: 8),
            style: AppText.perk,
            hPad: 13,
          ),
        ),
      ],
    );
  }
}
