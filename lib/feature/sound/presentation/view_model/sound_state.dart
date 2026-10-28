import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/sound/mock_model/sound_option.dart';

class SoundState {
  const SoundState({this.sounds = const {...SoundOption.values}, this.toast});

  final Set<SoundOption> sounds;
  final ToastMessage? toast;
}
