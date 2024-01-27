// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResourceImpl _$$ResourceImplFromJson(Map<String, dynamic> json) =>
    _$ResourceImpl(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      assetFileName16: json['assetFileName16'] as String,
      description: json['description'] as String? ?? defaultDescription,
      assetFileNameLarge: json['assetFileNameLarge'] as String?,
      assetFileNameWhenFull: json['assetFileNameWhenFull'] as String?,
      isLiquid: json['isLiquid'] as bool? ?? false,
      amountPerSlot: json['amountPerSlot'] as int? ?? 25,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      secondsToCraft: (json['secondsToCraft'] as num?)?.toDouble(),
      secondsToMine: (json['secondsToMine'] as num?)?.toDouble(),
      canConsume: json['canConsume'] as bool? ?? false,
      canPlace: json['canPlace'] as bool? ?? false,
      canPickUp: json['canPickUp'] as bool? ?? false,
      canConstruct: json['canConstruct'] as bool? ?? false,
      placementWidth: (json['placementWidth'] as num?)?.toDouble() ?? TILE_SIZE,
      placementHeight:
          (json['placementHeight'] as num?)?.toDouble() ?? TILE_SIZE,
      requiredToMine: (json['requiredToMine'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      slots: json['slots'] as int? ?? 0,
      storageType: json['storageType'] == null
          ? StorageType.none
          : storageTypeFromJson(json['storageType'] as String),
      resourcesPerSlot: json['resourcesPerSlot'] as int? ?? 0,
      outputSlotSize: json['outputSlotSize'] as int? ?? 0,
    );

Map<String, dynamic> _$$ResourceImplToJson(_$ResourceImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'assetFileName16': instance.assetFileName16,
      'description': instance.description,
      'assetFileNameLarge': instance.assetFileNameLarge,
      'assetFileNameWhenFull': instance.assetFileNameWhenFull,
      'isLiquid': instance.isLiquid,
      'amountPerSlot': instance.amountPerSlot,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'secondsToCraft': instance.secondsToCraft,
      'secondsToMine': instance.secondsToMine,
      'canConsume': instance.canConsume,
      'canPlace': instance.canPlace,
      'canPickUp': instance.canPickUp,
      'canConstruct': instance.canConstruct,
      'placementWidth': instance.placementWidth,
      'placementHeight': instance.placementHeight,
      'requiredToMine': instance.requiredToMine.map((e) => e.toJson()).toList(),
      'slots': instance.slots,
      'storageType': storageTypeToJson(instance.storageType),
      'resourcesPerSlot': instance.resourcesPerSlot,
      'outputSlotSize': instance.outputSlotSize,
    };
