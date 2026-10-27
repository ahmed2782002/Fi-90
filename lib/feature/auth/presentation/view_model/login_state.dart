enum LoginStatus { idle, terms, privacy, google, apple }

class LoginState {
  const LoginState({this.status = LoginStatus.idle});

  final LoginStatus status;

  String? get message => switch (status) {
        LoginStatus.idle => null,
        LoginStatus.terms => 'الشروط والأحكام متاحة من «حسابي» بعد الدخول',
        LoginStatus.privacy => 'سياسة الخصوصية متاحة من «حسابي» بعد الدخول',
        LoginStatus.google => 'تسجيل الدخول بـ Google لسه مش متوصل',
        LoginStatus.apple => 'تسجيل الدخول بـ Apple لسه مش متوصل',
      };
}
