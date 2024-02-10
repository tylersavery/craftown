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
          (json['interactionRadius'] as num?)?.toDouble() ?? 64.0,
      secondsToSmelt: (json['secondsToSmelt'] as num?)?.toDouble(),
      secondsToCraft: (json['secondsToCraft'] as num?)?.toDouble(),
      secondsToMine: (json['secondsToMine'] as num?)?.toDouble(),
      energyToMine: json['energyToMine'] ?? 0.01,
      interactionAnimation: $enumDecodeNullable(
              _$PlayerInteractionAnimationTypeEnumMap,
              json['interactionAnimation']) ??
          PlayerInteractionAnimationType.pick,
      miningToolRequiredIdentifier:
          json['miningToolRequiredIdentifier'] as String?,
      hungerDecreaseOnConsumption:
          (json['hungerDecreaseOnConsumption'] as num?)?.toDouble() ?? 0,
      thirstDecreaseOnConsumption:
          (json['thirstDecreaseOnConsumption'] as num?)?.toDouble() ?? 0,
      canPlace: json['canPlace'] as bool? ?? false,
      placeWithHitbox: json['placeWithHitbox'] ?? true,
      canPickUp: json['canPickUp'] as bool? ?? false,
      canConstruct: json['canConstruct'] as bool? ?? false,
      canSmelt: json['canSmelt'] as bool? ?? false,
      canFarm: json['canFarm'] as bool? ?? false,
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
      specificStorageWhitelist:
          (json['specificStorageWhitelist'] as List<dynamic>?)
                  ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
      resourcesPerSlot: json['resourcesPerSlot'] as int? ?? 0,
      outputSlotSize: json['outputSlotSize'] as int? ?? 0,
      isSeed: json['isSeed'] as bool? ?? false,
      secondsToGrow: json['secondsToGrow'] as int? ?? 120,
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
      canOnlyBePlacedOnGround: json['canOnlyBePlacedOnGround'] as bool? ?? true,
      restValue: (json['restValue'] as num?)?.toDouble(),
      storeCost: json['storeCost'] as int?,
      spawnedResourceHitboxWidth:
          (json['spawnedResourceHitboxWidth'] as num?)?.toDouble(),
      spawnedResourceHitboxHeight:
          (json['spawnedResourceHitboxHeight'] as num?)?.toDouble(),
      spawnedResourceHitboxOffsetX:
          (json['spawnedResourceHitboxOffsetX'] as num?)?.toDouble() ?? 0.0,
      spawnedResourceHitboxOffsetY:
          (json['spawnedResourceHitboxOffsetY'] as num?)?.toDouble() ?? 0.0,
      smeltsInto: json['smeltsInto'] as String?,
      isHouse: json['isHouse'] as bool? ?? false,
      researchRequirements: (json['researchRequirements'] as List<dynamic>?)
              ?.map((e) => ResearchLevel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      equipsTool: json['equipsTool'] as String?,
      farmlandGrownAssetPath: json['farmlandGrownAssetPath'] as String?,
      farmlandGrownWidth:
          (json['farmlandGrownWidth'] as num?)?.toDouble() ?? 16.0,
      farmlandGrownHeight:
          (json['farmlandGrownHeight'] as num?)?.toDouble() ?? 16.0,
      canRotate: json['canRotate'] as bool? ?? false,
      isConveyor: json['isConveyor'] as bool? ?? false,
      assetFilename90Degrees: json['assetFilename90Degrees'] as String?,
      assetFilename180Degrees: json['assetFilename180Degrees'] as String?,
      assetFilename270Degrees: json['assetFilename270Degrees'] as String?,
      powerGenerated: (json['powerGenerated'] as num?)?.toDouble(),
      powerConsumed: (json['powerConsumed'] as num?)?.toDouble(),
      fuelResourceOptions: (json['fuelResourceOptions'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sustainabilityPenalty:
          (json['sustainabilityPenalty'] as num?)?.toDouble() ?? 0.0,
      showInventoryColumnInResourceContentsMenuOverride:
          json['showInventoryColumnInResourceContentsMenuOverride'] as bool?,
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
      'secondsToSmelt': instance.secondsToSmelt,
      'secondsToCraft': instance.secondsToCraft,
      'secondsToMine': instance.secondsToMine,
      'energyToMine': instance.energyToMine,
      'interactionAnimation': _$PlayerInteractionAnimationTypeEnumMap[
          instance.interactionAnimation]!,
      'miningToolRequiredIdentifier': instance.miningToolRequiredIdentifier,
      'hungerDecreaseOnConsumption': instance.hungerDecreaseOnConsumption,
      'thirstDecreaseOnConsumption': instance.thirstDecreaseOnConsumption,
      'canPlace': instance.canPlace,
      'placeWithHitbox': instance.placeWithHitbox,
      'canPickUp': instance.canPickUp,
      'canConstruct': instance.canConstruct,
      'canSmelt': instance.canSmelt,
      'canFarm': instance.canFarm,
      'placementWidth': instance.placementWidth,
      'placementHeight': instance.placementHeight,
      'requiredToMine': instance.requiredToMine.map((e) => e.toJson()).toList(),
      'slots': instance.slots,
      'storageType': storageTypeToJson(instance.storageType),
      'specificStorageWhitelist':
          instance.specificStorageWhitelist.map((e) => e.toJson()).toList(),
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
      'canOnlyBePlacedOnGround': instance.canOnlyBePlacedOnGround,
      'restValue': instance.restValue,
      'storeCost': instance.storeCost,
      'spawnedResourceHitboxWidth': instance.spawnedResourceHitboxWidth,
      'spawnedResourceHitboxHeight': instance.spawnedResourceHitboxHeight,
      'spawnedResourceHitboxOffsetX': instance.spawnedResourceHitboxOffsetX,
      'spawnedResourceHitboxOffsetY': instance.spawnedResourceHitboxOffsetY,
      'smeltsInto': instance.smeltsInto,
      'isHouse': instance.isHouse,
      'researchRequirements':
          instance.researchRequirements.map((e) => e.toJson()).toList(),
      'equipsTool': instance.equipsTool,
      'farmlandGrownAssetPath': instance.farmlandGrownAssetPath,
      'farmlandGrownWidth': instance.farmlandGrownWidth,
      'farmlandGrownHeight': instance.farmlandGrownHeight,
      'canRotate': instance.canRotate,
      'isConveyor': instance.isConveyor,
      'assetFilename90Degrees': instance.assetFilename90Degrees,
      'assetFilename180Degrees': instance.assetFilename180Degrees,
      'assetFilename270Degrees': instance.assetFilename270Degrees,
      'powerGenerated': instance.powerGenerated,
      'powerConsumed': instance.powerConsumed,
      'fuelResourceOptions':
          instance.fuelResourceOptions.map((e) => e.toJson()).toList(),
      'sustainabilityPenalty': instance.sustainabilityPenalty,
      'showInventoryColumnInResourceContentsMenuOverride':
          instance.showInventoryColumnInResourceContentsMenuOverride,
    };

const _$PlayerInteractionAnimationTypeEnumMap = {
  PlayerInteractionAnimationType.pick: 'pick',
  PlayerInteractionAnimationType.axe: 'axe',
  PlayerInteractionAnimationType.hoe: 'hoe',
  PlayerInteractionAnimationType.wateringCan: 'wateringCan',
};
