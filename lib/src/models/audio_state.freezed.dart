// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AudioState _$AudioStateFromJson(Map<String, dynamic> json) {
  return _AudioState.fromJson(json);
}

/// @nodoc
mixin _$AudioState {
  bool get soundEnabled => throw _privateConstructorUsedError;
  bool get musicEnabled => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioStateCopyWith<AudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioStateCopyWith<$Res> {
  factory $AudioStateCopyWith(
          AudioState value, $Res Function(AudioState) then) =
      _$AudioStateCopyWithImpl<$Res, AudioState>;
  @useResult
  $Res call({bool soundEnabled, bool musicEnabled, double volume});
}

/// @nodoc
class _$AudioStateCopyWithImpl<$Res, $Val extends AudioState>
    implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundEnabled = null,
    Object? musicEnabled = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      soundEnabled: null == soundEnabled
          ? _value.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      musicEnabled: null == musicEnabled
          ? _value.musicEnabled
          : musicEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioStateImplCopyWith<$Res>
    implements $AudioStateCopyWith<$Res> {
  factory _$$AudioStateImplCopyWith(
          _$AudioStateImpl value, $Res Function(_$AudioStateImpl) then) =
      __$$AudioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool soundEnabled, bool musicEnabled, double volume});
}

/// @nodoc
class __$$AudioStateImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$AudioStateImpl>
    implements _$$AudioStateImplCopyWith<$Res> {
  __$$AudioStateImplCopyWithImpl(
      _$AudioStateImpl _value, $Res Function(_$AudioStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundEnabled = null,
    Object? musicEnabled = null,
    Object? volume = null,
  }) {
    return _then(_$AudioStateImpl(
      soundEnabled: null == soundEnabled
          ? _value.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      musicEnabled: null == musicEnabled
          ? _value.musicEnabled
          : musicEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioStateImpl implements _AudioState {
  const _$AudioStateImpl(
      {this.soundEnabled = true, this.musicEnabled = true, this.volume = 1.0});

  factory _$AudioStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioStateImplFromJson(json);

  @override
  @JsonKey()
  final bool soundEnabled;
  @override
  @JsonKey()
  final bool musicEnabled;
  @override
  @JsonKey()
  final double volume;

  @override
  String toString() {
    return 'AudioState(soundEnabled: $soundEnabled, musicEnabled: $musicEnabled, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioStateImpl &&
            (identical(other.soundEnabled, soundEnabled) ||
                other.soundEnabled == soundEnabled) &&
            (identical(other.musicEnabled, musicEnabled) ||
                other.musicEnabled == musicEnabled) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, soundEnabled, musicEnabled, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioStateImplCopyWith<_$AudioStateImpl> get copyWith =>
      __$$AudioStateImplCopyWithImpl<_$AudioStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioStateImplToJson(
      this,
    );
  }
}

abstract class _AudioState implements AudioState {
  const factory _AudioState(
      {final bool soundEnabled,
      final bool musicEnabled,
      final double volume}) = _$AudioStateImpl;

  factory _AudioState.fromJson(Map<String, dynamic> json) =
      _$AudioStateImpl.fromJson;

  @override
  bool get soundEnabled;
  @override
  bool get musicEnabled;
  @override
  double get volume;
  @override
  @JsonKey(ignore: true)
  _$$AudioStateImplCopyWith<_$AudioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
