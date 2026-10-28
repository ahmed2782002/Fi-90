import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/tinted_icon_box.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_pair.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_player.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/pitch_painter.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/pitch_token.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_state.dart';
import 'package:flutter/material.dart';

class TeamPitch extends StatelessWidget {
  const TeamPitch({
    super.key,
    required this.name,
    required this.nameColor,
    required this.active,
    required this.subtitle,
    required this.team,
    required this.rows,
    required this.glow,
    this.freshSlot,
  });

  final String name;
  final Color nameColor;
  final bool active;
  final String subtitle;
  final Map<String, Signing> team;
  final List<List<String>> rows;
  final Color glow;
  final String? freshSlot;

  @override
  Widget build(BuildContext context) {
    final coach = team['CO'];
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: active ? nameColor : AppColors.line,
          width: 1.5,
        ),
        boxShadow: AppShadows.sh1,
      ),
      child: CustomPaint(
        painter: PitchPainter(
          stripe: AppColors.mix(AppColors.cy, .09, AppColors.s1),
          alt: AppColors.mix(AppColors.cy, .04, AppColors.s1),
          line: AppColors.line2,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 14),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 10, 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: AppText.pitchName(nameColor)),
                          Text(subtitle, style: AppText.pitchSub),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        4,
                        4,
                        10,
                        4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.s1,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: AppColors.line),
                      ),
                      child: Row(
                        children: [
                          TintedIconBox(
                            icon: AppIcons.person,
                            tint: AppColors.s2,
                            ink: AppColors.dim,
                            size: 30,
                            radius: 15,
                            iconSize: 16,
                            tintAlpha: 1,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.tr(AppStrings.slotCoach),
                                style: AppText.coachCaption,
                              ),
                              Text(
                                coach == null
                                    ? context.tr(AppStrings.notYet)
                                    : AuctionPlayer.all[coach.player]!.short.of(
                                        context,
                                      ),
                                style: AppText.coachName,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              for (final row in rows)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (final slot in row)
                        PitchToken(
                          slotLabel: context.tr(AuctionPair.slotKeyOf(slot)),
                          emptyLabel: context.tr(AppStrings.notYet),
                          freeLabel: context.tr(AppStrings.free),
                          player: team[slot] == null
                              ? null
                              : AuctionPlayer.all[team[slot]!.player],
                          price: team[slot]?.price ?? 0,
                          highlight: slot == freshSlot ? glow : null,
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
