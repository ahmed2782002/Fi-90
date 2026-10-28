import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/profile/mock_model/profile_data.dart';
import 'package:fii90/feature/profile/presentation/view_model/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  ProfileData get profile => ProfileData.mock;

  String get notificationsHintKey => state.notifications
      ? AppStrings.notificationsOn
      : AppStrings.notificationsOff;

  void toggleNotifications() {
    final on = !state.notifications;
    emit(
      state.copyWith(
        notifications: on,
        toast: ToastMessage(
          on
              ? AppStrings.notificationsOnToast
              : AppStrings.notificationsOffToast,
          kind: on ? ToastKind.ok : ToastKind.info,
        ),
      ),
    );
  }

  void rename(String name) => emit(
    state.copyWith(
      name: name,
      toast: const ToastMessage(AppStrings.savedToast),
    ),
  );
}
