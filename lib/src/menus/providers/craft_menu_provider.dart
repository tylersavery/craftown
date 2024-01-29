import 'package:craftown/src/menus/models/craft_menu_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CraftMenuProvider extends StateNotifier<CraftMenuState> {
  final Ref ref;
  CraftMenuProvider(this.ref, CraftMenuState initialState) : super(initialState);

  void open() {
    state = state.copyWith(isOpen: true);
  }

  void close() {
    state = state.copyWith(isOpen: false);
  }

  void setSelected(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}

final craftMenuProvider = StateNotifierProvider<CraftMenuProvider, CraftMenuState>((ref) {
  final initialState = CraftMenuState();
  return CraftMenuProvider(ref, initialState);
});
