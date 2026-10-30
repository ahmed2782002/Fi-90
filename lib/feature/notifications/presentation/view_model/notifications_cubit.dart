import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/notifications/mock_model/app_notification.dart';
import 'package:fii90/feature/notifications/presentation/view_model/notifications_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsState());

  List<AppNotification> get _visible => [
    for (final n in AppNotification.mock)
      if (!state.gone.contains(n.id)) n,
  ];

  List<AppNotification> get today => [
    for (final n in _visible)
      if (n.today) n,
  ];

  List<AppNotification> get earlier => [
    for (final n in _visible)
      if (!n.today) n,
  ];

  bool get isEmpty => _visible.isEmpty;

  int get unreadCount => _visible.where(isUnread).length;

  bool isUnread(AppNotification n) => !state.read.contains(n.id);

  void markRead(AppNotification n) {
    if (!isUnread(n)) return;
    emit(state.copyWith(read: {...state.read, n.id}));
  }

  void readAll() => emit(
    state.copyWith(
      read: {for (final n in AppNotification.mock) n.id},
      toast: const ToastMessage(AppStrings.allNotificationsRead),
    ),
  );

  void accept(AppNotification n) =>
      emit(state.copyWith(gone: {...state.gone, n.id}, startMatch: true));

  void decline(AppNotification n) => emit(
    state.copyWith(
      gone: {...state.gone, n.id},
      toast: const ToastMessage(
        AppStrings.challengePostponed,
        kind: ToastKind.info,
      ),
    ),
  );
}
