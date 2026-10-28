import 'package:fii90/core/localization/app_strings.dart';

enum LoginStatus { idle, terms, privacy, signedIn }

class LoginState {
  const LoginState({this.status = LoginStatus.idle});

  final LoginStatus status;

  bool get isSignedIn => status == LoginStatus.signedIn;

  String? get message => switch (status) {
    LoginStatus.terms => AppStrings.loginTermsSoon,
    LoginStatus.privacy => AppStrings.loginPrivacySoon,
    LoginStatus.idle || LoginStatus.signedIn => null,
  };
}
