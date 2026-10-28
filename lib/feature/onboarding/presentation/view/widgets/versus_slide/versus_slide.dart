import 'package:fii90/core/animation/bob.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/stage_app/line_icon.dart';
import 'package:fii90/core/widgets/stage_app/score_sticker.dart';
import 'package:fii90/core/widgets/stage_app/stage_glow.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/versus_slide/horizon_line.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/versus_slide/match_timer.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/versus_slide/versus_players.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/versus_slide/vs_badge.dart';
import 'package:flutter/material.dart';

class VersusSlide extends StatelessWidget {
  const VersusSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Positioned.fill(child: StageGlow()),
        const Positioned(
          left: 0,
          right: 0,
          child: Enter(
            fx: Fx.fadeIn,
            duration: Duration(milliseconds: 600),
            delay: Duration(milliseconds: 300),
            child: HorizonLine(),
          ),
        ),
        const VersusPlayers(),
        const Enter(
          fx: Fx.pop,
          duration: Duration(milliseconds: 600),
          delay: Duration(milliseconds: 350),
          child: VsBadge(),
        ),
        const Positioned(
          top: 18,
          child: Enter(
            fx: Fx.fadeUp,
            delay: Duration(milliseconds: 500),
            child: MatchTimer(time: '00:10'),
          ),
        ),
        PositionedDirectional(
          bottom: 26,
          end: 14,
          child: Enter(
            fx: Fx.pop,
            delay: const Duration(milliseconds: 600),
            child: Bob(
              child: ScoreSticker(text: '+20', style: AppText.sticker),
            ),
          ),
        ),
        PositionedDirectional(
          top: 44,
          start: 22,
          child: Enter(
            fx: Fx.pop,
            delay: Duration(milliseconds: 700),
            child: Opacity(
              opacity: .8,
              child: LineIcon(AppIcons.sparkle, color: AppColors.cy, size: 18),
            ),
          ),
        ),
      ],
    );
  }
}
