import 'package:fii90/core/widgets/app_toast/toast_message.dart';

class FriendshipState {
  const FriendshipState({
    this.handled = const {},
    this.sent = const [],
    this.toast,
  });

  final Set<String> handled;
  final List<String> sent;
  final ToastMessage? toast;

  FriendshipState copyWith({
    Set<String>? handled,
    List<String>? sent,
    ToastMessage? toast,
  }) => FriendshipState(
    handled: handled ?? this.handled,
    sent: sent ?? this.sent,
    toast: toast,
  );
}
