import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:craftown/src/menus/models/seed_menu_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeedMenuProvider extends StateNotifier<SeedMenuState> {
  final Ref ref;
  SeedMenuProvider(this.ref, SeedMenuState initialState) : super(initialState);

  void open() {
    state = state.copyWith(isOpen: true);
  }

  void openWith(FarmlandSprite farmlandSprite) {
    state = state.copyWith(isOpen: true, farmlandSprite: farmlandSprite);
  }

  void close() {
    state = state.copyWith(isOpen: false);
  }

  // void setSelected(Tool tool, [bool andClose = false]) {
  //   final success = ref.read(selectedToolProvider.notifier).set(tool);
  //   if (success && andClose) {
  //     close();
  //   }
  // }
}

final seedMenuProvider = StateNotifierProvider<SeedMenuProvider, SeedMenuState>((ref) {
  final initialState = SeedMenuState();
  return SeedMenuProvider(ref, initialState);
});
