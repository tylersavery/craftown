import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppState {
  mainMenu,
  characterSelection,
  inGame,
  ;
}

class AppStateProvider extends StateNotifier<AppState> {
  AppStateProvider(AppState initialState) : super(initialState);

  set(AppState appState) {
    state = appState;
  }
}

final appStateProvider = StateNotifierProvider<AppStateProvider, AppState>((ref) {
  return AppStateProvider(AppState.inGame);
});
