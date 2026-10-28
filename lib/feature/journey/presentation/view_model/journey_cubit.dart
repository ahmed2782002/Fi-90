import 'package:fii90/feature/journey/mock_model/leader.dart';
import 'package:fii90/feature/journey/presentation/view_model/journey_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JourneyCubit extends Cubit<JourneyState> {
  JourneyCubit() : super(const JourneyState());

  final leaders = Leader.mock;

  bool get isRanking => state.segment == JourneySegment.ranking;

  String get myRank => Leader.myRanks[state.board];

  String get boardKey => Leader.boards[state.board];

  void selectSegment(int index) =>
      emit(state.copyWith(segment: JourneySegment.values[index]));

  void showHistory() => emit(state.copyWith(segment: JourneySegment.history));

  void selectBoard(int index) => emit(state.copyWith(board: index));
}
