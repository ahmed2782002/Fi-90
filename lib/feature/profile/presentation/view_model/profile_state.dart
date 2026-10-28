import 'package:fii90/core/widgets/app_toast/toast_message.dart';

class ProfileState {
  const ProfileState({this.notifications = true, this.name, this.toast});

  final bool notifications;
  final String? name;
  final ToastMessage? toast;

  ProfileState copyWith({
    bool? notifications,
    String? name,
    ToastMessage? toast,
  }) => ProfileState(
    notifications: notifications ?? this.notifications,
    name: name ?? this.name,
    toast: toast,
  );
}
