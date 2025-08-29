// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SeedMenuState {
  bool get isOpen => throw _privateConstructorUsedError;
  FarmlandSprite? get farmlandSprite => throw _privateConstructorUsedError;

  /// Create a copy of SeedMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeedMenuStateCopyWith<SeedMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedMenuStateCopyWith<$Res> {
  factory $SeedMenuStateCopyWith(
          SeedMenuState value, $Res Function(SeedMenuState) then) =
      _$SeedMenuStateCopyWithImpl<$Res, SeedMenuState>;
  @useResult
  $Res call({bool isOpen, FarmlandSprite? farmlandSprite});
}

/// @nodoc
class _$SeedMenuStateCopyWithImpl<$Res, $Val extends SeedMenuState>
    implements $SeedMenuStateCopyWith<$Res> {
  _$SeedMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeedMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? farmlandSprite = freezed,
  }) {
    return _then(_value.copyWith(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      farmlandSprite: freezed == farmlandSprite
          ? _value.farmlandSprite
          : farmlandSprite // ignore: cast_nullable_to_non_nullable
              as FarmlandSprite?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeedMenuStateImplCopyWith<$Res>
    implements $SeedMenuStateCopyWith<$Res> {
  factory _$$SeedMenuStateImplCopyWith(
          _$SeedMenuStateImpl value, $Res Function(_$SeedMenuStateImpl) then) =
      __$$SeedMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOpen, FarmlandSprite? farmlandSprite});
}

/// @nodoc
class __$$SeedMenuStateImplCopyWithImpl<$Res>
    extends _$SeedMenuStateCopyWithImpl<$Res, _$SeedMenuStateImpl>
    implements _$$SeedMenuStateImplCopyWith<$Res> {
  __$$SeedMenuStateImplCopyWithImpl(
      _$SeedMenuStateImpl _value, $Res Function(_$SeedMenuStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeedMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? farmlandSprite = freezed,
  }) {
    return _then(_$SeedMenuStateImpl(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      farmlandSprite: freezed == farmlandSprite
          ? _value.farmlandSprite
          : farmlandSprite // ignore: cast_nullable_to_non_nullable
              as FarmlandSprite?,
    ));
  }
}

/// @nodoc

class _$SeedMenuStateImpl implements _SeedMenuState {
  const _$SeedMenuStateImpl({this.isOpen = false, this.farmlandSprite});

  @override
  @JsonKey()
  final bool isOpen;
  @override
  final FarmlandSprite? farmlandSprite;

  @override
  String toString() {
    return 'SeedMenuState(isOpen: $isOpen, farmlandSprite: $farmlandSprite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeedMenuStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.farmlandSprite, farmlandSprite) ||
                other.farmlandSprite == farmlandSprite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpen, farmlandSprite);

  /// Create a copy of SeedMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeedMenuStateImplCopyWith<_$SeedMenuStateImpl> get copyWith =>
      __$$SeedMenuStateImplCopyWithImpl<_$SeedMenuStateImpl>(this, _$identity);
}

abstract class _SeedMenuState implements SeedMenuState {
  const factory _SeedMenuState(
      {final bool isOpen,
      final FarmlandSprite? farmlandSprite}) = _$SeedMenuStateImpl;

  @override
  bool get isOpen;
  @override
  FarmlandSprite? get farmlandSprite;

  /// Create a copy of SeedMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeedMenuStateImplCopyWith<_$SeedMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
