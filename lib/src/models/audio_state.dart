import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_state.freezed.dart';
part 'audio_state.g.dart';

@freezed
class AudioState with _$AudioState {
  const factory AudioState({
    @Default(true) bool soundEnabled,
    @Default(true) bool musicEnabled,
    @Default(1.0) double volume,
  }) = _AudioState;

  factory AudioState.fromJson(Map<String, dynamic> json) => _$AudioStateFromJson(json);
}
