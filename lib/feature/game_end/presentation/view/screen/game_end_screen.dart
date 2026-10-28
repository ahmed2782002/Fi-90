import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/core/widgets/friends_app/game_layer.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/feature/game_end/presentation/view/widgets/end_score_tile.dart';
import 'package:fii90/feature/game_end/presentation/view_model/game_end_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameEndScreen extends StatelessWidget {
  const GameEndScreen({
    super.key,
    required this.gameTitle,
    required this.names,
    required this.scores,
    required this.unit,
    required this.subtitle,
    required this.again,
    this.extra,
  });

  final String gameTitle;
  final List<String> names;
  final List<int> scores;
  final String unit;
  final String subtitle;
  final Widget again;
  final Widget? extra;

  @override
  Widget build(BuildContext context) {
    final more = extra;
    return BlocProvider(
      create: (_) => GameEndCubit(scores: scores),
      child: BlocConsumer<GameEndCubit, ({bool saved, ToastMessage? toast})>(
        listener: (context, state) {
          final toast = state.toast;
          if (toast != null) AppToast.show(context, toast);
        },
        builder: (context, state) {
          final w = context.read<GameEndCubit>().winner;
          return GameLayer(
            title: gameTitle,
            subtitle: context.tr(AppStrings.theResult),
            children: [
              Enter(
                fx: Fx.fadeUp,
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      w < 0
                          ? context.tr(AppStrings.itsADraw)
                          : context.tr(AppStrings.nameWon, args: [names[w]]),
                      textAlign: TextAlign.center,
                      style: AppText.display(32),
                    ),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: AppText.detailLine,
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 8,
                children: [
                  for (final (i, n) in names.indexed)
                    Expanded(
                      child: EndScoreTile(
                        name: n,
                        value: scores[i],
                        unit: unit,
                        ink: AppColors.player(i).ink,
                        winner: i == w,
                        winnerLabel: context.tr(AppStrings.theWinner),
                      ),
                    ),
                ],
              ),
              ?more,
              PrimaryButton(
                label: context.tr(AppStrings.playAgain),
                onTap: () => Nav.replace(context, again),
                height: 56,
              ),
              PressScale(
                onTap: context.read<GameEndCubit>().save,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.s1,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.line2),
                  ),
                  child: Text(
                    context.tr(
                      state.saved
                          ? AppStrings.savedInJourney
                          : AppStrings.saveToJourney,
                    ),
                    style: AppText.ghostButton,
                  ),
                ),
              ),
              PressScale(
                onTap: () => Navigator.of(context).pop(),
                child: SizedBox(
                  height: 44,
                  child: Center(
                    child: Text(
                      context.tr(AppStrings.otherGames),
                      style: AppText.skip,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
