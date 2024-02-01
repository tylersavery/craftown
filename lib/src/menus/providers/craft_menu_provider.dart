import 'package:craftown/src/menus/models/craft_menu_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'craft_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class CraftMenu extends _$CraftMenu {
  @override
  CraftMenuState build() {
    return CraftMenuState();
  }

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
