import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:craftown/src/menus/models/seed_menu_state.dart';
import 'package:craftown/src/providers/audio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'seed_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class SeedMenu extends _$SeedMenu {
  @override
  SeedMenuState build() {
    return SeedMenuState();
  }

  void _playSound() {
    ref.read(audioNotifierProvider.notifier).playRandomBlip();
  }

  void open() {
    _playSound();
    state = state.copyWith(isOpen: true);
  }

  void openWith(FarmlandSprite farmlandSprite) {
    _playSound();

    state = state.copyWith(isOpen: true, farmlandSprite: farmlandSprite);
  }

  void close() {
    _playSound();

    state = state.copyWith(isOpen: false);
  }
}
