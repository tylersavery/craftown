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
    @Default(false) bool canConsume,
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
