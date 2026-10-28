import 'package:fii90/feature/match/mock_model/match_mode.dart';

class PlaySheetState {
  const PlaySheetState({this.aiOpen = false, this.level = AiLevel.normal});

  final bool aiOpen;
  final AiLevel level;

  PlaySheetState copyWith({bool? aiOpen, AiLevel? level}) =>
      PlaySheetState(aiOpen: aiOpen ?? this.aiOpen, level: level ?? this.level);
}
