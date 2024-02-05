// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placed_conveyor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacedConveyor _$PlacedConveyorFromJson(Map<String, dynamic> json) {
  return _PlacedConveyor.fromJson(json);
}

/// @nodoc
mixin _$PlacedConveyor {
  String get identifier => throw _privateConstructorUsedError;
  int get tileX => throw _privateConstructorUsedError;
  int get tileY => throw _privateConstructorUsedError;
  int get quarterTurns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacedConveyorCopyWith<PlacedConveyor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacedConveyorCopyWith<$Res> {
  factory $PlacedConveyorCopyWith(
          PlacedConveyor value, $Res Function(PlacedConveyor) then) =
      _$PlacedConveyorCopyWithImpl<$Res, PlacedConveyor>;
  @useResult
  $Res call({String identifier, int tileX, int tileY, int quarterTurns});
}

/// @nodoc
class _$PlacedConveyorCopyWithImpl<$Res, $Val extends PlacedConveyor>
    implements $PlacedConveyorCopyWith<$Res> {
  _$PlacedConveyorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? tileX = null,
    Object? tileY = null,
    Object? quarterTurns = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      tileX: null == tileX
          ? _value.tileX
          : tileX // ignore: cast_nullable_to_non_nullable
              as int,
      tileY: null == tileY
          ? _value.tileY
          : tileY // ignore: cast_nullable_to_non_nullable
              as int,
      quarterTurns: null == quarterTurns
          ? _value.quarterTurns
          : quarterTurns // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlacedConveyorImplCopyWith<$Res>
    implements $PlacedConveyorCopyWith<$Res> {
  factory _$$PlacedConveyorImplCopyWith(_$PlacedConveyorImpl value,
          $Res Function(_$PlacedConveyorImpl) then) =
      __$$PlacedConveyorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String identifier, int tileX, int tileY, int quarterTurns});
}

/// @nodoc
class __$$PlacedConveyorImplCopyWithImpl<$Res>
    extends _$PlacedConveyorCopyWithImpl<$Res, _$PlacedConveyorImpl>
    implements _$$PlacedConveyorImplCopyWith<$Res> {
  __$$PlacedConveyorImplCopyWithImpl(
      _$PlacedConveyorImpl _value, $Res Function(_$PlacedConveyorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? tileX = null,
    Object? tileY = null,
    Object? quarterTurns = null,
  }) {
    return _then(_$PlacedConveyorImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      tileX: null == tileX
          ? _value.tileX
          : tileX // ignore: cast_nullable_to_non_nullable
              as int,
      tileY: null == tileY
          ? _value.tileY
          : tileY // ignore: cast_nullable_to_non_nullable
              as int,
      quarterTurns: null == quarterTurns
          ? _value.quarterTurns
          : quarterTurns // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacedConveyorImpl extends _PlacedConveyor {
  const _$PlacedConveyorImpl(
      {required this.identifier,
      required this.tileX,
      required this.tileY,
      required this.quarterTurns})
      : super._();

  factory _$PlacedConveyorImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacedConveyorImplFromJson(json);

  @override
  final String identifier;
  @override
  final int tileX;
  @override
  final int tileY;
  @override
  final int quarterTurns;

  @override
  String toString() {
    return 'PlacedConveyor(identifier: $identifier, tileX: $tileX, tileY: $tileY, quarterTurns: $quarterTurns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacedConveyorImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.tileX, tileX) || other.tileX == tileX) &&
            (identical(other.tileY, tileY) || other.tileY == tileY) &&
            (identical(other.quarterTurns, quarterTurns) ||
                other.quarterTurns == quarterTurns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, identifier, tileX, tileY, quarterTurns);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacedConveyorImplCopyWith<_$PlacedConveyorImpl> get copyWith =>
      __$$PlacedConveyorImplCopyWithImpl<_$PlacedConveyorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacedConveyorImplToJson(
      this,
    );
  }
}

abstract class _PlacedConveyor extends PlacedConveyor {
  const factory _PlacedConveyor(
      {required final String identifier,
      required final int tileX,
      required final int tileY,
      required final int quarterTurns}) = _$PlacedConveyorImpl;
  const _PlacedConveyor._() : super._();

  factory _PlacedConveyor.fromJson(Map<String, dynamic> json) =
      _$PlacedConveyorImpl.fromJson;

  @override
  String get identifier;
  @override
  int get tileX;
  @override
  int get tileY;
  @override
  int get quarterTurns;
  @override
  @JsonKey(ignore: true)
  _$$PlacedConveyorImplCopyWith<_$PlacedConveyorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
