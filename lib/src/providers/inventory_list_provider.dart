import 'dart:math';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/data/spawn_state.dart';
import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/inventory_slot.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/stats_detail_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'inventory_list_provider.g.dart';

@Riverpod(keepAlive: true)
class InventoryList extends _$InventoryList {
  @override
  List<InventorySlot> build() {
    return DEBUG_INVENTORY ? SpawnState.inventoryDebug : SpawnState.inventory;
  }

  void set(List<InventorySlot> inventory) {
    state = inventory;
  }

  int totalResourcesWithIdentifier(String identifier) {
    return state.fold(0, (previousValue, slot) {
      if (slot.resource?.identifier == identifier) {
        return previousValue + slot.count;
      }

      return previousValue;
    });
  }

  void removeIngredients(List<Ingredient> ingredients) {
    for (final ingredient in ingredients) {
      removeResource(ingredient.resource, ingredient.quantity);
    }
  }

  void removeResource(Resource resource, [int quantity = 1]) {
    int totalRemoved = 0;

    for (int index = 0; index < state.length; index++) {
      if (totalRemoved >= quantity) {
        break;
      }

      final slot = state[index];

      if (slot.resource == null) {
        continue;
      }

      if (slot.resource!.identifier == resource.identifier) {
        if (slot.count > quantity - totalRemoved) {
          final removeNow = quantity - totalRemoved;

          totalRemoved += removeNow;

          final newCount = slot.count - removeNow;

          state = [...state]
            ..removeAt(index)
            ..insert(
              index,
              InventorySlot(
                resource: resource,
                count: newCount,
              ),
            );
          break;
        } else {
          totalRemoved += min(slot.count, (quantity - totalRemoved));

          state = [...state]
            ..removeAt(index)
            ..insert(index, InventorySlot(resource: null));
        }
      }
    }
  }

  bool addResource(Resource resource) {
    for (final entry in state.asMap().entries) {
      final index = entry.key;
      final slot = entry.value;

      if (slot.resource == null) {
        continue;
      }
      if (slot.resource!.identifier == resource.identifier) {
        if (slot.count < resource.amountPerSlot) {
          state = [...state]
            ..removeAt(index)
            ..insert(
              index,
              InventorySlot(
                resource: resource,
                count: slot.count + 1,
              ),
            );
          return true;
        }
      }
    }

    final emptySlotIndex = state.indexWhere((slot) => slot.resource == null);
    if (emptySlotIndex >= 0) {
      state = [...state]
        ..removeAt(emptySlotIndex)
        ..insert(
          emptySlotIndex,
          InventorySlot(
            resource: resource,
            count: 1,
          ),
        );
      return true;
    }

    ref.read(toastMessagesListProvider.notifier).add("No room in inventory");

    return false;
  }

  void consume(Resource resource, [int count = 1]) {
    if (!resource.canConsume) {
      print("Can't consume");
      return;
    }

    if (totalResourcesWithIdentifier(resource.identifier) < count) {
      print("Not enough to consume");
      return;
    }

    removeResource(resource, count);

    ref.read(statsDetailProvider.notifier).decreaseHunger(resource.hungerDecreaseOnConsumption);
    ref.read(statsDetailProvider.notifier).decreaseThirst(resource.thirstDecreaseOnConsumption);
  }
}
