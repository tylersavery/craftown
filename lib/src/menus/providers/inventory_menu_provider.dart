import 'package:craftown/src/menus/models/inventory_menu_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'inventory_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class InventoryMenu extends _$InventoryMenu {
  @override
  InventoryMenuState build() {
    return InventoryMenuState();
  }

  void resetAndOpen() {
    state = state.copyWith(isOpen: true, selectedIndex: 0);
  }

  void open() {
    state = state.copyWith(isOpen: true);
  }

  void openWith(int index) {
    state = state.copyWith(isOpen: true, selectedIndex: index);
  }

  void close() {
    state = state.copyWith(isOpen: false);
  }

  void setSelected(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
