import 'package:fii90/core/localization/localized_text.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';

enum BidMode { waiting, mine, theirs, revealing }

enum AuctionPhase {
  setup,
  clues,
  bid,
  revealTaker,
  revealOther,
  match,
  fullTime,
}

typedef Signing = ({String player, int price});

typedef MatchEvent = ({
  int minute,
  MatchSide side,
  bool goal,
  LocalizedText who,
  LocalizedText? against,
});

typedef SimResult = ({
  List<MatchEvent> events,
  int goalsMe,
  int goalsOpp,
  ({int me, int opp})? penalties,
  MatchSide winner,
  ({int att, int def}) me,
  ({int att, int def}) opp,
});

class AuctionState {
  const AuctionState({
    this.phase = AuctionPhase.setup,
    this.size = 0,
    this.pair = 0,
    this.clues = 0,
    this.price = 1,
    this.holder,
    this.turn = MatchSide.me,
    this.seconds = 10,
    this.teams = const {MatchSide.me: {}, MatchSide.opp: {}},
    this.budget = const {MatchSide.me: 100, MatchSide.opp: 100},
    this.last,
    this.flip = 0,
    this.sim,
    this.minute = 0,
    this.toast,
    this.score,
    this.finished,
  });

  final AuctionPhase phase;
  final int size;
  final int pair;
  final int clues;
  final int price;
  final MatchSide? holder;
  final MatchSide? turn;
  final int seconds;
  final Map<MatchSide, Map<String, Signing>> teams;
  final Map<MatchSide, int> budget;
  final ({MatchSide taker, MatchSide other, int price})? last;
  final int flip;
  final SimResult? sim;
  final int minute;
  final ToastMessage? toast;
  final ({MatchSide side, int points})? score;
  final ({MatchSide winner, String detail})? finished;

  bool get revealing =>
      phase == AuctionPhase.revealTaker || phase == AuctionPhase.revealOther;

  AuctionState copyWith({
    AuctionPhase? phase,
    int? size,
    int? pair,
    int? clues,
    int? price,
    MatchSide? holder,
    bool clearHolder = false,
    MatchSide? turn,
    bool clearTurn = false,
    int? seconds,
    Map<MatchSide, Map<String, Signing>>? teams,
    Map<MatchSide, int>? budget,
    ({MatchSide taker, MatchSide other, int price})? last,
    int? flip,
    SimResult? sim,
    int? minute,
    ToastMessage? toast,
    ({MatchSide side, int points})? score,
    ({MatchSide winner, String detail})? finished,
  }) => AuctionState(
    phase: phase ?? this.phase,
    size: size ?? this.size,
    pair: pair ?? this.pair,
    clues: clues ?? this.clues,
    price: price ?? this.price,
    holder: clearHolder ? null : holder ?? this.holder,
    turn: clearTurn ? null : turn ?? this.turn,
    seconds: seconds ?? this.seconds,
    teams: teams ?? this.teams,
    budget: budget ?? this.budget,
    last: last ?? this.last,
    flip: flip ?? this.flip,
    sim: sim ?? this.sim,
    minute: minute ?? this.minute,
    toast: toast,
    score: score,
    finished: finished,
  );
}
