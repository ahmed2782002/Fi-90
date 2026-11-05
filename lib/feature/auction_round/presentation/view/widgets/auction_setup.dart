import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/core/widgets/tinted_icon_box.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_options.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/setup/league_tile.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/setup/power_card_tile.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/setup/setup_section_header.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/setup/squad_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Pre-auction lobby: match size, league and power cards, then start.
class AuctionSetup extends StatelessWidget {
  const AuctionSetup({
    super.key,
    required this.config,
    required this.onChanged,
    required this.onStart,
    required this.startLabel,
  });

  final AuctionConfig config;
  final ValueChanged<AuctionConfig> onChanged;
  final VoidCallback onStart;
  final String startLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _step(0, const _Header()),
        SizedBox(height: 14.h),
        _step(
          1,
          _Panel(
            children: [
              SetupSectionHeader(
                step: 1,
                title: context.tr(AppStrings.matchSizeLabel),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  for (final (i, squad) in AuctionSize.values.indexed) ...[
                    if (i > 0) SizedBox(width: 10.w),
                    Expanded(
                      child: SquadOptionCard(
                        squad: squad,
                        selected: config.squad == squad,
                        onTap: () => onChanged(config.copyWith(squad: squad)),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        _step(
          2,
          _Panel(
            children: [
              SetupSectionHeader(
                step: 2,
                title: context.tr(AppStrings.leagueLabel),
              ),
              SizedBox(height: 12.h),
              for (var r = 0; r < AuctionLeague.values.length; r += 2) ...[
                if (r > 0) SizedBox(height: 10.h),
                Row(
                  children: [
                    for (final (i, league)
                        in AuctionLeague.values.skip(r).take(2).indexed) ...[
                      if (i > 0) SizedBox(width: 10.w),
                      Expanded(
                        child: LeagueTile(
                          league: league,
                          selected: config.league == league,
                          onTap: () =>
                              onChanged(config.copyWith(league: league)),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: 12.h),
        _step(
          3,
          _Panel(
            children: [
              SetupSectionHeader(
                step: 3,
                title: context.tr(AppStrings.powerCardsLabel),
                hint: context.tr(AppStrings.powerCardsHint),
              ),
              SizedBox(height: 14.h),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final (i, card)
                        in AuctionPowerCard.values.indexed) ...[
                      if (i > 0) SizedBox(width: 10.w),
                      Expanded(
                        child: PowerCardTile(
                          card: card,
                          selected: config.cards.contains(card),
                          onTap: () => onChanged(config.toggle(card)),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18.h),
        _step(4, PrimaryButton(label: startLabel, onTap: onStart)),
      ],
    );
  }

  Widget _step(int index, Widget child) => Enter(
    fx: Fx.fadeUp,
    duration: const Duration(milliseconds: 380),
    delay: Duration(milliseconds: 70 * index),
    child: child,
  );
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.tint(AppColors.goldGlow, .35),
                blurRadius: 18,
              ),
            ],
          ),
          child: TintedIconBox(
            icon: AppIcons.gavel,
            tint: AppColors.gold,
            ink: AppColors.goldInk,
            size: 50.r,
            radius: 18.r,
            iconSize: 26.r,
            tintAlpha: .18,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(AppStrings.auctionSetupTitle),
                style: AppText.sheetTitle,
              ),
              Text(
                context.tr(AppStrings.auctionSetupHint),
                style: AppText.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 14.h),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(26.r),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
