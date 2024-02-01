import 'package:craftown/src/menus/models/game_menu_state.dart';
import 'package:craftown/src/models/saved_game.dart';
import 'package:craftown/src/providers/saved_game_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class GameMenu extends _$GameMenu {
  @override
  GameMenuState build() {
    return GameMenuState();
  }

  void open() {
    state = state.copyWith(isOpen: true);
  }

  void close() {
    state = GameMenuState();
  }

  Future<void> showLoadGameSubmenu() async {
    await ref.read(savedGameListProvider.notifier).loadList();
    state = state.copyWith(subMenuVisible: SubMenu.loadGame);
  }

  Future<void> showSaveGameSubmenu() async {
    await ref.read(savedGameListProvider.notifier).loadList();
    state = state.copyWith(subMenuVisible: SubMenu.saveGame);
  }

  void loadGame(SavedGame save) {
    ref.read(savedGameListProvider.notifier).loadGame(save);
    close();
  }

  void backToRoot() {
    state = state.copyWith(subMenuVisible: null);
  }
}
