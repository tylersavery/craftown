// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ToolMenuState {
  bool get isOpen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToolMenuStateCopyWith<ToolMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolMenuStateCopyWith<$Res> {
  factory $ToolMenuStateCopyWith(
          ToolMenuState value, $Res Function(ToolMenuState) then) =
      _$ToolMenuStateCopyWithImpl<$Res, ToolMenuState>;
  @useResult
  $Res call({bool isOpen});
}

/// @nodoc
class _$ToolMenuStateCopyWithImpl<$Res, $Val extends ToolMenuState>
    implements $ToolMenuStateCopyWith<$Res> {
  _$ToolMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
  }) {
    return _then(_value.copyWith(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToolMenuStateImplCopyWith<$Res>
    implements $ToolMenuStateCopyWith<$Res> {
  factory _$$ToolMenuStateImplCopyWith(
          _$ToolMenuStateImpl value, $Res Function(_$ToolMenuStateImpl) then) =
      __$$ToolMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOpen});
}

/// @nodoc
class __$$ToolMenuStateImplCopyWithImpl<$Res>
    extends _$ToolMenuStateCopyWithImpl<$Res, _$ToolMenuStateImpl>
    implements _$$ToolMenuStateImplCopyWith<$Res> {
  __$$ToolMenuStateImplCopyWithImpl(
      _$ToolMenuStateImpl _value, $Res Function(_$ToolMenuStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
  }) {
    return _then(_$ToolMenuStateImpl(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToolMenuStateImpl implements _ToolMenuState {
  const _$ToolMenuStateImpl({this.isOpen = false});

  @override
  @JsonKey()
  final bool isOpen;

  @override
  String toString() {
    return 'ToolMenuState(isOpen: $isOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolMenuStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolMenuStateImplCopyWith<_$ToolMenuStateImpl> get copyWith =>
      __$$ToolMenuStateImplCopyWithImpl<_$ToolMenuStateImpl>(this, _$identity);
}

abstract class _ToolMenuState implements ToolMenuState {
  const factory _ToolMenuState({final bool isOpen}) = _$ToolMenuStateImpl;

  @override
  bool get isOpen;
  @override
  @JsonKey(ignore: true)
  _$$ToolMenuStateImplCopyWith<_$ToolMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
