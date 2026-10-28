import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/friends/mock_model/friend_game.dart';
import 'package:fii90/feature/game_setup/presentation/view_model/game_setup_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameSetupCubit extends Cubit<GameSetupState> {
  GameSetupCubit(this.game)
    : super(GameSetupState(pairs: game.kind != FriendGameKind.photo)) {
    for (final c in slots.expand((t) => t)) {
      c.addListener(_refresh);
    }
  }

  static const maxPlayers = 10;

  final FriendGame game;
  final slots = [
    [TextEditingController(), TextEditingController()],
    [TextEditingController(), TextEditingController()],
  ];
  final draft = TextEditingController();

  bool get isSpy => game.kind == FriendGameKind.spy;

  bool get hasModeToggle => game.kind == FriendGameKind.photo;

  List<List<String>> get members => [
    for (final team in slots)
      [for (final c in state.pairs ? team : team.take(1)) c.text.trim()],
  ];

  bool get canStart => isSpy
      ? state.players.length >= 3
      : members.every((t) => t.every((n) => n.isNotEmpty));

  String get hintKey => canStart
      ? AppStrings.setupReady
      : isSpy
      ? AppStrings.setupNeedThree
      : state.pairs
      ? AppStrings.setupNeedFour
      : AppStrings.setupNeedEach;

  void _refresh() => emit(state.copyWith(version: state.version + 1));

  void selectMode(int index) => emit(state.copyWith(pairs: index == 1));

  void addPlayer() {
    final name = draft.text.trim();
    final error = name.isEmpty
        ? AppStrings.typePlayerNameToast
        : state.players.contains(name)
        ? AppStrings.nameExists
        : state.players.length >= maxPlayers
        ? AppStrings.maxTenPlayers
        : null;
    if (error != null) {
      return emit(
        state.copyWith(toast: ToastMessage(error, kind: ToastKind.warn)),
      );
    }
    draft.clear();
    emit(state.copyWith(players: [...state.players, name]));
  }

  void removePlayer(int index) =>
      emit(state.copyWith(players: [...state.players]..removeAt(index)));

  void start() {
    if (canStart) emit(state.copyWith(launch: true));
  }

  @override
  Future<void> close() {
    for (final c in [...slots.expand((t) => t), draft]) {
      c.dispose();
    }
    return super.close();
  }
}
