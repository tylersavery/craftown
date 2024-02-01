import 'dart:math';

import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/inventory_slot.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/stats_detail_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'inventory_list_provider.g.dart';

@Riverpod(keepAlive: true)
class InventoryList extends _$InventoryList {
  @override
  List<InventorySlot> build() {
    final initialState = List.generate(
      16,
      (index) => InventorySlot(resource: null, count: 0),
    );

    initialState[0] = InventorySlot(resource: Resources.wood, count: 50);
    initialState[1] = InventorySlot(resource: Resources.iron, count: 50);
    initialState[2] = InventorySlot(resource: Resources.water, count: 5);
    initialState[3] = InventorySlot(resource: Resources.woodenBucket, count: 1);
    initialState[4] = InventorySlot(resource: Resources.barrel, count: 2);
    initialState[5] = InventorySlot(resource: Resources.communityChest, count: 2);
    initialState[6] = InventorySlot(resource: Resources.constructorA, count: 2);
    initialState[7] = InventorySlot(resource: Resources.carrotSeed, count: 16);
    initialState[8] = InventorySlot(resource: Resources.well, count: 3);
    initialState[9] = InventorySlot(resource: Resources.minerA, count: 2);
    initialState[10] = InventorySlot(resource: Resources.mineralMiner, count: 3);

    return initialState;
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

    ref.read(statsDetailProvider.notifier).increaseEnergy(resource.energyWhenConsumed);
  }
}
