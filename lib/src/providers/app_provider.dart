import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_provider.g.dart';

enum AppState {
  mainMenu,
  mainMenuLoadingGame,
  characterSelection,
  overview,
  inGame,
  ;
}

@Riverpod(keepAlive: true)
class App extends _$App {
  @override
  AppState build() => AppState.mainMenu;

  set(AppState appState) {
    state = appState;
  }
}
