import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class ClubSlot extends StatelessWidget {
  const ClubSlot({
    super.key,
    required this.number,
    required this.shown,
    required this.current,
    this.name = '',
    this.year = '',
    this.abbr = '',
    this.color = 0,
  });

  final int number;
  final bool shown;
  final bool current;
  final String name;
  final String year;
  final String abbr;
  final int color;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 40, maxHeight: 52),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            start: -24,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.m4, width: 2.5),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 550),
              child: shown
                  ? Container(
                      key: const ValueKey(true),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColors.s1,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: current ? AppColors.m4 : AppColors.line,
                          width: 1.5,
                        ),
                        boxShadow: current
                            ? [
                                BoxShadow(
                                  color: AppColors.tint(AppColors.m4, .15),
                                  spreadRadius: 4,
                                ),
                              ]
                            : null,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(color),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.tint(AppColors.black, .55),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(abbr, style: AppText.clubAbbr),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(child: Text(name, style: AppText.clubName)),
                          Text(year, style: AppText.clubYear),
                        ],
                      ),
                    )
                  : Container(
                      key: const ValueKey(false),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.line2, width: 1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.tr(
                              AppStrings.clubNumber,
                              args: ['$number'],
                            ),
                            style: AppText.hiddenClub,
                          ),
                          Text('؟', style: AppText.hiddenMark),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
