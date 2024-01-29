import 'package:freezed_annotation/freezed_annotation.dart';

part 'craft_menu_state.freezed.dart';

@freezed
class CraftMenuState with _$CraftMenuState {
  const factory CraftMenuState({
    @Default(false) bool isOpen,
    @Default(0) int selectedIndex,
  }) = _CraftMenuState;
}
