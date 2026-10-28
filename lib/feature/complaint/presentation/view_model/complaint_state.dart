import 'package:fii90/core/widgets/app_toast/toast_message.dart';

class ComplaintState {
  const ComplaintState({this.type = 0, this.sent = false, this.toast});

  final int type;
  final bool sent;
  final ToastMessage? toast;
}
