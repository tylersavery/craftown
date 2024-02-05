import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_menu_state.freezed.dart';

@freezed
class InventoryMenuState with _$InventoryMenuState {
  const factory InventoryMenuState({
    @Default(false) bool isOpen,
    @Default(0) int selectedIndex,
  }) = _InventoryMenuState;
}
