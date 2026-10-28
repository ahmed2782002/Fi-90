import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/theme_cubit.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/friendship/presentation/view/screen/friendship_screen.dart';
import 'package:fii90/feature/friendship/presentation/view_model/friendship_cubit.dart';
import 'package:fii90/feature/plans/mock_model/plan.dart';
import 'package:fii90/feature/plans/presentation/view/screen/plans_screen.dart';
import 'package:fii90/feature/plans/presentation/view_model/plans_cubit.dart';
import 'package:fii90/feature/edit_profile/presentation/view/screen/edit_profile_screen.dart';
import 'package:fii90/feature/sound/presentation/view/screen/sound_screen.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/account_settings.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/preferences_settings.dart';
import 'package:fii90/feature/profile/presentation/view_model/profile_cubit.dart';
import 'package:fii90/feature/sound/presentation/view_model/sound_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.watch<ProfileCubit>();
    final plansCubit = context.watch<PlansCubit>();
    final friendship = context.watch<FriendshipCubit>();
    final themeCubit = context.watch<ThemeCubit>();
    final sound = context.watch<SoundCubit>();
    void open(Widget page) => Nav.push(
      context,
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: profileCubit),
          BlocProvider.value(value: plansCubit),
          BlocProvider.value(value: friendship),
          BlocProvider.value(value: sound),
        ],
        child: page,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AccountSettings(
          coins: Plan.coinsBalance,
          soundHint: context.tr(sound.summaryKey),
          planHint: context.tr(
            AppStrings.plansHint,
            args: [context.tr(plansCubit.state.current.nameKey)],
          ),
          friendsHint: context.tr(
            friendship.hintKey,
            args: [
              '${friendship.onlineCount}',
              '${friendship.requests.length}',
            ],
          ),
          requests: friendship.requests.length,
          onEdit: () => open(const EditProfileScreen()),
          onSound: () => open(const SoundScreen()),
          onPlans: () => open(const PlansScreen()),
          onFriends: () => open(const FriendshipScreen()),
        ),
        const SizedBox(height: 16),
        PreferencesSettings(
          languageIndex: AppLocalization.supported.indexOf(context.locale),
          onLanguage: (i) {
            final overlay = Navigator.of(context, rootNavigator: true).overlay;
            context.setLocale(AppLocalization.supported[i]).then((_) {
              if (overlay == null || !overlay.mounted) return;
              AppToast.show(
                overlay.context,
                ToastMessage(
                  PreferencesSettings.languageToasts[i],
                  translate: false,
                ),
                overlay: overlay,
              );
            });
          },
          notifications: profileCubit.state.notifications,
          notificationsHint: context.tr(profileCubit.notificationsHintKey),
          onNotifications: profileCubit.toggleNotifications,
          themeIndex: themeCubit.index,
          onTheme: themeCubit.select,
        ),
      ],
    );
  }
}
