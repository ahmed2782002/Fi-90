import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/friends_app/game_layer.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/feature/game_end/presentation/view/screen/game_end_screen.dart';
import 'package:fii90/feature/spy_game/presentation/view/widgets/spy_clue_panel.dart';
import 'package:fii90/feature/spy_game/presentation/view/widgets/spy_decide_view.dart';
import 'package:fii90/feature/spy_game/presentation/view/widgets/spy_flip_card.dart';
import 'package:fii90/feature/spy_game/presentation/view/widgets/spy_pass_view.dart';
import 'package:fii90/feature/spy_game/presentation/view/widgets/spy_reveal_view.dart';
import 'package:fii90/feature/spy_game/presentation/view/widgets/spy_vote_view.dart';
import 'package:fii90/feature/spy_game/presentation/view/widgets/spy_words_list.dart';
import 'package:fii90/feature/spy_game/presentation/view_model/spy_game_cubit.dart';
import 'package:fii90/feature/spy_game/presentation/view_model/spy_game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpyGameScreen extends StatelessWidget {
  const SpyGameScreen({super.key, required this.players});

  final List<String> players;

  static final subtitleKeys = {
    SpyStep.pass: AppStrings.dealCards,
    SpyStep.flip: AppStrings.dealCards,
    SpyStep.clue: AppStrings.describing,
    SpyStep.decide: AppStrings.voteOrContinue,
    SpyStep.vote: AppStrings.voting,
    SpyStep.reveal: AppStrings.theReveal,
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpyGameCubit(players: players),
      child: BlocConsumer<SpyGameCubit, SpyGameState>(
        listener: (context, state) {
          final cubit = context.read<SpyGameCubit>();
          final toast = state.toast;
          if (toast != null) AppToast.show(context, toast);
          if (!state.finished) return;
          Nav.replace(
            context,
            GameEndScreen(
              gameTitle: context.tr(AppStrings.gameSpyTitle),
              names: players,
              scores: state.points,
              unit: context.tr(AppStrings.pointUnit),
              subtitle: context.tr(
                AppStrings.spyEndSub,
                args: [players[cubit.spy], cubit.secret.name.of(context)],
              ),
              again: SpyGameScreen(players: players),
            ),
          );
        },
        builder: (context, state) {
          final cubit = context.read<SpyGameCubit>();
          final name = players[state.index];
          final words = SpyWordsList(
            players: players,
            words: cubit.words,
            title: context.tr(AppStrings.wordsSoFar),
          );
          return GameLayer(
            title: context.tr(AppStrings.gameSpyTitle),
            subtitle: context.tr(subtitleKeys[state.step]!),
            children: switch (state.step) {
              SpyStep.pass => [
                SpyPassView(
                  name: name,
                  palette: AppColors.player(state.index),
                  number: state.index + 1,
                  total: players.length,
                  onReady: cubit.ready,
                ),
              ],
              SpyStep.flip => [
                Text(
                  '$name · ${context.tr(!state.flipped
                      ? AppStrings.tapTheCard
                      : cubit.isSpyTurn
                      ? AppStrings.youAreSpy
                      : AppStrings.memorizePlayer)}',
                  textAlign: TextAlign.center,
                  style: AppText.cardCaption,
                ),
                Center(
                  child: SpyFlipCard(
                    flipped: state.flipped,
                    isSpy: cubit.isSpyTurn,
                    secret: cubit.secret.name.of(context),
                    onFlip: cubit.flip,
                  ),
                ),
                PrimaryButton(
                  label: !state.flipped
                      ? context.tr(AppStrings.flipCard)
                      : cubit.isLast
                      ? context.tr(AppStrings.hideStartDescribing)
                      : context.tr(
                          AppStrings.hideAndPass,
                          args: [players[state.index + 1]],
                        ),
                  onTap: state.flipped ? cubit.passOn : cubit.flip,
                  height: 56,
                ),
              ],
              SpyStep.clue => [
                SpyCluePanel(
                  round: state.round,
                  name: name,
                  palette: AppColors.player(state.index),
                  draft: cubit.draft,
                  onSay: cubit.say,
                ),
                SpyWordsList(players: players, words: cubit.words),
              ],
              SpyStep.decide => [
                SpyDecideView(
                  round: state.round,
                  onVote: cubit.startVote,
                  onMore: cubit.anotherRound,
                ),
                words,
              ],
              SpyStep.vote => [
                SpyVoteView(
                  players: players,
                  voter: state.index,
                  suspects: cubit.suspects,
                  selected: state.selected,
                  onSelect: cubit.select,
                  onConfirm: cubit.vote,
                ),
                SpyWordsList(
                  players: players,
                  words: cubit.words,
                  title: context.tr(AppStrings.wordsSaid),
                ),
              ],
              SpyStep.reveal => [
                SpyRevealView(
                  players: players,
                  spy: cubit.spy,
                  caught: cubit.caught,
                  tally: cubit.tally,
                  options: [for (final o in cubit.options) o.name.of(context)],
                  secret: cubit.secret.name.of(context),
                  guess: state.guess,
                  onGuess: cubit.guessPlayer,
                  onFinish: cubit.finish,
                ),
              ],
            },
          );
        },
      ),
    );
  }
}
