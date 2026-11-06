import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
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

/// Pre-auction lobby: match format, league and one optional power card.
/// Leaving the defaults (all leagues, no card) is the quick way in.
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
    final cards = <AuctionPowerCard?>[null, ...AuctionPowerCard.values];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _step(0, const _Header()),
        SizedBox(height: 16.h),
        _step(
          1,
          _Section(
            header: SetupSectionHeader(
              step: 1,
              title: context.tr(AppStrings.matchSizeLabel),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
            ),
          ),
        ),
        SizedBox(height: 12.h),
        _step(
          2,
          _Section(
            header: SetupSectionHeader(
              step: 2,
              title: context.tr(AppStrings.leagueLabel),
              value: context.tr(config.league.nameKey),
            ),
            child: _HorizontalRow(
              height: LeagueTile.width + 64.h,
              itemCount: AuctionLeague.values.length,
              itemBuilder: (i) {
                final league = AuctionLeague.values[i];
                return LeagueTile(
                  league: league,
                  selected: config.league == league,
                  onTap: () => onChanged(config.copyWith(league: league)),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 12.h),
        _step(
          3,
          _Section(
            header: SetupSectionHeader(
              step: 3,
              title: context.tr(AppStrings.powerCardsLabel),
              hint: context.tr(AppStrings.powerCardsHint),
              value: context.tr(config.card?.titleKey ?? AppStrings.noCard),
            ),
            child: _HorizontalRow(
              height: PowerCardTile.width + 92.h,
              itemCount: cards.length,
              itemBuilder: (i) {
                final card = cards[i];
                return PowerCardTile(
                  card: card,
                  selected: config.card == card,
                  onTap: () => onChanged(config.withCard(card)),
                );
              },
            ),
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

/// Soft container that groups a section header with its options.
class _Section extends StatelessWidget {
  const _Section({required this.header, required this.child});

  final Widget header;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
      decoration: BoxDecoration(
        color: AppColors.tint(AppColors.s1, .55),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          header,
          SizedBox(height: 10.h),
          child,
        ],
      ),
    );
  }
}

/// Side-scrolling row of fixed-width options.
class _HorizontalRow extends StatelessWidget {
  const _HorizontalRow({
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  });

  final double height;
  final int itemCount;
  final Widget Function(int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
        itemCount: itemCount,
        separatorBuilder: (_, _) => SizedBox(width: 10.w),
        itemBuilder: (_, i) => itemBuilder(i),
      ),
    );
  }
}
