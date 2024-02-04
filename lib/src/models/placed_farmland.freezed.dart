// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placed_farmland.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacedFarmland _$PlacedFarmlandFromJson(Map<String, dynamic> json) {
  return _PlacedFarmland.fromJson(json);
}

/// @nodoc
mixin _$PlacedFarmland {
  String get identifier => throw _privateConstructorUsedError;
  Farmland get farmland => throw _privateConstructorUsedError;
  int get tileX => throw _privateConstructorUsedError;
  int get tileY => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacedFarmlandCopyWith<PlacedFarmland> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacedFarmlandCopyWith<$Res> {
  factory $PlacedFarmlandCopyWith(
          PlacedFarmland value, $Res Function(PlacedFarmland) then) =
      _$PlacedFarmlandCopyWithImpl<$Res, PlacedFarmland>;
  @useResult
  $Res call({String identifier, Farmland farmland, int tileX, int tileY});

  $FarmlandCopyWith<$Res> get farmland;
}

/// @nodoc
class _$PlacedFarmlandCopyWithImpl<$Res, $Val extends PlacedFarmland>
    implements $PlacedFarmlandCopyWith<$Res> {
  _$PlacedFarmlandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? farmland = null,
    Object? tileX = null,
    Object? tileY = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      farmland: null == farmland
          ? _value.farmland
          : farmland // ignore: cast_nullable_to_non_nullable
              as Farmland,
      tileX: null == tileX
          ? _value.tileX
          : tileX // ignore: cast_nullable_to_non_nullable
              as int,
      tileY: null == tileY
          ? _value.tileY
          : tileY // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FarmlandCopyWith<$Res> get farmland {
    return $FarmlandCopyWith<$Res>(_value.farmland, (value) {
      return _then(_value.copyWith(farmland: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlacedFarmlandImplCopyWith<$Res>
    implements $PlacedFarmlandCopyWith<$Res> {
  factory _$$PlacedFarmlandImplCopyWith(_$PlacedFarmlandImpl value,
          $Res Function(_$PlacedFarmlandImpl) then) =
      __$$PlacedFarmlandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String identifier, Farmland farmland, int tileX, int tileY});

  @override
  $FarmlandCopyWith<$Res> get farmland;
}

/// @nodoc
class __$$PlacedFarmlandImplCopyWithImpl<$Res>
    extends _$PlacedFarmlandCopyWithImpl<$Res, _$PlacedFarmlandImpl>
    implements _$$PlacedFarmlandImplCopyWith<$Res> {
  __$$PlacedFarmlandImplCopyWithImpl(
      _$PlacedFarmlandImpl _value, $Res Function(_$PlacedFarmlandImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? farmland = null,
    Object? tileX = null,
    Object? tileY = null,
  }) {
    return _then(_$PlacedFarmlandImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      farmland: null == farmland
          ? _value.farmland
          : farmland // ignore: cast_nullable_to_non_nullable
              as Farmland,
      tileX: null == tileX
          ? _value.tileX
          : tileX // ignore: cast_nullable_to_non_nullable
              as int,
      tileY: null == tileY
          ? _value.tileY
          : tileY // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacedFarmlandImpl extends _PlacedFarmland {
  const _$PlacedFarmlandImpl(
      {required this.identifier,
      required this.farmland,
      required this.tileX,
      required this.tileY})
      : super._();

  factory _$PlacedFarmlandImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacedFarmlandImplFromJson(json);

  @override
  final String identifier;
  @override
  final Farmland farmland;
  @override
  final int tileX;
  @override
  final int tileY;

  @override
  String toString() {
    return 'PlacedFarmland(identifier: $identifier, farmland: $farmland, tileX: $tileX, tileY: $tileY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacedFarmlandImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.farmland, farmland) ||
                other.farmland == farmland) &&
            (identical(other.tileX, tileX) || other.tileX == tileX) &&
            (identical(other.tileY, tileY) || other.tileY == tileY));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, identifier, farmland, tileX, tileY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacedFarmlandImplCopyWith<_$PlacedFarmlandImpl> get copyWith =>
      __$$PlacedFarmlandImplCopyWithImpl<_$PlacedFarmlandImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacedFarmlandImplToJson(
      this,
    );
  }
}

abstract class _PlacedFarmland extends PlacedFarmland {
  const factory _PlacedFarmland(
      {required final String identifier,
      required final Farmland farmland,
      required final int tileX,
      required final int tileY}) = _$PlacedFarmlandImpl;
  const _PlacedFarmland._() : super._();

  factory _PlacedFarmland.fromJson(Map<String, dynamic> json) =
      _$PlacedFarmlandImpl.fromJson;

  @override
  String get identifier;
  @override
  Farmland get farmland;
  @override
  int get tileX;
  @override
  int get tileY;
  @override
  @JsonKey(ignore: true)
  _$$PlacedFarmlandImplCopyWith<_$PlacedFarmlandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
