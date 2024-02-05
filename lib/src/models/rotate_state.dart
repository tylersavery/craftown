import 'package:freezed_annotation/freezed_annotation.dart';

part 'rotate_state.freezed.dart';

@freezed
class RotateState with _$RotateState {
  const RotateState._();

  const factory RotateState({
    @Default(0) int quarterTurns,
    @Default(false) bool buttonVisible,
  }) = _RotateState;
}
