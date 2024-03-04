import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_menu_state.freezed.dart';

enum SubMenu {
  loadGame("Load Game"),
  saveGame("Save Game"),
  credits("Credits"),
  settings("Settings"),
  ;

  final String label;
  const SubMenu(this.label);
}

@freezed
class GameMenuState with _$GameMenuState {
  const factory GameMenuState({
    @Default(false) bool isOpen,
    SubMenu? subMenuVisible,
  }) = _GameMenuState;
}
