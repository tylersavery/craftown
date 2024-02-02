import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_menu_state.freezed.dart';

@freezed
class StoreMenuState with _$StoreMenuState {
  const factory StoreMenuState({
    @Default(false) bool isOpen,
  }) = _StoreMenuState;
}
