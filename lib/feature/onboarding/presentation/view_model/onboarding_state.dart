class OnboardingState {
  const OnboardingState({this.index = 0, this.finished = false});

  final int index;
  final bool finished;

  OnboardingState copyWith({int? index, bool? finished}) => OnboardingState(
        index: index ?? this.index,
        finished: finished ?? this.finished,
      );
}
