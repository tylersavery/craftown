// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'npc_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NpcTaskDefinition _$NpcTaskDefinitionFromJson(Map<String, dynamic> json) {
  return _NpcTaskDefinition.fromJson(json);
}

/// @nodoc
mixin _$NpcTaskDefinition {
  String get id => throw _privateConstructorUsedError;
  TaskType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  String? get sourceMachineId => throw _privateConstructorUsedError;
  String? get destinationMachineId => throw _privateConstructorUsedError;
  Resource? get itemFilter => throw _privateConstructorUsedError;
  int get maxQuantityPerTrip => throw _privateConstructorUsedError;
  bool get keepRunning => throw _privateConstructorUsedError;
  double get createdAt => throw _privateConstructorUsedError;

  /// Serializes this NpcTaskDefinition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NpcTaskDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NpcTaskDefinitionCopyWith<NpcTaskDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NpcTaskDefinitionCopyWith<$Res> {
  factory $NpcTaskDefinitionCopyWith(
          NpcTaskDefinition value, $Res Function(NpcTaskDefinition) then) =
      _$NpcTaskDefinitionCopyWithImpl<$Res, NpcTaskDefinition>;
  @useResult
  $Res call(
      {String id,
      TaskType type,
      String name,
      TaskPriority priority,
      bool enabled,
      String? sourceMachineId,
      String? destinationMachineId,
      Resource? itemFilter,
      int maxQuantityPerTrip,
      bool keepRunning,
      double createdAt});

  $ResourceCopyWith<$Res>? get itemFilter;
}

/// @nodoc
class _$NpcTaskDefinitionCopyWithImpl<$Res, $Val extends NpcTaskDefinition>
    implements $NpcTaskDefinitionCopyWith<$Res> {
  _$NpcTaskDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NpcTaskDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? priority = null,
    Object? enabled = null,
    Object? sourceMachineId = freezed,
    Object? destinationMachineId = freezed,
    Object? itemFilter = freezed,
    Object? maxQuantityPerTrip = null,
    Object? keepRunning = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sourceMachineId: freezed == sourceMachineId
          ? _value.sourceMachineId
          : sourceMachineId // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationMachineId: freezed == destinationMachineId
          ? _value.destinationMachineId
          : destinationMachineId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemFilter: freezed == itemFilter
          ? _value.itemFilter
          : itemFilter // ignore: cast_nullable_to_non_nullable
              as Resource?,
      maxQuantityPerTrip: null == maxQuantityPerTrip
          ? _value.maxQuantityPerTrip
          : maxQuantityPerTrip // ignore: cast_nullable_to_non_nullable
              as int,
      keepRunning: null == keepRunning
          ? _value.keepRunning
          : keepRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of NpcTaskDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResourceCopyWith<$Res>? get itemFilter {
    if (_value.itemFilter == null) {
      return null;
    }

    return $ResourceCopyWith<$Res>(_value.itemFilter!, (value) {
      return _then(_value.copyWith(itemFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NpcTaskDefinitionImplCopyWith<$Res>
    implements $NpcTaskDefinitionCopyWith<$Res> {
  factory _$$NpcTaskDefinitionImplCopyWith(_$NpcTaskDefinitionImpl value,
          $Res Function(_$NpcTaskDefinitionImpl) then) =
      __$$NpcTaskDefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      TaskType type,
      String name,
      TaskPriority priority,
      bool enabled,
      String? sourceMachineId,
      String? destinationMachineId,
      Resource? itemFilter,
      int maxQuantityPerTrip,
      bool keepRunning,
      double createdAt});

  @override
  $ResourceCopyWith<$Res>? get itemFilter;
}

/// @nodoc
class __$$NpcTaskDefinitionImplCopyWithImpl<$Res>
    extends _$NpcTaskDefinitionCopyWithImpl<$Res, _$NpcTaskDefinitionImpl>
    implements _$$NpcTaskDefinitionImplCopyWith<$Res> {
  __$$NpcTaskDefinitionImplCopyWithImpl(_$NpcTaskDefinitionImpl _value,
      $Res Function(_$NpcTaskDefinitionImpl) _then)
      : super(_value, _then);

  /// Create a copy of NpcTaskDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? priority = null,
    Object? enabled = null,
    Object? sourceMachineId = freezed,
    Object? destinationMachineId = freezed,
    Object? itemFilter = freezed,
    Object? maxQuantityPerTrip = null,
    Object? keepRunning = null,
    Object? createdAt = null,
  }) {
    return _then(_$NpcTaskDefinitionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sourceMachineId: freezed == sourceMachineId
          ? _value.sourceMachineId
          : sourceMachineId // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationMachineId: freezed == destinationMachineId
          ? _value.destinationMachineId
          : destinationMachineId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemFilter: freezed == itemFilter
          ? _value.itemFilter
          : itemFilter // ignore: cast_nullable_to_non_nullable
              as Resource?,
      maxQuantityPerTrip: null == maxQuantityPerTrip
          ? _value.maxQuantityPerTrip
          : maxQuantityPerTrip // ignore: cast_nullable_to_non_nullable
              as int,
      keepRunning: null == keepRunning
          ? _value.keepRunning
          : keepRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NpcTaskDefinitionImpl extends _NpcTaskDefinition {
  const _$NpcTaskDefinitionImpl(
      {required this.id,
      required this.type,
      required this.name,
      this.priority = TaskPriority.normal,
      this.enabled = true,
      this.sourceMachineId,
      this.destinationMachineId,
      this.itemFilter,
      this.maxQuantityPerTrip = 0,
      this.keepRunning = false,
      this.createdAt = 0.0})
      : super._();

  factory _$NpcTaskDefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NpcTaskDefinitionImplFromJson(json);

  @override
  final String id;
  @override
  final TaskType type;
  @override
  final String name;
  @override
  @JsonKey()
  final TaskPriority priority;
  @override
  @JsonKey()
  final bool enabled;
  @override
  final String? sourceMachineId;
  @override
  final String? destinationMachineId;
  @override
  final Resource? itemFilter;
  @override
  @JsonKey()
  final int maxQuantityPerTrip;
  @override
  @JsonKey()
  final bool keepRunning;
  @override
  @JsonKey()
  final double createdAt;

  @override
  String toString() {
    return 'NpcTaskDefinition(id: $id, type: $type, name: $name, priority: $priority, enabled: $enabled, sourceMachineId: $sourceMachineId, destinationMachineId: $destinationMachineId, itemFilter: $itemFilter, maxQuantityPerTrip: $maxQuantityPerTrip, keepRunning: $keepRunning, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NpcTaskDefinitionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.sourceMachineId, sourceMachineId) ||
                other.sourceMachineId == sourceMachineId) &&
            (identical(other.destinationMachineId, destinationMachineId) ||
                other.destinationMachineId == destinationMachineId) &&
            (identical(other.itemFilter, itemFilter) ||
                other.itemFilter == itemFilter) &&
            (identical(other.maxQuantityPerTrip, maxQuantityPerTrip) ||
                other.maxQuantityPerTrip == maxQuantityPerTrip) &&
            (identical(other.keepRunning, keepRunning) ||
                other.keepRunning == keepRunning) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      priority,
      enabled,
      sourceMachineId,
      destinationMachineId,
      itemFilter,
      maxQuantityPerTrip,
      keepRunning,
      createdAt);

  /// Create a copy of NpcTaskDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NpcTaskDefinitionImplCopyWith<_$NpcTaskDefinitionImpl> get copyWith =>
      __$$NpcTaskDefinitionImplCopyWithImpl<_$NpcTaskDefinitionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NpcTaskDefinitionImplToJson(
      this,
    );
  }
}

abstract class _NpcTaskDefinition extends NpcTaskDefinition {
  const factory _NpcTaskDefinition(
      {required final String id,
      required final TaskType type,
      required final String name,
      final TaskPriority priority,
      final bool enabled,
      final String? sourceMachineId,
      final String? destinationMachineId,
      final Resource? itemFilter,
      final int maxQuantityPerTrip,
      final bool keepRunning,
      final double createdAt}) = _$NpcTaskDefinitionImpl;
  const _NpcTaskDefinition._() : super._();

  factory _NpcTaskDefinition.fromJson(Map<String, dynamic> json) =
      _$NpcTaskDefinitionImpl.fromJson;

  @override
  String get id;
  @override
  TaskType get type;
  @override
  String get name;
  @override
  TaskPriority get priority;
  @override
  bool get enabled;
  @override
  String? get sourceMachineId;
  @override
  String? get destinationMachineId;
  @override
  Resource? get itemFilter;
  @override
  int get maxQuantityPerTrip;
  @override
  bool get keepRunning;
  @override
  double get createdAt;

  /// Create a copy of NpcTaskDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NpcTaskDefinitionImplCopyWith<_$NpcTaskDefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
