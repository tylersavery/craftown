// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
mixin _$Stats {
  int get dollars => throw _privateConstructorUsedError;
  double get sustainability => throw _privateConstructorUsedError;
  double get energy => throw _privateConstructorUsedError;
  double get hunger => throw _privateConstructorUsedError;
  double get thirst => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsCopyWith<Stats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) then) =
      _$StatsCopyWithImpl<$Res, Stats>;
  @useResult
  $Res call(
      {int dollars,
      double sustainability,
      double energy,
      double hunger,
      double thirst});
}

/// @nodoc
class _$StatsCopyWithImpl<$Res, $Val extends Stats>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dollars = null,
    Object? sustainability = null,
    Object? energy = null,
    Object? hunger = null,
    Object? thirst = null,
  }) {
    return _then(_value.copyWith(
      dollars: null == dollars
          ? _value.dollars
          : dollars // ignore: cast_nullable_to_non_nullable
              as int,
      sustainability: null == sustainability
          ? _value.sustainability
          : sustainability // ignore: cast_nullable_to_non_nullable
              as double,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      hunger: null == hunger
          ? _value.hunger
          : hunger // ignore: cast_nullable_to_non_nullable
              as double,
      thirst: null == thirst
          ? _value.thirst
          : thirst // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsImplCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$$StatsImplCopyWith(
          _$StatsImpl value, $Res Function(_$StatsImpl) then) =
      __$$StatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int dollars,
      double sustainability,
      double energy,
      double hunger,
      double thirst});
}

/// @nodoc
class __$$StatsImplCopyWithImpl<$Res>
    extends _$StatsCopyWithImpl<$Res, _$StatsImpl>
    implements _$$StatsImplCopyWith<$Res> {
  __$$StatsImplCopyWithImpl(
      _$StatsImpl _value, $Res Function(_$StatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dollars = null,
    Object? sustainability = null,
    Object? energy = null,
    Object? hunger = null,
    Object? thirst = null,
  }) {
    return _then(_$StatsImpl(
      dollars: null == dollars
          ? _value.dollars
          : dollars // ignore: cast_nullable_to_non_nullable
              as int,
      sustainability: null == sustainability
          ? _value.sustainability
          : sustainability // ignore: cast_nullable_to_non_nullable
              as double,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      hunger: null == hunger
          ? _value.hunger
          : hunger // ignore: cast_nullable_to_non_nullable
              as double,
      thirst: null == thirst
          ? _value.thirst
          : thirst // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsImpl implements _Stats {
  const _$StatsImpl(
      {required this.dollars,
      required this.sustainability,
      required this.energy,
      required this.hunger,
      required this.thirst});

  factory _$StatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsImplFromJson(json);

  @override
  final int dollars;
  @override
  final double sustainability;
  @override
  final double energy;
  @override
  final double hunger;
  @override
  final double thirst;

  @override
  String toString() {
    return 'Stats(dollars: $dollars, sustainability: $sustainability, energy: $energy, hunger: $hunger, thirst: $thirst)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsImpl &&
            (identical(other.dollars, dollars) || other.dollars == dollars) &&
            (identical(other.sustainability, sustainability) ||
                other.sustainability == sustainability) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.hunger, hunger) || other.hunger == hunger) &&
            (identical(other.thirst, thirst) || other.thirst == thirst));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dollars, sustainability, energy, hunger, thirst);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsImplCopyWith<_$StatsImpl> get copyWith =>
      __$$StatsImplCopyWithImpl<_$StatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsImplToJson(
      this,
    );
  }
}

abstract class _Stats implements Stats {
  const factory _Stats(
      {required final int dollars,
      required final double sustainability,
      required final double energy,
      required final double hunger,
      required final double thirst}) = _$StatsImpl;

  factory _Stats.fromJson(Map<String, dynamic> json) = _$StatsImpl.fromJson;

  @override
  int get dollars;
  @override
  double get sustainability;
  @override
  double get energy;
  @override
  double get hunger;
  @override
  double get thirst;
  @override
  @JsonKey(ignore: true)
  _$$StatsImplCopyWith<_$StatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
