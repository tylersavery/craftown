import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_menu_state.freezed.dart';

@freezed
class ToolMenuState with _$ToolMenuState {
  const factory ToolMenuState({
    @Default(false) bool isOpen,
  }) = _ToolMenuState;
}
