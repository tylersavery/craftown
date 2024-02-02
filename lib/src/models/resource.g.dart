// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResourceImpl _$$ResourceImplFromJson(Map<String, dynamic> json) =>
    _$ResourceImpl(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      namePlural: json['namePlural'] as String,
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
      interactionRadius:
          (json['interactionRadius'] as num?)?.toDouble() ?? 32.0,
      secondsToCraft: (json['secondsToCraft'] as num?)?.toDouble(),
      secondsToMine: (json['secondsToMine'] as num?)?.toDouble(),
      miningToolRequiredIdentifier:
          json['miningToolRequiredIdentifier'] as String?,
      hungerDecreaseOnConsumption:
          (json['hungerDecreaseOnConsumption'] as num?)?.toDouble() ?? 0,
      thirstDecreaseOnConsumption:
          (json['thirstDecreaseOnConsumption'] as num?)?.toDouble() ?? 0,
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
      isSeed: json['isSeed'] as bool? ?? false,
      secondsToGrow: json['secondsToGrow'] as int? ?? 5,
      growsInto: json['growsInto'] == null
          ? null
          : Resource.fromJson(json['growsInto'] as Map<String, dynamic>),
      farmYieldMin: json['farmYieldMin'] as int? ?? 1,
      farmYieldMax: json['farmYieldMax'] as int? ?? 1,
      contentsWillSell: json['contentsWillSell'] as bool? ?? false,
      saleValue: json['saleValue'] as int? ?? 0,
      miningOutputResource: json['miningOutputResource'] == null
          ? null
          : Resource.fromJson(
              json['miningOutputResource'] as Map<String, dynamic>),
      canOnlyBePlacedOn: (json['canOnlyBePlacedOn'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      restValue: (json['restValue'] as num?)?.toDouble(),
      storeCost: json['storeCost'] as int?,
    );

Map<String, dynamic> _$$ResourceImplToJson(_$ResourceImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'namePlural': instance.namePlural,
      'assetFileName16': instance.assetFileName16,
      'description': instance.description,
      'assetFileNameLarge': instance.assetFileNameLarge,
      'assetFileNameWhenFull': instance.assetFileNameWhenFull,
      'isLiquid': instance.isLiquid,
      'amountPerSlot': instance.amountPerSlot,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'interactionRadius': instance.interactionRadius,
      'secondsToCraft': instance.secondsToCraft,
      'secondsToMine': instance.secondsToMine,
      'miningToolRequiredIdentifier': instance.miningToolRequiredIdentifier,
      'hungerDecreaseOnConsumption': instance.hungerDecreaseOnConsumption,
      'thirstDecreaseOnConsumption': instance.thirstDecreaseOnConsumption,
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
      'isSeed': instance.isSeed,
      'secondsToGrow': instance.secondsToGrow,
      'growsInto': instance.growsInto?.toJson(),
      'farmYieldMin': instance.farmYieldMin,
      'farmYieldMax': instance.farmYieldMax,
      'contentsWillSell': instance.contentsWillSell,
      'saleValue': instance.saleValue,
      'miningOutputResource': instance.miningOutputResource?.toJson(),
      'canOnlyBePlacedOn':
          instance.canOnlyBePlacedOn?.map((e) => e.toJson()).toList(),
      'restValue': instance.restValue,
      'storeCost': instance.storeCost,
    };
