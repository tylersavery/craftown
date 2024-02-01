import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_provider.g.dart';

enum AppState {
  mainMenu,
  characterSelection,
  inGame,
  ;
}

@Riverpod(keepAlive: true)
class App extends _$App {
  @override
  AppState build() => AppState.inGame;

  set(AppState appState) {
    state = appState;
  }
}
