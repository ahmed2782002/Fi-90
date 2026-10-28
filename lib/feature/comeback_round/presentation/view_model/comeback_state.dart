import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';

class ComebackState {
  const ComebackState({
    this.revealed = 1,
    this.elapsed = 0,
    this.done = false,
    this.guesses = const [],
    this.verifying,
    this.result,
    this.toast,
    this.score,
    this.finished,
  });

  final int revealed;
  final int elapsed;
  final bool done;
  final List<({String text, MatchSide side})> guesses;
  final MatchSide? verifying;
  final ({MatchSide? winner, int points, bool flip})? result;
  final ToastMessage? toast;
  final ({MatchSide side, int points})? score;
  final ({MatchSide? winner, int points, String detailKey, List<String> args})?
  finished;

  ComebackState copyWith({
    int? revealed,
    int? elapsed,
    bool? done,
    List<({String text, MatchSide side})>? guesses,
    MatchSide? verifying,
    bool clearVerifying = false,
    ({MatchSide? winner, int points, bool flip})? result,
    ToastMessage? toast,
    ({MatchSide side, int points})? score,
    ({MatchSide? winner, int points, String detailKey, List<String> args})?
    finished,
  }) => ComebackState(
    revealed: revealed ?? this.revealed,
    elapsed: elapsed ?? this.elapsed,
    done: done ?? this.done,
    guesses: guesses ?? this.guesses,
    verifying: clearVerifying ? null : verifying ?? this.verifying,
    result: result ?? this.result,
    toast: toast,
    score: score,
    finished: finished,
  );
}
