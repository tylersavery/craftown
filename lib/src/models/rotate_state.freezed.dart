// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rotate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RotateState {
  int get quarterTurns => throw _privateConstructorUsedError;
  bool get buttonVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RotateStateCopyWith<RotateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RotateStateCopyWith<$Res> {
  factory $RotateStateCopyWith(
          RotateState value, $Res Function(RotateState) then) =
      _$RotateStateCopyWithImpl<$Res, RotateState>;
  @useResult
  $Res call({int quarterTurns, bool buttonVisible});
}

/// @nodoc
class _$RotateStateCopyWithImpl<$Res, $Val extends RotateState>
    implements $RotateStateCopyWith<$Res> {
  _$RotateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quarterTurns = null,
    Object? buttonVisible = null,
  }) {
    return _then(_value.copyWith(
      quarterTurns: null == quarterTurns
          ? _value.quarterTurns
          : quarterTurns // ignore: cast_nullable_to_non_nullable
              as int,
      buttonVisible: null == buttonVisible
          ? _value.buttonVisible
          : buttonVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RotateStateImplCopyWith<$Res>
    implements $RotateStateCopyWith<$Res> {
  factory _$$RotateStateImplCopyWith(
          _$RotateStateImpl value, $Res Function(_$RotateStateImpl) then) =
      __$$RotateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quarterTurns, bool buttonVisible});
}

/// @nodoc
class __$$RotateStateImplCopyWithImpl<$Res>
    extends _$RotateStateCopyWithImpl<$Res, _$RotateStateImpl>
    implements _$$RotateStateImplCopyWith<$Res> {
  __$$RotateStateImplCopyWithImpl(
      _$RotateStateImpl _value, $Res Function(_$RotateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quarterTurns = null,
    Object? buttonVisible = null,
  }) {
    return _then(_$RotateStateImpl(
      quarterTurns: null == quarterTurns
          ? _value.quarterTurns
          : quarterTurns // ignore: cast_nullable_to_non_nullable
              as int,
      buttonVisible: null == buttonVisible
          ? _value.buttonVisible
          : buttonVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RotateStateImpl extends _RotateState {
  const _$RotateStateImpl({this.quarterTurns = 0, this.buttonVisible = false})
      : super._();

  @override
  @JsonKey()
  final int quarterTurns;
  @override
  @JsonKey()
  final bool buttonVisible;

  @override
  String toString() {
    return 'RotateState(quarterTurns: $quarterTurns, buttonVisible: $buttonVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RotateStateImpl &&
            (identical(other.quarterTurns, quarterTurns) ||
                other.quarterTurns == quarterTurns) &&
            (identical(other.buttonVisible, buttonVisible) ||
                other.buttonVisible == buttonVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quarterTurns, buttonVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RotateStateImplCopyWith<_$RotateStateImpl> get copyWith =>
      __$$RotateStateImplCopyWithImpl<_$RotateStateImpl>(this, _$identity);
}

abstract class _RotateState extends RotateState {
  const factory _RotateState(
      {final int quarterTurns, final bool buttonVisible}) = _$RotateStateImpl;
  const _RotateState._() : super._();

  @override
  int get quarterTurns;
  @override
  bool get buttonVisible;
  @override
  @JsonKey(ignore: true)
  _$$RotateStateImplCopyWith<_$RotateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
