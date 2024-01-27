import 'package:craftown/src/models/game_menu_state.dart';
import 'package:craftown/src/models/saved_game.dart';
import 'package:craftown/src/providers/saved_games_provider.dart';
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
    await ref.read(savedGameProvider.notifier).loadList();
    state = state.copyWith(subMenuVisible: SubMenu.loadGame);
  }

  void loadGame(SavedGame save) {
    ref.read(savedGameProvider.notifier).loadGame(save);
    close();
  }

  void backToRoot() {
    state = state.copyWith(subMenuVisible: null);
  }
}

final gameMenuProvider = StateNotifierProvider<GameMenuProvider, GameMenuState>((ref) {
  return GameMenuProvider(ref, GameMenuState());
});
