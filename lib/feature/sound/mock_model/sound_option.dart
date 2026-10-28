import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';

enum SoundOption {
  all(
    AppIcons.sound,
    AppStrings.soundAll,
    AppStrings.soundAllOn,
    AppStrings.soundAllOff,
  ),
  music(
    AppIcons.music,
    AppStrings.soundMusic,
    AppStrings.soundMusicOn,
    AppStrings.soundOffFemale,
  ),
  fx(
    AppIcons.settingsNotification,
    AppStrings.soundFx,
    AppStrings.soundFxOn,
    AppStrings.soundOffFemale,
  ),
  vibration(
    AppIcons.vibration,
    AppStrings.soundVibration,
    AppStrings.soundVibrationOn,
    AppStrings.soundOffMale,
  );

  const SoundOption(this.icon, this.titleKey, this.onKey, this.offKey);

  final String icon;
  final String titleKey;
  final String onKey;
  final String offKey;

  bool get followsAll => this == music || this == fx;
}
