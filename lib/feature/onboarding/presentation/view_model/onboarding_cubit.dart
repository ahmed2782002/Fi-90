import 'package:fii90/feature/onboarding/mock_model/onboarding_slide.dart';
import 'package:fii90/feature/onboarding/presentation/view_model/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  final slides = OnboardingSlide.mock;

  OnboardingSlide get slide => slides[state.index];

  bool get isLast => state.index == slides.length - 1;

  String get buttonLabel => isLast ? 'يلا نبدأ' : 'التالي';

  void next() => isLast ? skip() : emit(state.copyWith(index: state.index + 1));

  void back() {
    if (state.index > 0) emit(state.copyWith(index: state.index - 1));
  }

  void skip() => emit(state.copyWith(finished: true));

  void swipe(double velocity, {required bool isRtl}) {
    if (velocity.abs() < 200) return;
    final forward = isRtl ? velocity > 0 : velocity < 0;
    if (!forward) {
      back();
    } else if (!isLast) {
      next();
    }
  }
}
