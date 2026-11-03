import 'package:fii90/feature/auth/presentation/view_model/login_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  late final termsRecognizer = TapGestureRecognizer()..onTap = openTerms;
  late final privacyRecognizer = TapGestureRecognizer()..onTap = openPrivacy;

  void openTerms() => emit(const LoginState(status: LoginStatus.terms));

  void openPrivacy() => emit(const LoginState(status: LoginStatus.privacy));

  // Back to idle once the page is pushed, so tapping the same link again
  // emits a new state.
  void reset() => emit(const LoginState());

  void signInWithGoogle() =>
      emit(const LoginState(status: LoginStatus.signedIn));

  void signInWithApple() =>
      emit(const LoginState(status: LoginStatus.signedIn));

  @override
  Future<void> close() {
    termsRecognizer.dispose();
    privacyRecognizer.dispose();
    return super.close();
  }
}
