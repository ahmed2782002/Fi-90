import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/core/widgets/settings_app/settings_group.dart';
import 'package:fii90/core/widgets/settings_app/settings_row.dart';
import 'package:fii90/core/widgets/settings_app/toggle_switch.dart';
import 'package:fii90/feature/sound/mock_model/sound_option.dart';
import 'package:fii90/feature/sound/presentation/view_model/sound_cubit.dart';
import 'package:fii90/feature/sound/presentation/view_model/sound_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoundScreen extends StatelessWidget {
  const SoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoundCubit, SoundState>(
      builder: (context, state) {
        final cubit = context.read<SoundCubit>();
        return SubPage(
          title: context.tr(AppStrings.sound),
          children: [
            Text(context.tr(AppStrings.soundIntro), style: AppText.pageIntro),
            SettingsGroup(
              children: [
                for (final option in SoundOption.values)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: cubit.isLocked(option) ? .45 : 1,
                    child: SettingsRow(
                      icon: option.icon,
                      tint: cubit.isMuted(option)
                          ? AppColors.bad
                          : AppColors.pri,
                      ink: cubit.isMuted(option)
                          ? AppColors.badInk
                          : AppColors.priInk,
                      title: context.tr(option.titleKey),
                      subtitle: context.tr(cubit.hintKey(option)),
                      trailing: ToggleSwitch(
                        value: cubit.isOn(option),
                        label: context.tr(option.titleKey),
                        onTap: () => cubit.toggle(option),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
