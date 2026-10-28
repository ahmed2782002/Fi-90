import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_shadows.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/pill_segment.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/feature/match/mock_model/match_mode.dart';
import 'package:fii90/feature/match/presentation/view/screen/match_screen.dart';
import 'package:fii90/feature/private_room/presentation/view/widgets/invalid_room_overlay.dart';
import 'package:fii90/feature/private_room/presentation/view/widgets/room_code_card.dart';
import 'package:fii90/feature/private_room/presentation/view/widgets/room_join_form.dart';
import 'package:fii90/feature/private_room/presentation/view/widgets/room_lobby.dart';
import 'package:fii90/feature/private_room/presentation/view_model/private_room_cubit.dart';
import 'package:fii90/feature/private_room/presentation/view_model/private_room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivateRoomScreen extends StatelessWidget {
  const PrivateRoomScreen({super.key, required this.modes});

  final List<MatchMode> modes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrivateRoomCubit(),
      child: BlocConsumer<PrivateRoomCubit, PrivateRoomState>(
        listener: (context, state) {
          final toast = state.toast;
          if (toast != null) AppToast.show(context, toast);
          if (state.started) {
            Nav.replace(context, MatchScreen(modes: modes, fromRoom: true));
          }
        },
        builder: (context, state) {
          final cubit = context.read<PrivateRoomCubit>();
          return Stack(
            children: [
              SubPage(
                title: context.tr(AppStrings.privateRoom),
                gap: 16,
                children: [
                  PillSegment(
                    labels: [
                      context.tr(AppStrings.createRoom),
                      context.tr(AppStrings.joinByCode),
                    ],
                    index: state.tab.index,
                    onSelect: cubit.selectTab,
                    style: AppText.segment,
                    activeGradient: AppColors.grad,
                    activeShadow: AppShadows.segment,
                    height: 44,
                    padding: 4,
                    expand: true,
                  ),
                  if (!state.lobby)
                    RoomJoinForm(controller: cubit.input, onJoin: cubit.join),
                  if (state.lobby && state.host)
                    RoomCodeCard(
                      code: PrivateRoomCubit.code,
                      link: PrivateRoomCubit.link,
                      onCopy: cubit.copyLink,
                      onWhatsapp: cubit.shareWhatsapp,
                      onShare: cubit.shareLink,
                    ),
                  if (state.lobby) const RoomLobby(),
                ],
              ),
              if (state.invalid)
                Positioned.fill(
                  child: InvalidRoomOverlay(onRetry: cubit.dismissInvalid),
                ),
            ],
          );
        },
      ),
    );
  }
}
