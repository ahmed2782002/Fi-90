import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/widgets/brand_logo/brand_logo.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/layout/presentation/view/widgets/nav_item.dart';
import 'package:fii90/feature/layout/presentation/view_model/layout_state.dart';
import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    required this.tab,
    required this.onSelect,
    required this.onPlay,
  });

  final LayoutTab tab;
  final ValueChanged<LayoutTab> onSelect;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 66,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: AppShadows.sh2,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.glass,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: AppColors.line),
                    ),
                    child: Row(
                      children: [
                        NavItem(
                          icon: AppIcons.navHome,
                          label: context.tr(AppStrings.navHome),
                          selected: tab == LayoutTab.home,
                          onTap: () => onSelect(LayoutTab.home),
                        ),
                        NavItem(
                          icon: AppIcons.navFriends,
                          label: context.tr(AppStrings.navFriends),
                          selected: tab == LayoutTab.friends,
                          onTap: () => onSelect(LayoutTab.friends),
                        ),
                        const SizedBox(width: 56),
                        NavItem(
                          icon: AppIcons.navJourney,
                          label: context.tr(AppStrings.navJourney),
                          selected: tab == LayoutTab.journey,
                          onTap: () => onSelect(LayoutTab.journey),
                        ),
                        NavItem(
                          icon: AppIcons.navProfile,
                          label: context.tr(AppStrings.navProfile),
                          selected: tab == LayoutTab.profile,
                          onTap: () => onSelect(LayoutTab.profile),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Semantics(
              button: true,
              label: context.tr(AppStrings.navPlay),
              child: PressScale(onTap: onPlay, child: BrandLogo.nav()),
            ),
          ),
        ],
      ),
    );
  }
}
