enum JourneySegment { ranking, history }

class JourneyState {
  const JourneyState({this.segment = JourneySegment.ranking, this.board = 0});

  final JourneySegment segment;
  final int board;

  JourneyState copyWith({JourneySegment? segment, int? board}) => JourneyState(
    segment: segment ?? this.segment,
    board: board ?? this.board,
  );
}
