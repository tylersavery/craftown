import 'package:craftown/src/models/inventory_menu_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InventoryMenuProvider extends StateNotifier<InventoryMenuState> {
  final Ref ref;
  InventoryMenuProvider(this.ref, InventoryMenuState initialState) : super(initialState);

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

final inventoryMenuProvider = StateNotifierProvider<InventoryMenuProvider, InventoryMenuState>((ref) {
  final initialState = InventoryMenuState();
  return InventoryMenuProvider(ref, initialState);
});
