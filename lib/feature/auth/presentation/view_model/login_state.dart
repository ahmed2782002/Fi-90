enum LoginStatus { idle, terms, privacy, signedIn }

class LoginState {
  const LoginState({this.status = LoginStatus.idle});

  final LoginStatus status;

  bool get isSignedIn => status == LoginStatus.signedIn;
}
