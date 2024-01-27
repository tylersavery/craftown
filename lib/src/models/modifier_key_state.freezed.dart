// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modifier_key_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModifierKeyState {
  bool get shiftPressed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModifierKeyStateCopyWith<ModifierKeyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifierKeyStateCopyWith<$Res> {
  factory $ModifierKeyStateCopyWith(
          ModifierKeyState value, $Res Function(ModifierKeyState) then) =
      _$ModifierKeyStateCopyWithImpl<$Res, ModifierKeyState>;
  @useResult
  $Res call({bool shiftPressed});
}

/// @nodoc
class _$ModifierKeyStateCopyWithImpl<$Res, $Val extends ModifierKeyState>
    implements $ModifierKeyStateCopyWith<$Res> {
  _$ModifierKeyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftPressed = null,
  }) {
    return _then(_value.copyWith(
      shiftPressed: null == shiftPressed
          ? _value.shiftPressed
          : shiftPressed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModifierKeyStateImplCopyWith<$Res>
    implements $ModifierKeyStateCopyWith<$Res> {
  factory _$$ModifierKeyStateImplCopyWith(_$ModifierKeyStateImpl value,
          $Res Function(_$ModifierKeyStateImpl) then) =
      __$$ModifierKeyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool shiftPressed});
}

/// @nodoc
class __$$ModifierKeyStateImplCopyWithImpl<$Res>
    extends _$ModifierKeyStateCopyWithImpl<$Res, _$ModifierKeyStateImpl>
    implements _$$ModifierKeyStateImplCopyWith<$Res> {
  __$$ModifierKeyStateImplCopyWithImpl(_$ModifierKeyStateImpl _value,
      $Res Function(_$ModifierKeyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftPressed = null,
  }) {
    return _then(_$ModifierKeyStateImpl(
      shiftPressed: null == shiftPressed
          ? _value.shiftPressed
          : shiftPressed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ModifierKeyStateImpl implements _ModifierKeyState {
  const _$ModifierKeyStateImpl({this.shiftPressed = false});

  @override
  @JsonKey()
  final bool shiftPressed;

  @override
  String toString() {
    return 'ModifierKeyState(shiftPressed: $shiftPressed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifierKeyStateImpl &&
            (identical(other.shiftPressed, shiftPressed) ||
                other.shiftPressed == shiftPressed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shiftPressed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifierKeyStateImplCopyWith<_$ModifierKeyStateImpl> get copyWith =>
      __$$ModifierKeyStateImplCopyWithImpl<_$ModifierKeyStateImpl>(
          this, _$identity);
}

abstract class _ModifierKeyState implements ModifierKeyState {
  const factory _ModifierKeyState({final bool shiftPressed}) =
      _$ModifierKeyStateImpl;

  @override
  bool get shiftPressed;
  @override
  @JsonKey(ignore: true)
  _$$ModifierKeyStateImplCopyWith<_$ModifierKeyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
