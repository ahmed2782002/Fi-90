import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/feature/layout/presentation/view/widgets/play_sheet/ai_level_picker.dart';
import 'package:fii90/feature/layout/presentation/view/widgets/play_sheet/play_option.dart';
import 'package:fii90/feature/layout/presentation/view/widgets/play_sheet/play_sheet_header.dart';
import 'package:fii90/feature/layout/presentation/view_model/play_sheet_cubit.dart';
import 'package:fii90/feature/layout/presentation/view_model/play_sheet_state.dart';
import 'package:fii90/feature/match/presentation/view/screen/match_screen.dart';
import 'package:fii90/feature/private_room/presentation/view/screen/private_room_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaySheet extends StatelessWidget {
  const PlaySheet({super.key, this.modeKey});

  final String? modeKey;

  static Future<void> show(BuildContext context, {String? modeKey}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AppColors.transparent,
      barrierColor: AppColors.scrim,
      builder: (_) => PlaySheet(modeKey: modeKey),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mode = modeKey;
    return BlocProvider(
      create: (_) => PlaySheetCubit(modeKey: mode),
      child: BlocBuilder<PlaySheetCubit, PlaySheetState>(
        builder: (context, state) {
          final cubit = context.read<PlaySheetCubit>();
          return Container(
            padding: EdgeInsets.fromLTRB(
              16,
              12,
              16,
              30 + MediaQuery.paddingOf(context).bottom,
            ),
            decoration: BoxDecoration(
              color: AppColors.s1,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(34),
              ),
              border: Border(top: BorderSide(color: AppColors.line2)),
              boxShadow: AppShadows.sh2,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 12,
              children: [
                PlaySheetHeader(
                  subtitle: mode == null
                      ? context.tr(AppStrings.fullMatchMode)
                      : context.tr(
                          AppStrings.singleChallengeMode,
                          args: [context.tr(mode)],
                        ),
                  onClose: () => Navigator.of(context).pop(),
                ),
                PlayOption(
                  icon: AppIcons.globe,
                  tint: AppColors.cy,
                  ink: AppColors.priInk,
                  title: context.tr(AppStrings.onlineOpponent),
                  subtitle: context.tr(AppStrings.onlineOpponentHint),
                  onTap: () =>
                      Nav.popAndPush(context, MatchScreen(modes: cubit.modes)),
                ),
                PlayOption(
                  icon: AppIcons.inviteFriend,
                  tint: AppColors.op,
                  ink: AppColors.opInk,
                  tintAlpha: .18,
                  title: context.tr(AppStrings.bringFriend),
                  subtitle: context.tr(AppStrings.bringFriendHint),
                  onTap: () => Nav.popAndPush(
                    context,
                    PrivateRoomScreen(modes: cubit.modes),
                  ),
                ),
                PlayOption(
                  icon: AppIcons.robot,
                  tint: AppColors.gold,
                  ink: AppColors.gold,
                  iconSize: 34,
                  keepIconColors: true,
                  selected: state.aiOpen,
                  title: context.tr(AppStrings.playAi),
                  subtitle: context.tr(AppStrings.playAiHint),
                  onTap: cubit.toggleAi,
                ),
                if (state.aiOpen)
                  AiLevelPicker(
                    level: state.level,
                    onSelect: cubit.selectLevel,
                    onStart: () => Nav.popAndPush(
                      context,
                      MatchScreen(
                        modes: cubit.modes,
                        vsAi: true,
                        aiLevel: state.level,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
