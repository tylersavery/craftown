import 'package:craftown/src/components/player.dart';
import 'package:craftown/src/constants.dart';
import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/research_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

const defaultDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.";

enum StorageType {
  none("none"),
  all("all"),
  liquid("liquid"),
  solid("solid"),
  specific("Specific"),
  ;

  final String id;
  const StorageType(this.id);
}

String storageTypeToJson(StorageType value) {
  return value.id;
}

StorageType storageTypeFromJson(String value) {
  return StorageType.values.firstWhere((element) => element.id == value);
}

@freezed
class Resource with _$Resource {
  const Resource._();

  const factory Resource({
    required String identifier,
    required String name,
    required String namePlural,
    required String assetFileName16,
    @Default(defaultDescription) String description,
    String? assetFileNameLarge,
    String? assetFileNameWhenFull,
    @Default(false) bool isLiquid,
    @Default(25) int amountPerSlot,
    @Default([]) List<Ingredient> ingredients,
    @Default(64.0) double interactionRadius,
    double? secondsToSmelt,
    double? secondsToCraft,
    double? secondsToMine,
    @Default(0.01) energyToMine,
    @Default(PlayerInteractionAnimationType.pick) PlayerInteractionAnimationType interactionAnimation,
    String? miningToolRequiredIdentifier,
    @Default(0) double hungerDecreaseOnConsumption,
    @Default(0) double thirstDecreaseOnConsumption,
    @Default(false) bool canPlace,
    @Default(true) placeWithHitbox,
    @Default(false) bool canPickUp,
    @Default(false) bool canConstruct,
    @Default(false) bool canSmelt,
    @Default(false) bool canFarm,
    @Default(TILE_SIZE) double placementWidth,
    @Default(TILE_SIZE) double placementHeight,
    @Default([]) List<Resource> requiredToMine,
    @Default(0) int slots,
    @JsonKey(toJson: storageTypeToJson, fromJson: storageTypeFromJson) @Default(StorageType.none) StorageType storageType,
    @Default([]) List<Resource> specificStorageWhitelist,
    @Default(0) int resourcesPerSlot,
    @Default(0) int outputSlotSize,
    @Default(false) bool isSeed,
    @Default(30) int secondsToGrow,
    Resource? growsInto,
    @Default(1) int farmYieldMin,
    @Default(1) int farmYieldMax,
    @Default(false) bool contentsWillSell,
    @Default(0) int saleValue,
    Resource? miningOutputResource,
    @Default(null) List<Resource>? canOnlyBePlacedOn,
    @Default(true) bool canOnlyBePlacedOnGround,
    double? restValue,
    int? storeCost,
    double? spawnedResourceHitboxWidth,
    double? spawnedResourceHitboxHeight,
    @Default(0.0) double spawnedResourceHitboxOffsetX,
    @Default(0.0) double spawnedResourceHitboxOffsetY,
    String? smeltsInto,
    @Default(false) bool isHouse,
    @Default([]) List<ResearchLevel> researchRequirements,
    String? equipsTool,
    String? farmlandGrownAssetPath,
    @Default(16.0) double farmlandGrownWidth,
    @Default(16.0) double farmlandGrownHeight,
    @Default(false) bool canRotate,
    @Default(false) bool isConveyor,
    String? assetFilename90Degrees,
    String? assetFilename180Degrees,
    String? assetFilename270Degrees,
    double? powerGenerated,
    double? powerConsumed,
    @Default(30) int powerFuelConsumptionSeconds,
    @Default([]) List<Resource> fuelResourceOptions,
    @Default(0.0) double sustainabilityPenalty,
    bool? showInventoryColumnInResourceContentsMenuOverride,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is Resource && identifier == other.identifier;
  }

  @override
  int get hashCode => identifier.hashCode;

  String get assetPath16 {
    return "assets/images/resources/$assetFileName16";
  }

  String get assetFileNameLargeWithFallback {
    return assetFileNameLarge ?? assetFileName16;
  }

  double? get smeltPerSecond {
    if (secondsToSmelt == null) return null;

    return 1 / secondsToSmelt!;
  }

  double? get craftPerSecond {
    if (secondsToCraft == null) return null;

    return 1 / secondsToCraft!;
  }

  double? get minePerSecond {
    if (secondsToMine == null) return null;

    return 1 / secondsToMine!;
  }

  bool get canHoldResources {
    return slots > 0 && resourcesPerSlot > 0;
  }

  bool get canConsume {
    return thirstDecreaseOnConsumption > 0 || hungerDecreaseOnConsumption > 0;
  }

  bool get isMiner {
    return miningOutputResource != null;
  }

  bool get availableInStore {
    return storeCost != null;
  }

  bool get canEquip {
    return equipsTool != null;
  }

  bool get canRest {
    return restValue != null;
  }

  bool get canGeneratePower {
    return powerGenerated != null;
  }

  bool get canConsumePower {
    return powerConsumed != null;
  }

  bool get spawnedResourceHasHitbox {
    return spawnedResourceHitboxWidth != null && spawnedResourceHitboxHeight != null;
  }

  bool get showInventoryColumnInResourceContentsMenu {
    if (showInventoryColumnInResourceContentsMenuOverride != null) {
      return showInventoryColumnInResourceContentsMenuOverride!;
    }

    return canConstruct || storageType != StorageType.none;
  }
}
