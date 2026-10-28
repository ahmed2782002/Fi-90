import 'package:fii90/core/widgets/app_toast/toast_message.dart';

enum EditProfileStatus { editing, saved }

class EditProfileState {
  const EditProfileState({this.status = EditProfileStatus.editing, this.toast});

  final EditProfileStatus status;
  final ToastMessage? toast;
}
