import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/utils/scheduler.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/private_room/presentation/view_model/private_room_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivateRoomCubit extends Cubit<PrivateRoomState> {
  PrivateRoomCubit() : super(const PrivateRoomState()) {
    input.addListener(_normalize);
    _hostLobby();
  }

  static const code = '7K4Q';
  static const link = 'plus90.app/r/$code';

  final input = TextEditingController();
  final _scheduler = Scheduler();

  bool get canStart =>
      state.lobby && state.friend && state.friendReady && state.meReady;

  void selectTab(int index) {
    _scheduler.clearTimers();
    input.clear();
    final tab = RoomTab.values[index];
    if (tab == RoomTab.create) return _hostLobby();
    emit(const PrivateRoomState(tab: RoomTab.join, lobby: false, host: false));
  }

  void _hostLobby() {
    emit(const PrivateRoomState());
    _scheduler.after(3000, () => emit(state.copyWith(friend: true)));
    _scheduler.after(5000, () => emit(state.copyWith(friendReady: true)));
  }

  void _normalize() {
    final value = input.text;
    final clean = value.toUpperCase().replaceAll(RegExp('[^A-Z0-9]'), '');
    final cut = clean.length > 4 ? clean.substring(0, 4) : clean;
    if (cut == value) return;
    input.value = TextEditingValue(
      text: cut,
      selection: TextSelection.collapsed(offset: cut.length),
    );
  }

  void join() {
    if (input.text.length < 4) {
      emit(
        state.copyWith(
          toast: const ToastMessage(
            AppStrings.codeFourChars,
            kind: ToastKind.warn,
          ),
        ),
      );
      return;
    }
    input.text == code
        ? emit(state.copyWith(lobby: true, friend: true, friendReady: true))
        : emit(state.copyWith(invalid: true));
  }

  void dismissInvalid() => emit(state.copyWith(invalid: false));

  void toggleReady() => emit(state.copyWith(meReady: !state.meReady));

  void copyLink() =>
      emit(state.copyWith(toast: const ToastMessage(AppStrings.linkCopied)));

  void shareWhatsapp() => emit(
    state.copyWith(
      toast: const ToastMessage(
        AppStrings.openingWhatsapp,
        kind: ToastKind.info,
      ),
    ),
  );

  void shareLink() => emit(
    state.copyWith(toast: const ToastMessage(AppStrings.roomLinkCopied)),
  );

  void start() {
    if (canStart) emit(state.copyWith(started: true));
  }

  @override
  Future<void> close() {
    _scheduler.cancel();
    input.dispose();
    return super.close();
  }
}
