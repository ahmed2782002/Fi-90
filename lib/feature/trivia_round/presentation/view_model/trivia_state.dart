import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';

enum TriviaPhase { fresh, turn, verify, result, over }

enum FeedbackKind { verify, ok, bad, timeout, pass, dup, out, exhausted }

class TriviaState {
  const TriviaState({
    this.phase = TriviaPhase.fresh,
    this.current = MatchSide.me,
    this.strikes = const {MatchSide.me: 0, MatchSide.opp: 0},
    this.passUsed = const {},
    this.submitted = const [],
    this.lastPassBy,
    this.seconds = 20,
    this.typing = false,
    this.oppText = '',
    this.feedback,
    this.toast,
    this.score,
    this.finished,
  });

  final TriviaPhase phase;
  final MatchSide current;
  final Map<MatchSide, int> strikes;
  final Set<MatchSide> passUsed;
  final List<({int index, MatchSide side})> submitted;
  final MatchSide? lastPassBy;
  final int seconds;
  final bool typing;
  final String oppText;
  final ({
    FeedbackKind kind,
    MatchSide who,
    int? answer,
    String text,
    bool unlock,
    MatchSide? winner,
  })?
  feedback;
  final ToastMessage? toast;
  final ({MatchSide side, int points})? score;
  final ({MatchSide? winner, String detailKey, List<String> args})? finished;

  bool passReady(MatchSide side) =>
      !passUsed.contains(side) && strikes[side]! >= 2;

  TriviaState copyWith({
    TriviaPhase? phase,
    MatchSide? current,
    Map<MatchSide, int>? strikes,
    Set<MatchSide>? passUsed,
    List<({int index, MatchSide side})>? submitted,
    MatchSide? lastPassBy,
    bool clearLastPass = false,
    int? seconds,
    bool? typing,
    String? oppText,
    ({
      FeedbackKind kind,
      MatchSide who,
      int? answer,
      String text,
      bool unlock,
      MatchSide? winner,
    })?
    feedback,
    bool clearFeedback = false,
    ToastMessage? toast,
    ({MatchSide side, int points})? score,
    ({MatchSide? winner, String detailKey, List<String> args})? finished,
  }) => TriviaState(
    phase: phase ?? this.phase,
    current: current ?? this.current,
    strikes: strikes ?? this.strikes,
    passUsed: passUsed ?? this.passUsed,
    submitted: submitted ?? this.submitted,
    lastPassBy: clearLastPass ? null : lastPassBy ?? this.lastPassBy,
    seconds: seconds ?? this.seconds,
    typing: typing ?? this.typing,
    oppText: oppText ?? this.oppText,
    feedback: clearFeedback ? null : feedback ?? this.feedback,
    toast: toast,
    score: score,
    finished: finished,
  );
}
