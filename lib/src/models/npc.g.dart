// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NpcImpl _$$NpcImplFromJson(Map<String, dynamic> json) => _$NpcImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      character: Character.fromJson(json['character'] as Map<String, dynamic>),
      tier: $enumDecode(_$NpcTierEnumMap, json['tier']),
      state: $enumDecodeNullable(_$NpcStateEnumMap, json['state']) ??
          NpcState.idle,
      currentTask: $enumDecodeNullable(_$NpcTaskEnumMap, json['currentTask']) ??
          NpcTask.none,
      inventory: (json['inventory'] as List<dynamic>?)
              ?.map((e) => InventorySlot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hunger: (json['hunger'] as num?)?.toDouble() ?? 100.0,
      thirst: (json['thirst'] as num?)?.toDouble() ?? 100.0,
      energy: (json['energy'] as num?)?.toDouble() ?? 100.0,
      tileX: (json['tileX'] as num?)?.toDouble() ?? 0.0,
      tileY: (json['tileY'] as num?)?.toDouble() ?? 0.0,
      targetMachineId: json['targetMachineId'] as String?,
      sourceMachineId: json['sourceMachineId'] as String?,
      destinationMachineId: json['destinationMachineId'] as String?,
      itemToTransport: json['itemToTransport'] as String?,
      itemQuantityToTransport:
          (json['itemQuantityToTransport'] as num?)?.toInt() ?? 0,
      lastWorkTime: (json['lastWorkTime'] as num?)?.toDouble() ?? 0.0,
      lastRestTime: (json['lastRestTime'] as num?)?.toDouble() ?? 0.0,
      maxWorkHours: (json['maxWorkHours'] as num?)?.toDouble() ?? 8.0,
      minRestHours: (json['minRestHours'] as num?)?.toDouble() ?? 16.0,
    );

Map<String, dynamic> _$$NpcImplToJson(_$NpcImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'character': instance.character.toJson(),
      'tier': _$NpcTierEnumMap[instance.tier]!,
      'state': _$NpcStateEnumMap[instance.state]!,
      'currentTask': _$NpcTaskEnumMap[instance.currentTask]!,
      'inventory': instance.inventory.map((e) => e.toJson()).toList(),
      'hunger': instance.hunger,
      'thirst': instance.thirst,
      'energy': instance.energy,
      'tileX': instance.tileX,
      'tileY': instance.tileY,
      'targetMachineId': instance.targetMachineId,
      'sourceMachineId': instance.sourceMachineId,
      'destinationMachineId': instance.destinationMachineId,
      'itemToTransport': instance.itemToTransport,
      'itemQuantityToTransport': instance.itemQuantityToTransport,
      'lastWorkTime': instance.lastWorkTime,
      'lastRestTime': instance.lastRestTime,
      'maxWorkHours': instance.maxWorkHours,
      'minRestHours': instance.minRestHours,
    };

const _$NpcTierEnumMap = {
  NpcTier.apprentice: 'apprentice',
  NpcTier.journeyman: 'journeyman',
  NpcTier.expert: 'expert',
  NpcTier.master: 'master',
};

const _$NpcStateEnumMap = {
  NpcState.idle: 'idle',
  NpcState.walkingToTarget: 'walkingToTarget',
  NpcState.workingAtMachine: 'workingAtMachine',
  NpcState.carryingItems: 'carryingItems',
  NpcState.resting: 'resting',
  NpcState.eating: 'eating',
  NpcState.drinking: 'drinking',
  NpcState.goingHome: 'goingHome',
  NpcState.sleeping: 'sleeping',
};

const _$NpcTaskEnumMap = {
  NpcTask.none: 'none',
  NpcTask.transportItems: 'transportItems',
  NpcTask.collectFromMachine: 'collectFromMachine',
  NpcTask.deliverToMachine: 'deliverToMachine',
};
