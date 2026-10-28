import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/friendship/mock_model/buddy.dart';
import 'package:fii90/feature/friendship/presentation/view_model/friendship_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendshipCubit extends Cubit<FriendshipState> {
  FriendshipCubit() : super(const FriendshipState());

  final searchController = TextEditingController();

  List<Buddy> get requests => [
    for (final r in Buddy.requests)
      if (!state.handled.contains(r.name)) r,
  ];

  List<Buddy> get friends => [
    for (final name in state.sent)
      Buddy(
        name: name,
        background: AppColors.s3,
        foreground: AppColors.tx,
        translated: false,
      ),
    ...Buddy.friends,
  ];

  int get onlineCount =>
      Buddy.friends.where((b) => b.status != BuddyStatus.away).length;

  String get hintKey => requests.isEmpty
      ? AppStrings.friendsHintNoRequests
      : AppStrings.friendsHint;

  void add() {
    final value = searchController.text.trim();
    if (value.length < 3) {
      emit(
        state.copyWith(
          toast: const ToastMessage(
            AppStrings.invalidFriendToast,
            kind: ToastKind.warn,
          ),
        ),
      );
      return;
    }
    searchController.clear();
    emit(
      state.copyWith(
        sent: [value, ...state.sent],
        toast: ToastMessage(AppStrings.requestSentToast, args: [value]),
      ),
    );
  }

  void shareCode() => emit(
    state.copyWith(
      toast: const ToastMessage(AppStrings.codeCopiedToast, args: [Buddy.code]),
    ),
  );

  void accept(Buddy buddy) => emit(
    state.copyWith(
      handled: {...state.handled, buddy.name},
      toast: ToastMessage(
        AppStrings.nowFriendsToast,
        args: [buddy.name],
        translateArgs: true,
      ),
    ),
  );

  void decline(Buddy buddy) =>
      emit(state.copyWith(handled: {...state.handled, buddy.name}));

  void challenge(Buddy buddy) {
    if (!buddy.status.canChallenge) return;
    emit(
      state.copyWith(
        toast: ToastMessage(
          AppStrings.challengeSentToast,
          args: [buddy.name],
          translateArgs: true,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
