import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/edit_profile/presentation/view_model/edit_profile_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required String name, required String username})
    : nameController = TextEditingController(text: name),
      usernameController = TextEditingController(text: username),
      super(const EditProfileState());

  final TextEditingController nameController;
  final TextEditingController usernameController;

  String get name => nameController.text.trim();

  void save() => emit(
    name.isEmpty
        ? const EditProfileState(
            toast: ToastMessage(AppStrings.nameEmptyToast, kind: ToastKind.bad),
          )
        : const EditProfileState(status: EditProfileStatus.saved),
  );

  @override
  Future<void> close() {
    nameController.dispose();
    usernameController.dispose();
    return super.close();
  }
}
