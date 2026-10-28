import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/friends_app/game_layer.dart';
import 'package:fii90/core/widgets/pill_segment.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/feature/act_game/presentation/view/screen/act_game_screen.dart';
import 'package:fii90/feature/bank_game/presentation/view/screen/bank_game_screen.dart';
import 'package:fii90/feature/friends/mock_model/friend_game.dart';
import 'package:fii90/feature/game_setup/presentation/view/widgets/game_hero.dart';
import 'package:fii90/feature/game_setup/presentation/view/widgets/rules_card.dart';
import 'package:fii90/feature/game_setup/presentation/view/widgets/spy_players_card.dart';
import 'package:fii90/feature/game_setup/presentation/view/widgets/team_slots_section.dart';
import 'package:fii90/feature/game_setup/presentation/view_model/game_setup_cubit.dart';
import 'package:fii90/feature/game_setup/presentation/view_model/game_setup_state.dart';
import 'package:fii90/feature/photo_game/presentation/view/screen/photo_game_screen.dart';
import 'package:fii90/feature/spy_game/presentation/view/screen/spy_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameSetupScreen extends StatelessWidget {
  const GameSetupScreen({super.key, required this.game});

  final FriendGame game;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameSetupCubit(game),
      child: BlocConsumer<GameSetupCubit, GameSetupState>(
        listener: (context, state) {
          final toast = state.toast;
          if (toast != null) AppToast.show(context, toast);
          if (!state.launch) return;
          final cubit = context.read<GameSetupCubit>();
          final members = cubit.members;
          final names = [
            for (final t in members) t.join(context.tr(AppStrings.nameJoiner)),
          ];
          Nav.replace(context, switch (game.kind) {
            FriendGameKind.photo => PhotoGameScreen(
              names: names,
              members: members,
            ),
            FriendGameKind.act => ActGameScreen(names: names, members: members),
            FriendGameKind.bank => BankGameScreen(
              names: names,
              members: members,
            ),
            FriendGameKind.spy => SpyGameScreen(players: state.players),
          });
        },
        builder: (context, state) {
          final cubit = context.read<GameSetupCubit>();
          return GameLayer(
            title: context.tr(game.titleKey),
            subtitle: context.tr(AppStrings.setupSubtitle),
            children: [
              GameHero(
                image: game.image,
                hero: game.hero,
                title: context.tr(game.titleKey),
                length: context.tr(game.lengthKey),
                ratio: game.heroRatio,
                zoom: game.zoom,
              ),
              RulesCard(
                title: context.tr(AppStrings.theRules),
                rules: [for (final r in game.ruleKeys) context.tr(r)],
                accent: game.accent,
                ink: game.ink,
              ),
              if (cubit.hasModeToggle)
                PillSegment(
                  labels: [
                    context.tr(AppStrings.playerVsPlayer),
                    context.tr(AppStrings.twoVsTwo),
                  ],
                  index: state.pairs ? 1 : 0,
                  onSelect: cubit.selectMode,
                  style: AppText.segment,
                  activeGradient: AppColors.grad,
                  activeShadow: AppShadows.segment,
                  height: 42,
                  padding: 4,
                  expand: true,
                ),
              if (cubit.isSpy)
                SpyPlayersCard(
                  players: state.players,
                  draft: cubit.draft,
                  onAdd: cubit.addPlayer,
                  onRemove: cubit.removePlayer,
                )
              else
                TeamSlotsSection(slots: cubit.slots, pairs: state.pairs),
              Text(
                context.tr(cubit.hintKey),
                textAlign: TextAlign.center,
                style: AppText.cardCaption,
              ),
              Opacity(
                opacity: cubit.canStart ? 1 : .5,
                child: PrimaryButton(
                  label: context.tr(AppStrings.letsStart),
                  onTap: cubit.start,
                  height: 56,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
