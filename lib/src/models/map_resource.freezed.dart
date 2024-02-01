// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapResource _$MapResourceFromJson(Map<String, dynamic> json) {
  return _MapResource.fromJson(json);
}

/// @nodoc
mixin _$MapResource {
  String get uniqueIdentifier => throw _privateConstructorUsedError;
  ResourceSprite get sprite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapResourceCopyWith<MapResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapResourceCopyWith<$Res> {
  factory $MapResourceCopyWith(
          MapResource value, $Res Function(MapResource) then) =
      _$MapResourceCopyWithImpl<$Res, MapResource>;
  @useResult
  $Res call({String uniqueIdentifier, ResourceSprite sprite});
}

/// @nodoc
class _$MapResourceCopyWithImpl<$Res, $Val extends MapResource>
    implements $MapResourceCopyWith<$Res> {
  _$MapResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueIdentifier = null,
    Object? sprite = null,
  }) {
    return _then(_value.copyWith(
      uniqueIdentifier: null == uniqueIdentifier
          ? _value.uniqueIdentifier
          : uniqueIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      sprite: null == sprite
          ? _value.sprite
          : sprite // ignore: cast_nullable_to_non_nullable
              as ResourceSprite,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapResourceImplCopyWith<$Res>
    implements $MapResourceCopyWith<$Res> {
  factory _$$MapResourceImplCopyWith(
          _$MapResourceImpl value, $Res Function(_$MapResourceImpl) then) =
      __$$MapResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uniqueIdentifier, ResourceSprite sprite});
}

/// @nodoc
class __$$MapResourceImplCopyWithImpl<$Res>
    extends _$MapResourceCopyWithImpl<$Res, _$MapResourceImpl>
    implements _$$MapResourceImplCopyWith<$Res> {
  __$$MapResourceImplCopyWithImpl(
      _$MapResourceImpl _value, $Res Function(_$MapResourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueIdentifier = null,
    Object? sprite = null,
  }) {
    return _then(_$MapResourceImpl(
      uniqueIdentifier: null == uniqueIdentifier
          ? _value.uniqueIdentifier
          : uniqueIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      sprite: null == sprite
          ? _value.sprite
          : sprite // ignore: cast_nullable_to_non_nullable
              as ResourceSprite,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapResourceImpl extends _MapResource {
  const _$MapResourceImpl(
      {required this.uniqueIdentifier, required this.sprite})
      : super._();

  factory _$MapResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapResourceImplFromJson(json);

  @override
  final String uniqueIdentifier;
  @override
  final ResourceSprite sprite;

  @override
  String toString() {
    return 'MapResource(uniqueIdentifier: $uniqueIdentifier, sprite: $sprite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapResourceImpl &&
            (identical(other.uniqueIdentifier, uniqueIdentifier) ||
                other.uniqueIdentifier == uniqueIdentifier) &&
            (identical(other.sprite, sprite) || other.sprite == sprite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uniqueIdentifier, sprite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapResourceImplCopyWith<_$MapResourceImpl> get copyWith =>
      __$$MapResourceImplCopyWithImpl<_$MapResourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapResourceImplToJson(
      this,
    );
  }
}

abstract class _MapResource extends MapResource {
  const factory _MapResource(
      {required final String uniqueIdentifier,
      required final ResourceSprite sprite}) = _$MapResourceImpl;
  const _MapResource._() : super._();

  factory _MapResource.fromJson(Map<String, dynamic> json) =
      _$MapResourceImpl.fromJson;

  @override
  String get uniqueIdentifier;
  @override
  ResourceSprite get sprite;
  @override
  @JsonKey(ignore: true)
  _$$MapResourceImplCopyWith<_$MapResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
