// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameMenuState {
  bool get isOpen => throw _privateConstructorUsedError;
  SubMenu? get subMenuVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameMenuStateCopyWith<GameMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameMenuStateCopyWith<$Res> {
  factory $GameMenuStateCopyWith(
          GameMenuState value, $Res Function(GameMenuState) then) =
      _$GameMenuStateCopyWithImpl<$Res, GameMenuState>;
  @useResult
  $Res call({bool isOpen, SubMenu? subMenuVisible});
}

/// @nodoc
class _$GameMenuStateCopyWithImpl<$Res, $Val extends GameMenuState>
    implements $GameMenuStateCopyWith<$Res> {
  _$GameMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? subMenuVisible = freezed,
  }) {
    return _then(_value.copyWith(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      subMenuVisible: freezed == subMenuVisible
          ? _value.subMenuVisible
          : subMenuVisible // ignore: cast_nullable_to_non_nullable
              as SubMenu?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameMenuStateImplCopyWith<$Res>
    implements $GameMenuStateCopyWith<$Res> {
  factory _$$GameMenuStateImplCopyWith(
          _$GameMenuStateImpl value, $Res Function(_$GameMenuStateImpl) then) =
      __$$GameMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOpen, SubMenu? subMenuVisible});
}

/// @nodoc
class __$$GameMenuStateImplCopyWithImpl<$Res>
    extends _$GameMenuStateCopyWithImpl<$Res, _$GameMenuStateImpl>
    implements _$$GameMenuStateImplCopyWith<$Res> {
  __$$GameMenuStateImplCopyWithImpl(
      _$GameMenuStateImpl _value, $Res Function(_$GameMenuStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? subMenuVisible = freezed,
  }) {
    return _then(_$GameMenuStateImpl(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      subMenuVisible: freezed == subMenuVisible
          ? _value.subMenuVisible
          : subMenuVisible // ignore: cast_nullable_to_non_nullable
              as SubMenu?,
    ));
  }
}

/// @nodoc

class _$GameMenuStateImpl implements _GameMenuState {
  const _$GameMenuStateImpl({this.isOpen = false, this.subMenuVisible});

  @override
  @JsonKey()
  final bool isOpen;
  @override
  final SubMenu? subMenuVisible;

  @override
  String toString() {
    return 'GameMenuState(isOpen: $isOpen, subMenuVisible: $subMenuVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameMenuStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.subMenuVisible, subMenuVisible) ||
                other.subMenuVisible == subMenuVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpen, subMenuVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameMenuStateImplCopyWith<_$GameMenuStateImpl> get copyWith =>
      __$$GameMenuStateImplCopyWithImpl<_$GameMenuStateImpl>(this, _$identity);
}

abstract class _GameMenuState implements GameMenuState {
  const factory _GameMenuState(
      {final bool isOpen, final SubMenu? subMenuVisible}) = _$GameMenuStateImpl;

  @override
  bool get isOpen;
  @override
  SubMenu? get subMenuVisible;
  @override
  @JsonKey(ignore: true)
  _$$GameMenuStateImplCopyWith<_$GameMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
