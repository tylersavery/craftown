import 'package:craftown/src/constants.dart';
import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/inventory_slot.dart';
import 'package:craftown/src/models/tool.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

const defaultDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.";

enum StorageType {
  none("none"),
  all("all"),
  liquid("liquid"),
  solid("solid"),
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
    @Default(32.0) double interactionRadius,
    double? secondsToCraft,
    double? secondsToMine,
    String? miningToolRequiredIdentifier,
    @Default(0) double hungerDecreaseOnConsumption,
    @Default(0) double thirstDecreaseOnConsumption,
    @Default(false) bool canPlace,
    @Default(false) bool canPickUp,
    @Default(false) bool canConstruct,
    @Default(TILE_SIZE) double placementWidth,
    @Default(TILE_SIZE) double placementHeight,
    @Default([]) List<Resource> requiredToMine,
    @Default(0) int slots,
    @JsonKey(toJson: storageTypeToJson, fromJson: storageTypeFromJson) @Default(StorageType.none) StorageType storageType,
    @Default(0) int resourcesPerSlot,
    @Default(0) int outputSlotSize,
    @Default(false) bool isSeed,
    @Default(5) int secondsToGrow,
    Resource? growsInto,
    @Default(1) int farmYieldMin,
    @Default(1) int farmYieldMax,
    @Default(false) bool contentsWillSell,
    @Default(0) int saleValue,
    Resource? miningOutputResource,
    @Default(null) List<Resource>? canOnlyBePlacedOn,
    double? restValue,
    int? storeCost,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);

  String get assetPath16 {
    return "assets/images/resources/$assetFileName16";
  }

  String get assetFileNameLargeWithFallback {
    return assetFileNameLarge ?? assetFileName16;
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

  bool get canRest {
    return restValue != null;
  }

  bool canCraft(List<InventorySlot> slots) {
    Map<String, int> data = {};

    for (final slot in slots) {
      if (slot.resource != null) {
        final key = slot.resource!.identifier;

        if (data.containsKey(key)) {
          data[key] = (data[key] ?? 0) + slot.count;
        } else {
          data[key] = slot.count;
        }
      }
    }

    for (final ingredient in ingredients) {
      final key = ingredient.resource.identifier;
      if (!data.containsKey(key)) {
        return false;
      }

      if ((data[key] ?? 0) < ingredient.quantity) {
        return false;
      }
    }

    return true;
  }
}
