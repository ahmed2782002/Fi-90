import 'package:fii90/core/widgets/app_toast/toast_message.dart';

class NotificationsState {
  const NotificationsState({
    this.read = const {},
    this.gone = const {},
    this.startMatch = false,
    this.toast,
  });

  final Set<int> read;
  final Set<int> gone;
  final bool startMatch;
  final ToastMessage? toast;

  NotificationsState copyWith({
    Set<int>? read,
    Set<int>? gone,
    bool startMatch = false,
    ToastMessage? toast,
  }) => NotificationsState(
    read: read ?? this.read,
    gone: gone ?? this.gone,
    startMatch: startMatch,
    toast: toast,
  );
}
