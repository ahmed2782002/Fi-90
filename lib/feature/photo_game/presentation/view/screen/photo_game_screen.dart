import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/core/widgets/friends_app/game_layer.dart';
import 'package:fii90/core/widgets/friends_app/player_score_chip.dart';
import 'package:fii90/core/widgets/friends_app/turn_banner.dart';
import 'package:fii90/core/widgets/match_app/answer_input.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/feature/game_end/presentation/view/screen/game_end_screen.dart';
import 'package:fii90/feature/photo_game/mock_model/lineup_player.dart';
import 'package:fii90/feature/photo_game/presentation/view/widgets/photo_board.dart';
import 'package:fii90/feature/photo_game/presentation/view_model/photo_game_cubit.dart';
import 'package:fii90/feature/photo_game/presentation/view_model/photo_game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoGameScreen extends StatelessWidget {
  const PhotoGameScreen({
    super.key,
    required this.names,
    required this.members,
  });

  final List<String> names;
  final List<List<String>> members;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhotoGameCubit(names: names, members: members),
      child: BlocConsumer<PhotoGameCubit, PhotoGameState>(
        listener: (context, state) {
          final cubit = context.read<PhotoGameCubit>();
          final toast = state.toast, duplicate = state.duplicate;
          if (toast != null) AppToast.show(context, toast);
          if (duplicate != null) {
            final short = LineupPlayer.byKey(duplicate).short.of(context);
            AppToast.show(
              context,
              ToastMessage(
                AppStrings.alreadySaid,
                kind: ToastKind.warn,
                args: [short],
              ),
            );
          }
          if (!state.finished) return;
          Nav.replace(
            context,
            GameEndScreen(
              gameTitle: context.tr(AppStrings.gamePhotoTitle),
              names: names,
              scores: cubit.scores,
              unit: context.tr(AppStrings.playersKnown),
              subtitle: context.tr(
                AppStrings.photoEndSub,
                args: ['${state.found.length}'],
              ),
              again: PhotoGameScreen(names: names, members: members),
              extra: PhotoBoard(spots: cubit.spots, reveal: true),
            ),
          );
        },
        builder: (context, state) {
          final cubit = context.read<PhotoGameCubit>();
          final fb = state.feedback;
          final turnColor = AppColors.player(state.turn).fill;
          return GameLayer(
            title: context.tr(AppStrings.gamePhotoTitle),
            subtitle: LineupPlayer.caption.of(context),
            children: [
              Row(
                spacing: 8,
                children: [
                  for (final (i, n) in names.indexed)
                    Expanded(
                      child: PlayerScoreChip(
                        name: n,
                        value: cubit.foundBy(i),
                        caption: context.tr(
                          cubit.isOut(i)
                              ? AppStrings.isOut
                              : AppStrings.rightNames,
                        ),
                        palette: AppColors.player(i),
                        active: state.turn == i && !cubit.isOut(i),
                        out: cubit.isOut(i),
                        dots: [
                          for (var q = 0; q < PhotoGameCubit.maxStrikes; q++)
                            q < state.strikes[i],
                        ],
                      ),
                    ),
                ],
              ),
              PhotoBoard(spots: cubit.spots),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      LineupPlayer.caption.of(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.chipName,
                    ),
                  ),
                  Text(
                    '${state.found.length} / ${LineupPlayer.mock.length}',
                    textDirection: TextDirection.ltr,
                    style: AppText.roomCopy,
                  ),
                ],
              ),
              TurnBanner(
                color: turnColor,
                title: context.tr(AppStrings.photoTurn, args: [cubit.turnName]),
              ),
              AnswerInput(
                controller: cubit.input,
                hint: context.tr(AppStrings.typePlayerName),
                sendLabel: context.tr(AppStrings.confirm),
                onSend: cubit.submit,
                height: 54,
              ),
              PressScale(
                onTap: cubit.skip,
                child: Container(
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.s1,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.line2),
                  ),
                  child: Text(
                    context.tr(AppStrings.dontKnowStrike),
                    style: AppText.ghostButton,
                  ),
                ),
              ),
              if (fb != null)
                Text(
                  fb.ok
                      ? context.tr(
                          AppStrings.photoRight,
                          args: [
                            LineupPlayer.byKey(fb.playerKey!).name.of(context),
                            fb.who,
                          ],
                        )
                      : context.tr(
                              fb.skipped
                                  ? AppStrings.photoSkipped
                                  : AppStrings.photoWrong,
                              args: [fb.who, '${fb.strikes}'],
                            ) +
                            (fb.strikes >= PhotoGameCubit.maxStrikes
                                ? context.tr(AppStrings.outSuffix)
                                : ''),
                  textAlign: TextAlign.center,
                  style: AppText.feedbackNote(
                    fb.ok ? AppColors.okInk : AppColors.badInk,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
