import 'package:fii90/feature/layout/presentation/view_model/play_sheet_state.dart';
import 'package:fii90/feature/match/mock_model/match_mode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaySheetCubit extends Cubit<PlaySheetState> {
  PlaySheetCubit({this.modeKey}) : super(const PlaySheetState());

  final String? modeKey;

  List<MatchMode> get modes => modeKey == null
      ? MatchMode.values
      : [
          for (final m in MatchMode.values)
            if (m.nameKey == modeKey) m,
        ];

  void toggleAi() => emit(state.copyWith(aiOpen: !state.aiOpen));

  void selectLevel(int index) =>
      emit(state.copyWith(level: AiLevel.values[index]));
}
