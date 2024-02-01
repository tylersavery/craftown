import 'package:craftown/src/menus/models/game_menu_state.dart';
import 'package:craftown/src/models/saved_game.dart';
import 'package:craftown/src/providers/saved_game_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameMenuProvider extends StateNotifier<GameMenuState> {
  final Ref ref;
  GameMenuProvider(this.ref, GameMenuState initialState) : super(initialState);

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

final gameMenuProvider = StateNotifierProvider<GameMenuProvider, GameMenuState>((ref) {
  return GameMenuProvider(ref, GameMenuState());
});
