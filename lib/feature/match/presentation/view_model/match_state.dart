import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/match/mock_model/match_mode.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';

enum MatchStage { search, vs, intro, round, roundResult, finished, exit }

class MatchState {
  const MatchState({
    required this.modes,
    this.stage = MatchStage.search,
    this.vsAi = false,
    this.aiLevel = AiLevel.normal,
    this.roundIndex = 0,
    this.question = 0,
    this.questionWins = const [],
    this.meScore = 0,
    this.oppScore = 0,
    this.rounds = const [],
    this.delta,
    this.searchSeconds = 0,
    this.found = false,
    this.vsCount = 5,
    this.introCount = 4,
    this.roundKey = 0,
    this.toast,
  });

  final List<MatchMode> modes;
  final MatchStage stage;
  final bool vsAi;
  final AiLevel aiLevel;
  final int roundIndex;
  final int question;
  final List<({MatchSide? winner, int points})> questionWins;
  final int meScore;
  final int oppScore;
  final List<RoundResult> rounds;
  final ({MatchSide side, int amount})? delta;
  final int searchSeconds;
  final bool found;
  final int vsCount;
  final int introCount;
  final int roundKey;
  final ToastMessage? toast;

  MatchMode get mode => modes[roundIndex];

  MatchState copyWith({
    MatchStage? stage,
    int? roundIndex,
    int? question,
    List<({MatchSide? winner, int points})>? questionWins,
    int? meScore,
    int? oppScore,
    List<RoundResult>? rounds,
    ({MatchSide side, int amount})? delta,
    bool clearDelta = false,
    int? searchSeconds,
    bool? found,
    int? vsCount,
    int? introCount,
    int? roundKey,
    ToastMessage? toast,
  }) => MatchState(
    modes: modes,
    vsAi: vsAi,
    aiLevel: aiLevel,
    stage: stage ?? this.stage,
    roundIndex: roundIndex ?? this.roundIndex,
    question: question ?? this.question,
    questionWins: questionWins ?? this.questionWins,
    meScore: meScore ?? this.meScore,
    oppScore: oppScore ?? this.oppScore,
    rounds: rounds ?? this.rounds,
    delta: clearDelta ? null : delta ?? this.delta,
    searchSeconds: searchSeconds ?? this.searchSeconds,
    found: found ?? this.found,
    vsCount: vsCount ?? this.vsCount,
    introCount: introCount ?? this.introCount,
    roundKey: roundKey ?? this.roundKey,
    toast: toast,
  );
}
