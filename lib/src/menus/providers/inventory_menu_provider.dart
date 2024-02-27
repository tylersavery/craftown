import 'package:craftown/src/menus/models/inventory_menu_state.dart';
import 'package:craftown/src/providers/audio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'inventory_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class InventoryMenu extends _$InventoryMenu {
  @override
  InventoryMenuState build() {
    return InventoryMenuState();
  }

  void _playSound() {
    ref.read(audioNotifierProvider.notifier).playRandomBlip();
  }

  void resetAndOpen() {
    _playSound();

    state = state.copyWith(isOpen: true, selectedIndex: 0);
  }

  void open() {
    _playSound();

    state = state.copyWith(isOpen: true);
  }

  void openWith(int index) {
    _playSound();

    state = state.copyWith(isOpen: true, selectedIndex: index);
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
