import 'package:freezed_annotation/freezed_annotation.dart';

part 'modifier_key_state.freezed.dart';

@freezed
class ModifierKeyState with _$ModifierKeyState {
  const factory ModifierKeyState({
    @Default(false) bool shiftPressed,
  }) = _ModifierKeyState;
}
