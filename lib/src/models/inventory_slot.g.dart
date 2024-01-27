// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventorySlotImpl _$$InventorySlotImplFromJson(Map<String, dynamic> json) =>
    _$InventorySlotImpl(
      resource: json['resource'] == null
          ? null
          : Resource.fromJson(json['resource'] as Map<String, dynamic>),
      count: json['count'] as int? ?? 0,
    );

Map<String, dynamic> _$$InventorySlotImplToJson(_$InventorySlotImpl instance) =>
    <String, dynamic>{
      'resource': instance.resource?.toJson(),
      'count': instance.count,
    };
