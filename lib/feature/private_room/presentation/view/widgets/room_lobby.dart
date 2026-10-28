import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/match_app/spin_ring.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/feature/private_room/presentation/view/widgets/room_player_tile.dart';
import 'package:fii90/feature/private_room/presentation/view_model/private_room_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomLobby extends StatelessWidget {
  const RoomLobby({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PrivateRoomCubit>();
    final state = cubit.state;
    final me = context.tr(AppStrings.mockPlayerAhmed);
    final friend = context.tr(AppStrings.mockPlayerOmar);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Text(context.tr(AppStrings.players), style: AppText.pageIntro),
        RoomPlayerTile(
          initial: me.characters.first,
          name: context.tr(AppStrings.meYou, args: [me]),
          level: 'LV 24',
          fill: AppColors.me,
          onFill: AppColors.meOn,
          ready: state.meReady,
        ),
        if (state.friend)
          RoomPlayerTile(
            initial: friend.characters.first,
            name: friend,
            level: 'LV 22',
            fill: AppColors.op,
            onFill: AppColors.opOn,
            ready: state.friendReady,
          )
        else
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.line2, width: 1.5),
            ),
            child: Row(
              children: [
                SpinRing(size: 46, color: AppColors.op, width: 3),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    context.tr(AppStrings.waitingFriend),
                    style: AppText.pageIntro,
                  ),
                ),
              ],
            ),
          ),
        PressScale(
          onTap: cubit.toggleReady,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 54,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: state.meReady
                  ? AppColors.s2
                  : AppColors.tint(AppColors.ok, .15),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: state.meReady ? AppColors.line2 : AppColors.ok,
                width: 1.5,
              ),
            ),
            child: Text(
              context.tr(
                state.meReady ? AppStrings.cancelReady : AppStrings.imReady,
              ),
              style: AppText.optionTitle,
            ),
          ),
        ),
        if (cubit.canStart)
          PrimaryButton(
            label: context.tr(AppStrings.startTheMatch),
            onTap: cubit.start,
          )
        else
          Text(
            context.tr(AppStrings.bothMustReady),
            textAlign: TextAlign.center,
            style: AppText.boardHint,
          ),
      ],
    );
  }
}
