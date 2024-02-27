import 'package:craftown/src/menus/models/game_menu_state.dart';
import 'package:craftown/src/models/saved_game.dart';
import 'package:craftown/src/providers/audio_provider.dart';
import 'package:craftown/src/providers/saved_game_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class GameMenu extends _$GameMenu {
  @override
  GameMenuState build() {
    return GameMenuState();
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
    state = GameMenuState();
  }

  Future<void> showLoadGameSubmenu() async {
    _playSound();
    await ref.read(savedGameListProvider.notifier).loadList();
    state = state.copyWith(subMenuVisible: SubMenu.loadGame);
  }

  Future<void> showSaveGameSubmenu() async {
    _playSound();
    await ref.read(savedGameListProvider.notifier).loadList();
    state = state.copyWith(subMenuVisible: SubMenu.saveGame);
  }

  void loadGame(SavedGame save) {
    _playSound();
    ref.read(savedGameListProvider.notifier).loadGame(save);
    close();
  }

  void backToRoot() {
    _playSound();
    state = state.copyWith(subMenuVisible: null);
  }
}
