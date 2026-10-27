enum SplashStatus { warmingUp, loading, done }

class SplashState {
  const SplashState({this.status = SplashStatus.warmingUp});

  final SplashStatus status;

  bool get isWarmingUp => status == SplashStatus.warmingUp;
}
