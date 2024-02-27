import 'package:craftown/src/menus/models/craft_menu_state.dart';
import 'package:craftown/src/providers/audio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'craft_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class CraftMenu extends _$CraftMenu {
  @override
  CraftMenuState build() {
    return CraftMenuState();
  }

  void _playSound() {
    ref.read(audioNotifierProvider.notifier).playRandomBlip();
  }

  void open() {
    _playSound();
    state = state.copyWith(isOpen: true);
  }

  void close() {
    _playSound();

    state = state.copyWith(isOpen: false);
  }

  void setSelected(int index) {
    _playSound();

    state = state.copyWith(selectedIndex: index);
  }
}
