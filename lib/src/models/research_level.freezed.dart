// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'research_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResearchLevel _$ResearchLevelFromJson(Map<String, dynamic> json) {
  return _ResearchLevel.fromJson(json);
}

/// @nodoc
mixin _$ResearchLevel {
  String get identifier => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<ResearchLevel> get prerequisites => throw _privateConstructorUsedError;
  Duration get timeToUnlock => throw _privateConstructorUsedError;
  List<Ingredient> get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResearchLevelCopyWith<ResearchLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResearchLevelCopyWith<$Res> {
  factory $ResearchLevelCopyWith(
          ResearchLevel value, $Res Function(ResearchLevel) then) =
      _$ResearchLevelCopyWithImpl<$Res, ResearchLevel>;
  @useResult
  $Res call(
      {String identifier,
      String name,
      List<ResearchLevel> prerequisites,
      Duration timeToUnlock,
      List<Ingredient> cost});
}

/// @nodoc
class _$ResearchLevelCopyWithImpl<$Res, $Val extends ResearchLevel>
    implements $ResearchLevelCopyWith<$Res> {
  _$ResearchLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? name = null,
    Object? prerequisites = null,
    Object? timeToUnlock = null,
    Object? cost = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      prerequisites: null == prerequisites
          ? _value.prerequisites
          : prerequisites // ignore: cast_nullable_to_non_nullable
              as List<ResearchLevel>,
      timeToUnlock: null == timeToUnlock
          ? _value.timeToUnlock
          : timeToUnlock // ignore: cast_nullable_to_non_nullable
              as Duration,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResearchLevelImplCopyWith<$Res>
    implements $ResearchLevelCopyWith<$Res> {
  factory _$$ResearchLevelImplCopyWith(
          _$ResearchLevelImpl value, $Res Function(_$ResearchLevelImpl) then) =
      __$$ResearchLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String identifier,
      String name,
      List<ResearchLevel> prerequisites,
      Duration timeToUnlock,
      List<Ingredient> cost});
}

/// @nodoc
class __$$ResearchLevelImplCopyWithImpl<$Res>
    extends _$ResearchLevelCopyWithImpl<$Res, _$ResearchLevelImpl>
    implements _$$ResearchLevelImplCopyWith<$Res> {
  __$$ResearchLevelImplCopyWithImpl(
      _$ResearchLevelImpl _value, $Res Function(_$ResearchLevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? name = null,
    Object? prerequisites = null,
    Object? timeToUnlock = null,
    Object? cost = null,
  }) {
    return _then(_$ResearchLevelImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      prerequisites: null == prerequisites
          ? _value._prerequisites
          : prerequisites // ignore: cast_nullable_to_non_nullable
              as List<ResearchLevel>,
      timeToUnlock: null == timeToUnlock
          ? _value.timeToUnlock
          : timeToUnlock // ignore: cast_nullable_to_non_nullable
              as Duration,
      cost: null == cost
          ? _value._cost
          : cost // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResearchLevelImpl extends _ResearchLevel {
  const _$ResearchLevelImpl(
      {required this.identifier,
      required this.name,
      final List<ResearchLevel> prerequisites = const [],
      required this.timeToUnlock,
      required final List<Ingredient> cost})
      : _prerequisites = prerequisites,
        _cost = cost,
        super._();

  factory _$ResearchLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResearchLevelImplFromJson(json);

  @override
  final String identifier;
  @override
  final String name;
  final List<ResearchLevel> _prerequisites;
  @override
  @JsonKey()
  List<ResearchLevel> get prerequisites {
    if (_prerequisites is EqualUnmodifiableListView) return _prerequisites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prerequisites);
  }

  @override
  final Duration timeToUnlock;
  final List<Ingredient> _cost;
  @override
  List<Ingredient> get cost {
    if (_cost is EqualUnmodifiableListView) return _cost;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cost);
  }

  @override
  String toString() {
    return 'ResearchLevel(identifier: $identifier, name: $name, prerequisites: $prerequisites, timeToUnlock: $timeToUnlock, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResearchLevelImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._prerequisites, _prerequisites) &&
            (identical(other.timeToUnlock, timeToUnlock) ||
                other.timeToUnlock == timeToUnlock) &&
            const DeepCollectionEquality().equals(other._cost, _cost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      identifier,
      name,
      const DeepCollectionEquality().hash(_prerequisites),
      timeToUnlock,
      const DeepCollectionEquality().hash(_cost));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResearchLevelImplCopyWith<_$ResearchLevelImpl> get copyWith =>
      __$$ResearchLevelImplCopyWithImpl<_$ResearchLevelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResearchLevelImplToJson(
      this,
    );
  }
}

abstract class _ResearchLevel extends ResearchLevel {
  const factory _ResearchLevel(
      {required final String identifier,
      required final String name,
      final List<ResearchLevel> prerequisites,
      required final Duration timeToUnlock,
      required final List<Ingredient> cost}) = _$ResearchLevelImpl;
  const _ResearchLevel._() : super._();

  factory _ResearchLevel.fromJson(Map<String, dynamic> json) =
      _$ResearchLevelImpl.fromJson;

  @override
  String get identifier;
  @override
  String get name;
  @override
  List<ResearchLevel> get prerequisites;
  @override
  Duration get timeToUnlock;
  @override
  List<Ingredient> get cost;
  @override
  @JsonKey(ignore: true)
  _$$ResearchLevelImplCopyWith<_$ResearchLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
