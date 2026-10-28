import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/sound/mock_model/sound_option.dart';
import 'package:fii90/feature/sound/presentation/view_model/sound_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoundCubit extends Cubit<SoundState> {
  SoundCubit() : super(const SoundState());

  bool isLocked(SoundOption option) =>
      option.followsAll && !state.sounds.contains(SoundOption.all);

  bool isOn(SoundOption option) =>
      state.sounds.contains(option) && !isLocked(option);

  bool isMuted(SoundOption option) =>
      option == SoundOption.all && !isOn(option);

  String hintKey(SoundOption option) => isLocked(option)
      ? AppStrings.soundLocked
      : isOn(option)
      ? option.onKey
      : option.offKey;

  String get summaryKey {
    if (!isOn(SoundOption.all)) return AppStrings.soundSummaryAllOff;
    final music = isOn(SoundOption.music), fx = isOn(SoundOption.fx);
    if (music && fx) return AppStrings.soundSummaryBoth;
    if (music) return AppStrings.soundSummaryMusic;
    if (fx) return AppStrings.soundSummaryFx;
    return AppStrings.soundSummaryNone;
  }

  void toggle(SoundOption option) {
    if (isLocked(option)) return;
    final on = !state.sounds.contains(option);
    emit(
      SoundState(
        sounds: on
            ? {...state.sounds, option}
            : ({...state.sounds}..remove(option)),
        toast: ToastMessage(
          on ? AppStrings.soundTurnedOn : AppStrings.soundTurnedOff,
          kind: on ? ToastKind.ok : ToastKind.info,
          args: [option.titleKey],
          translateArgs: true,
        ),
      ),
    );
  }
}
