import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';

enum BuzzerPhase {
  ready,
  active,
  sending,
  meFirst,
  answer,
  verify,
  oppFirst,
  oppAnswer,
  ok,
  bad,
  timeout,
  oppOk,
  oppBad,
  nobody;

  bool get bellZone =>
      index <= meFirst.index || this == oppFirst || this == oppAnswer;

  bool get answerZone => this == answer || this == verify;

  bool get oppSide => this == oppFirst || this == oppAnswer;
}

class BuzzerState {
  const BuzzerState({
    this.phase = BuzzerPhase.ready,
    this.count = 3,
    this.seconds = 8,
    this.answerSeconds = 7,
    this.gap = 0,
    this.oppTried = false,
    this.rebound = false,
    this.toast,
    this.score,
    this.finished,
  });

  final BuzzerPhase phase;
  final int count;
  final int seconds;
  final int answerSeconds;
  final double gap;
  final bool oppTried;
  final bool rebound;
  final ToastMessage? toast;
  final ({MatchSide side, int points})? score;
  final ({MatchSide? winner, String detailKey})? finished;

  BuzzerState copyWith({
    BuzzerPhase? phase,
    int? count,
    int? seconds,
    int? answerSeconds,
    double? gap,
    bool? oppTried,
    bool? rebound,
    ToastMessage? toast,
    ({MatchSide side, int points})? score,
    ({MatchSide? winner, String detailKey})? finished,
  }) => BuzzerState(
    phase: phase ?? this.phase,
    count: count ?? this.count,
    seconds: seconds ?? this.seconds,
    answerSeconds: answerSeconds ?? this.answerSeconds,
    gap: gap ?? this.gap,
    oppTried: oppTried ?? this.oppTried,
    rebound: rebound ?? this.rebound,
    toast: toast,
    score: score,
    finished: finished,
  );
}
