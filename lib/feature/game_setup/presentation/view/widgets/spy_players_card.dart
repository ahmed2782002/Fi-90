import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_text_field.dart';
import 'package:fii90/core/widgets/friends_app/initial_badge.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SpyPlayersCard extends StatelessWidget {
  const SpyPlayersCard({
    super.key,
    required this.players,
    required this.draft,
    required this.onAdd,
    required this.onRemove,
  });

  final List<String> players;
  final TextEditingController draft;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.s1,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.line),
        boxShadow: AppShadows.sh1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.tr(AppStrings.thePlayers), style: AppText.teamLabel),
              Text(
                context.tr(AppStrings.minThree, args: ['${players.length}']),
                style: AppText.cardCaption,
              ),
            ],
          ),
          for (final (i, name) in players.indexed)
            Container(
              height: 48,
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 6, 0),
              decoration: BoxDecoration(
                color: AppColors.s2,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                spacing: 10,
                children: [
                  InitialBadge(
                    name: name,
                    palette: AppColors.player(i),
                    size: 32,
                  ),
                  Expanded(child: Text(name, style: AppText.rowTitle)),
                  Semantics(
                    button: true,
                    label: context.tr(AppStrings.remove),
                    child: PressScale(
                      onTap: () => onRemove(i),
                      child: SizedBox(
                        width: 34,
                        height: 34,
                        child: Center(
                          child: Text('×', style: AppText.removeMark),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: AppTextField(
                  controller: draft,
                  hint: context.tr(AppStrings.playerNameHint),
                  height: 48,
                  fontSize: 14,
                  onSubmitted: onAdd,
                ),
              ),
              PrimaryButton(
                label: context.tr(AppStrings.addPlayer),
                onTap: onAdd,
                height: 48,
                expand: false,
                style: AppText.roomShare,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
