import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState()) {
    _warmUp();
  }

  Timer? _timer;

  static const introDuration = Duration(milliseconds: 1200);
  static const loadDuration = Duration(milliseconds: 2600);
  static const _warmUpFrames = 3;

  Future<void> _warmUp() async {
    for (var i = 0; i < _warmUpFrames; i++) {
      SchedulerBinding.instance.scheduleFrame();
      await SchedulerBinding.instance.endOfFrame;
    }
    if (isClosed) return;
    emit(const SplashState(status: SplashStatus.loading));
    _timer = Timer(const Duration(milliseconds: 2800), finish);
  }

  void finish() {
    if (state.status != SplashStatus.loading) return;
    _timer?.cancel();
    emit(const SplashState(status: SplashStatus.done));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
