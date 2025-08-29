// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_contents_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResourceContentsMenuState {
  bool get isOpen => throw _privateConstructorUsedError;
  PlacedResource? get placedResource => throw _privateConstructorUsedError;

  /// Create a copy of ResourceContentsMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResourceContentsMenuStateCopyWith<ResourceContentsMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceContentsMenuStateCopyWith<$Res> {
  factory $ResourceContentsMenuStateCopyWith(ResourceContentsMenuState value,
          $Res Function(ResourceContentsMenuState) then) =
      _$ResourceContentsMenuStateCopyWithImpl<$Res, ResourceContentsMenuState>;
  @useResult
  $Res call({bool isOpen, PlacedResource? placedResource});

  $PlacedResourceCopyWith<$Res>? get placedResource;
}

/// @nodoc
class _$ResourceContentsMenuStateCopyWithImpl<$Res,
        $Val extends ResourceContentsMenuState>
    implements $ResourceContentsMenuStateCopyWith<$Res> {
  _$ResourceContentsMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResourceContentsMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? placedResource = freezed,
  }) {
    return _then(_value.copyWith(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      placedResource: freezed == placedResource
          ? _value.placedResource
          : placedResource // ignore: cast_nullable_to_non_nullable
              as PlacedResource?,
    ) as $Val);
  }

  /// Create a copy of ResourceContentsMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlacedResourceCopyWith<$Res>? get placedResource {
    if (_value.placedResource == null) {
      return null;
    }

    return $PlacedResourceCopyWith<$Res>(_value.placedResource!, (value) {
      return _then(_value.copyWith(placedResource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResourceContentsMenuStateImplCopyWith<$Res>
    implements $ResourceContentsMenuStateCopyWith<$Res> {
  factory _$$ResourceContentsMenuStateImplCopyWith(
          _$ResourceContentsMenuStateImpl value,
          $Res Function(_$ResourceContentsMenuStateImpl) then) =
      __$$ResourceContentsMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOpen, PlacedResource? placedResource});

  @override
  $PlacedResourceCopyWith<$Res>? get placedResource;
}

/// @nodoc
class __$$ResourceContentsMenuStateImplCopyWithImpl<$Res>
    extends _$ResourceContentsMenuStateCopyWithImpl<$Res,
        _$ResourceContentsMenuStateImpl>
    implements _$$ResourceContentsMenuStateImplCopyWith<$Res> {
  __$$ResourceContentsMenuStateImplCopyWithImpl(
      _$ResourceContentsMenuStateImpl _value,
      $Res Function(_$ResourceContentsMenuStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResourceContentsMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? placedResource = freezed,
  }) {
    return _then(_$ResourceContentsMenuStateImpl(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      placedResource: freezed == placedResource
          ? _value.placedResource
          : placedResource // ignore: cast_nullable_to_non_nullable
              as PlacedResource?,
    ));
  }
}

/// @nodoc

class _$ResourceContentsMenuStateImpl implements _ResourceContentsMenuState {
  const _$ResourceContentsMenuStateImpl(
      {this.isOpen = false, this.placedResource});

  @override
  @JsonKey()
  final bool isOpen;
  @override
  final PlacedResource? placedResource;

  @override
  String toString() {
    return 'ResourceContentsMenuState(isOpen: $isOpen, placedResource: $placedResource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceContentsMenuStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.placedResource, placedResource) ||
                other.placedResource == placedResource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpen, placedResource);

  /// Create a copy of ResourceContentsMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceContentsMenuStateImplCopyWith<_$ResourceContentsMenuStateImpl>
      get copyWith => __$$ResourceContentsMenuStateImplCopyWithImpl<
          _$ResourceContentsMenuStateImpl>(this, _$identity);
}

abstract class _ResourceContentsMenuState implements ResourceContentsMenuState {
  const factory _ResourceContentsMenuState(
      {final bool isOpen,
      final PlacedResource? placedResource}) = _$ResourceContentsMenuStateImpl;

  @override
  bool get isOpen;
  @override
  PlacedResource? get placedResource;

  /// Create a copy of ResourceContentsMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResourceContentsMenuStateImplCopyWith<_$ResourceContentsMenuStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
