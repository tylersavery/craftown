// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'farmland.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Farmland _$FarmlandFromJson(Map<String, dynamic> json) {
  return _Farmland.fromJson(json);
}

/// @nodoc
mixin _$Farmland {
  String get identifier => throw _privateConstructorUsedError;
  Resource? get seed => throw _privateConstructorUsedError;
  DateTime? get completeAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: farmlandStateFromJson, toJson: farmlandStateToJson)
  FarmlandState get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FarmlandCopyWith<Farmland> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmlandCopyWith<$Res> {
  factory $FarmlandCopyWith(Farmland value, $Res Function(Farmland) then) =
      _$FarmlandCopyWithImpl<$Res, Farmland>;
  @useResult
  $Res call(
      {String identifier,
      Resource? seed,
      DateTime? completeAt,
      @JsonKey(fromJson: farmlandStateFromJson, toJson: farmlandStateToJson)
      FarmlandState state});

  $ResourceCopyWith<$Res>? get seed;
}

/// @nodoc
class _$FarmlandCopyWithImpl<$Res, $Val extends Farmland>
    implements $FarmlandCopyWith<$Res> {
  _$FarmlandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? seed = freezed,
    Object? completeAt = freezed,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as Resource?,
      completeAt: freezed == completeAt
          ? _value.completeAt
          : completeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as FarmlandState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResourceCopyWith<$Res>? get seed {
    if (_value.seed == null) {
      return null;
    }

    return $ResourceCopyWith<$Res>(_value.seed!, (value) {
      return _then(_value.copyWith(seed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FarmlandImplCopyWith<$Res>
    implements $FarmlandCopyWith<$Res> {
  factory _$$FarmlandImplCopyWith(
          _$FarmlandImpl value, $Res Function(_$FarmlandImpl) then) =
      __$$FarmlandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String identifier,
      Resource? seed,
      DateTime? completeAt,
      @JsonKey(fromJson: farmlandStateFromJson, toJson: farmlandStateToJson)
      FarmlandState state});

  @override
  $ResourceCopyWith<$Res>? get seed;
}

/// @nodoc
class __$$FarmlandImplCopyWithImpl<$Res>
    extends _$FarmlandCopyWithImpl<$Res, _$FarmlandImpl>
    implements _$$FarmlandImplCopyWith<$Res> {
  __$$FarmlandImplCopyWithImpl(
      _$FarmlandImpl _value, $Res Function(_$FarmlandImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? seed = freezed,
    Object? completeAt = freezed,
    Object? state = null,
  }) {
    return _then(_$FarmlandImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as Resource?,
      completeAt: freezed == completeAt
          ? _value.completeAt
          : completeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as FarmlandState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FarmlandImpl extends _Farmland {
  const _$FarmlandImpl(
      {required this.identifier,
      this.seed,
      this.completeAt,
      @JsonKey(fromJson: farmlandStateFromJson, toJson: farmlandStateToJson)
      this.state = FarmlandState.untouched})
      : super._();

  factory _$FarmlandImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmlandImplFromJson(json);

  @override
  final String identifier;
  @override
  final Resource? seed;
  @override
  final DateTime? completeAt;
  @override
  @JsonKey(fromJson: farmlandStateFromJson, toJson: farmlandStateToJson)
  final FarmlandState state;

  @override
  String toString() {
    return 'Farmland(identifier: $identifier, seed: $seed, completeAt: $completeAt, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmlandImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.completeAt, completeAt) ||
                other.completeAt == completeAt) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, identifier, seed, completeAt, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmlandImplCopyWith<_$FarmlandImpl> get copyWith =>
      __$$FarmlandImplCopyWithImpl<_$FarmlandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmlandImplToJson(
      this,
    );
  }
}

abstract class _Farmland extends Farmland {
  const factory _Farmland(
      {required final String identifier,
      final Resource? seed,
      final DateTime? completeAt,
      @JsonKey(fromJson: farmlandStateFromJson, toJson: farmlandStateToJson)
      final FarmlandState state}) = _$FarmlandImpl;
  const _Farmland._() : super._();

  factory _Farmland.fromJson(Map<String, dynamic> json) =
      _$FarmlandImpl.fromJson;

  @override
  String get identifier;
  @override
  Resource? get seed;
  @override
  DateTime? get completeAt;
  @override
  @JsonKey(fromJson: farmlandStateFromJson, toJson: farmlandStateToJson)
  FarmlandState get state;
  @override
  @JsonKey(ignore: true)
  _$$FarmlandImplCopyWith<_$FarmlandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
