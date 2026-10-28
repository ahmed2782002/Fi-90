import 'package:fii90/core/widgets/app_toast/toast_message.dart';

enum RoomTab { create, join }

class PrivateRoomState {
  const PrivateRoomState({
    this.tab = RoomTab.create,
    this.lobby = true,
    this.host = true,
    this.friend = false,
    this.friendReady = false,
    this.meReady = false,
    this.invalid = false,
    this.started = false,
    this.toast,
  });

  final RoomTab tab;
  final bool lobby;
  final bool host;
  final bool friend;
  final bool friendReady;
  final bool meReady;
  final bool invalid;
  final bool started;
  final ToastMessage? toast;

  PrivateRoomState copyWith({
    RoomTab? tab,
    bool? lobby,
    bool? host,
    bool? friend,
    bool? friendReady,
    bool? meReady,
    bool? invalid,
    bool? started,
    ToastMessage? toast,
  }) => PrivateRoomState(
    tab: tab ?? this.tab,
    lobby: lobby ?? this.lobby,
    host: host ?? this.host,
    friend: friend ?? this.friend,
    friendReady: friendReady ?? this.friendReady,
    meReady: meReady ?? this.meReady,
    invalid: invalid ?? this.invalid,
    started: started ?? this.started,
    toast: toast,
  );
}
