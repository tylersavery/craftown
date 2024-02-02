// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoreMenuState {
  bool get isOpen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreMenuStateCopyWith<StoreMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreMenuStateCopyWith<$Res> {
  factory $StoreMenuStateCopyWith(
          StoreMenuState value, $Res Function(StoreMenuState) then) =
      _$StoreMenuStateCopyWithImpl<$Res, StoreMenuState>;
  @useResult
  $Res call({bool isOpen});
}

/// @nodoc
class _$StoreMenuStateCopyWithImpl<$Res, $Val extends StoreMenuState>
    implements $StoreMenuStateCopyWith<$Res> {
  _$StoreMenuStateCopyWithImpl(this._value, this._then);

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
abstract class _$$StoreMenuStateImplCopyWith<$Res>
    implements $StoreMenuStateCopyWith<$Res> {
  factory _$$StoreMenuStateImplCopyWith(_$StoreMenuStateImpl value,
          $Res Function(_$StoreMenuStateImpl) then) =
      __$$StoreMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOpen});
}

/// @nodoc
class __$$StoreMenuStateImplCopyWithImpl<$Res>
    extends _$StoreMenuStateCopyWithImpl<$Res, _$StoreMenuStateImpl>
    implements _$$StoreMenuStateImplCopyWith<$Res> {
  __$$StoreMenuStateImplCopyWithImpl(
      _$StoreMenuStateImpl _value, $Res Function(_$StoreMenuStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
  }) {
    return _then(_$StoreMenuStateImpl(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StoreMenuStateImpl implements _StoreMenuState {
  const _$StoreMenuStateImpl({this.isOpen = false});

  @override
  @JsonKey()
  final bool isOpen;

  @override
  String toString() {
    return 'StoreMenuState(isOpen: $isOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreMenuStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreMenuStateImplCopyWith<_$StoreMenuStateImpl> get copyWith =>
      __$$StoreMenuStateImplCopyWithImpl<_$StoreMenuStateImpl>(
          this, _$identity);
}

abstract class _StoreMenuState implements StoreMenuState {
  const factory _StoreMenuState({final bool isOpen}) = _$StoreMenuStateImpl;

  @override
  bool get isOpen;
  @override
  @JsonKey(ignore: true)
  _$$StoreMenuStateImplCopyWith<_$StoreMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
