import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:craftown/src/menus/models/seed_menu_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'seed_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class SeedMenu extends _$SeedMenu {
  @override
  SeedMenuState build() {
    return SeedMenuState();
  }

  void open() {
    state = state.copyWith(isOpen: true);
  }

  void openWith(FarmlandSprite farmlandSprite) {
    state = state.copyWith(isOpen: true, farmlandSprite: farmlandSprite);
  }

  void close() {
    state = state.copyWith(isOpen: false);
  }
}
