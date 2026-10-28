import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_text_field.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/feature/edit_profile/presentation/view/widgets/edit_avatar.dart';
import 'package:fii90/feature/edit_profile/presentation/view/widgets/linked_account_field.dart';
import 'package:fii90/feature/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:fii90/feature/edit_profile/presentation/view_model/edit_profile_state.dart';
import 'package:fii90/feature/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final profile = profileCubit.profile;
    final name = profileCubit.state.name ?? context.tr(profile.nameKey);
    return BlocProvider(
      create: (_) => EditProfileCubit(name: name, username: profile.username),
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          final toast = state.toast;
          if (toast != null) AppToast.show(context, toast);
          if (state.status == EditProfileStatus.saved) {
            profileCubit.rename(context.read<EditProfileCubit>().name);
            Navigator.of(context).pop();
          }
        },
        child: Builder(
          builder: (context) {
            final cubit = context.read<EditProfileCubit>();
            return SubPage(
              title: context.tr(AppStrings.profileEdit),
              bottom: PrimaryButton(
                label: context.tr(AppStrings.saveChanges),
                height: 56,
                style: AppText.actionButton(16),
                onTap: cubit.save,
              ),
              children: [
                EditAvatar(initial: name.characters.first),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(AppStrings.nameLabel),
                      style: AppText.fieldLabel,
                    ),
                    const SizedBox(height: 6),
                    AppTextField(controller: cubit.nameController),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(AppStrings.usernameLabel),
                      style: AppText.fieldLabel,
                    ),
                    const SizedBox(height: 6),
                    AppTextField(
                      controller: cubit.usernameController,
                      readOnly: true,
                      ltr: true,
                    ),
                  ],
                ),
                LinkedAccountField(email: profile.email),
              ],
            );
          },
        ),
      ),
    );
  }
}
