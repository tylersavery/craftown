import 'package:craftown/src/constants.dart';
import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/inventory_slot.dart';
import 'package:craftown/src/models/recipe.dart';
import 'package:flame/components.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';

const defaultDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.";

@freezed
class Resource with _$Resource {
  const Resource._();

  const factory Resource({
    required String identifier,
    required String name,
    required String assetFileName16,
    @Default(defaultDescription) String description,
    String? assetFileNameLarge,
    @Default(25) int amountPerSlot,
    @Default([]) List<Ingredient> ingredients,
    double? secondsToCraft,
    double? secondsToMine,
    @Default(false) bool canConsume,
    @Default(false) bool canPlace,
    @Default(false) bool canPickUp,
    @Default(false) bool canConstruct,
    @Default(TILE_SIZE) double placementWidth,
    @Default(TILE_SIZE) double placementHeight,
    @Default([]) List<Resource> requiredToMine,
    @Default(0) int slots,
    @Default(0) int resourcesPerSlot,
    @Default(0) int outputSlotSize,
  }) = _Resource;

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
