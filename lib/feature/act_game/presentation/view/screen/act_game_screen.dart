import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/core/widgets/friends_app/game_layer.dart';
import 'package:fii90/core/widgets/friends_app/player_score_chip.dart';
import 'package:fii90/core/widgets/friends_app/turn_banner.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/act_game/presentation/view/widgets/act_acting_view.dart';
import 'package:fii90/feature/act_game/presentation/view/widgets/act_deck_grid.dart';
import 'package:fii90/feature/act_game/presentation/view/widgets/act_peek_view.dart';
import 'package:fii90/feature/act_game/presentation/view_model/act_game_cubit.dart';
import 'package:fii90/feature/act_game/presentation/view_model/act_game_state.dart';
import 'package:fii90/feature/game_end/presentation/view/screen/game_end_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActGameScreen extends StatelessWidget {
  const ActGameScreen({super.key, required this.names, required this.members});

  final List<String> names;
  final List<List<String>> members;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ActGameCubit(names: names, members: members),
      child: BlocConsumer<ActGameCubit, ActGameState>(
        listener: (context, state) {
          final cubit = context.read<ActGameCubit>();
          final n = state.notice;
          if (n != null) {
            final name = n.card.name.of(context);
            AppToast.show(
              context,
              n.ok
                  ? ToastMessage(
                      AppStrings.actPointsToast,
                      args: ['${n.card.level}', names[n.team], name],
                    )
                  : ToastMessage(
                      n.timeout
                          ? AppStrings.actTimeoutToast
                          : AppStrings.actWasToast,
                      kind: ToastKind.info,
                      args: [name],
                    ),
            );
          }
          if (!state.finished) return;
          Nav.replace(
            context,
            GameEndScreen(
              gameTitle: context.tr(AppStrings.gameActTitle),
              names: names,
              scores: state.scores,
              unit: context.tr(AppStrings.pointsUnit),
              subtitle: context.tr(
                AppStrings.actEndSub,
                args: ['${cubit.guessed}'],
              ),
              again: ActGameScreen(names: names, members: members),
            ),
          );
        },
        builder: (context, state) {
          final cubit = context.read<ActGameCubit>();
          final card = cubit.picked?.card;
          final level = card == null ? '' : context.tr(card.levelKey);
          return GameLayer(
            title: context.tr(AppStrings.gameActTitle),
            subtitle: context.tr(
              AppStrings.cardsLeft,
              args: ['${cubit.cardsLeft}'],
            ),
            children: [
              Row(
                spacing: 8,
                children: [
                  for (final (i, n) in names.indexed)
                    Expanded(
                      child: PlayerScoreChip(
                        name: n,
                        value: state.scores[i],
                        caption: context.tr(AppStrings.pointsUnit),
                        palette: AppColors.player(i),
                        active: state.turn == i,
                      ),
                    ),
                ],
              ),
              if (state.step == ActStep.pick) ...[
                TurnBanner(
                  color: AppColors.player(state.turn).fill,
                  title: context.tr(
                    AppStrings.turnOf,
                    args: [names[state.turn]],
                  ),
                  subtitle: context.tr(
                    AppStrings.actorPicks,
                    args: [cubit.actorName],
                  ),
                ),
                ActDeckGrid(
                  deck: state.deck,
                  shuffles: state.shuffles,
                  onPick: cubit.pick,
                ),
                PressScale(
                  onTap: cubit.shuffle,
                  child: Container(
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.s1,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: AppColors.line2),
                    ),
                    child: Text(
                      context.tr(AppStrings.shuffleCards),
                      style: AppText.ghostButton,
                    ),
                  ),
                ),
                Text(
                  context.tr(AppStrings.cardsFaceDown),
                  textAlign: TextAlign.center,
                  style: AppText.bidHint,
                ),
              ],
              if (state.step == ActStep.peek && card != null)
                ActPeekView(
                  actor: cubit.actorName,
                  team: names[state.turn],
                  shown: state.shown,
                  name: card.name.of(context),
                  levelLabel: level,
                  levelColor: AppColors.level(card.level),
                  points: card.level,
                  onReveal: cubit.reveal,
                  onStart: cubit.startActing,
                ),
              if (state.step == ActStep.act && card != null)
                ActActingView(
                  seconds: state.seconds,
                  total: ActGameCubit.actSeconds,
                  actor: cubit.actorName,
                  team: names[state.turn],
                  levelLabel: level,
                  points: card.level,
                  onJudge: cubit.judge,
                ),
            ],
          );
        },
      ),
    );
  }
}
