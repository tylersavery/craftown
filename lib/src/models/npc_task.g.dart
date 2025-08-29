// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NpcTaskDefinitionImpl _$$NpcTaskDefinitionImplFromJson(
        Map<String, dynamic> json) =>
    _$NpcTaskDefinitionImpl(
      id: json['id'] as String,
      type: $enumDecode(_$TaskTypeEnumMap, json['type']),
      name: json['name'] as String,
      priority: $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority']) ??
          TaskPriority.normal,
      enabled: json['enabled'] as bool? ?? true,
      sourceMachineId: json['sourceMachineId'] as String?,
      destinationMachineId: json['destinationMachineId'] as String?,
      itemFilter: json['itemFilter'] == null
          ? null
          : Resource.fromJson(json['itemFilter'] as Map<String, dynamic>),
      maxQuantityPerTrip: (json['maxQuantityPerTrip'] as num?)?.toInt() ?? 0,
      keepRunning: json['keepRunning'] as bool? ?? false,
      createdAt: (json['createdAt'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$NpcTaskDefinitionImplToJson(
        _$NpcTaskDefinitionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TaskTypeEnumMap[instance.type]!,
      'name': instance.name,
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'enabled': instance.enabled,
      'sourceMachineId': instance.sourceMachineId,
      'destinationMachineId': instance.destinationMachineId,
      'itemFilter': instance.itemFilter?.toJson(),
      'maxQuantityPerTrip': instance.maxQuantityPerTrip,
      'keepRunning': instance.keepRunning,
      'createdAt': instance.createdAt,
    };

const _$TaskTypeEnumMap = {
  TaskType.transport: 'transport',
  TaskType.collect: 'collect',
  TaskType.deliver: 'deliver',
  TaskType.automate: 'automate',
};

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.normal: 'normal',
  TaskPriority.high: 'high',
  TaskPriority.urgent: 'urgent',
};
