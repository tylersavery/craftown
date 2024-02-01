// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/toast_message.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:craftown/src/providers/stats_detail_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'placed_resource_detail_provider.g.dart';

@riverpod
class PlacedResourceDetail extends _$PlacedResourceDetail {
  Timer? constructorTimer;
  Timer? sellingTimer;

  @override
  PlacedResource? build(String arg) {
    return ref.read(placedResourcesListProvider).firstWhereOrNull((p) => p.uniqueIdentifier == arg);
  }

  selectRecipe(Resource? recipe) {
    if (state == null) {
      print("PlacedResources state is null");
      return;
    }
    state = state!.copyWith(selectedRecipe: recipe);

    if (recipe != null && constructorTimer != null) {
      stopConstruction();
    }
  }

  void toggleConstruction() {
    if (state == null) {
      print("PlacedResources state is null");
      return;
    }

    if (state!.isConstructing) {
      stopConstruction();
    } else {
      startConstruction();
    }
  }

  bool startConstruction({bool automaticStop = false}) {
    if (state == null) {
      print("PlacedResources state is null");
      return false;
    }

    if (!state!.sprite.resource.canConstruct) {
      print("Can't construct");
      return false;
    }

    if (state!.selectedRecipe == null) {
      print("no recipe set");
      return false;
    }

    if (state!.selectedRecipe!.secondsToCraft == null) {
      print("recipe can not be crafted");
      return false;
    }

    state = state!.copyWith(isConstructing: true);

    constructorTimer = Timer.periodic(Duration(seconds: state!.selectedRecipe!.secondsToCraft!.round()), (timer) {
      final recipe = state!.selectedRecipe!;

      final resources = state!.contents.expand((element) => element).toList();

      for (final ingredient in recipe.ingredients) {
        final available = resources.where((r) => r.identifier == ingredient.resource.identifier).toList().length;
        if (available < ingredient.quantity) {
          if (automaticStop) {
            stopConstruction();
          }
          // print("Not enough ${ingredient.resource.name} to produce ${recipe.name}");
          return;
        }
      }

      final outputCount = state!.outputSlotContents.length;

      if (outputCount >= state!.sprite.resource.outputSlotSize) {
        print("Output is full");
        if (automaticStop) {
          stopConstruction();
        }
        return;
      }

      for (final ingredient in recipe.ingredients) {
        removeFromAnySlot(ingredient.resource, count: ingredient.quantity);
      }

      addToOutputSlot(recipe);
    });

    return true;
  }

  void stopConstruction() {
    if (constructorTimer != null) {
      constructorTimer!.cancel();
      constructorTimer = null;
    }

    if (state == null) {
      print("PlacedResources state is null");
      return;
    }

    state = state!.copyWith(isConstructing: false);
  }

  void toggleSelling() {
    if (state == null) {
      print("PlacedResources state is null");
      return;
    }

    if (state!.isSelling) {
      stopSelling();
    } else {
      startSelling();
    }
  }

  bool startSelling({bool automaticStop = false}) {
    if (state == null) {
      print("PlacedResources state is null");
      return false;
    }
    if (!state!.sprite.resource.contentsWillSell) {
      print("Can't sell contents");
      return false;
    }

    state = state!.copyWith(isSelling: true);

    sellingTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      final resources = state!.contents.expand((element) => element).toList().where((element) => element.saleValue > 0).toList();

      if (resources.isEmpty) {
        if (automaticStop) {
          stopSelling();
        }
        return;
      }

      final r = randomItemInList(resources);
      final removed = removeFromAnySlot(r);
      if (removed != null && removed.isNotEmpty) {
        ref.read(statsDetailProvider.notifier).increaseDollars(r.saleValue);
      }
    });
    return true;
  }

  void stopSelling() {
    if (sellingTimer != null) {
      sellingTimer!.cancel();
      sellingTimer = null;
    }

    if (state != null) {
      print("PlacedResources state is null");
      return;
    }

    state = state!.copyWith(isSelling: false);
  }

  List<Resource>? removeFromAnySlot(
    Resource resource, {
    int count = 1,
  }) {
    if (state == null) {
      print("PlacedResources state is null");
      return null;
    }

    int totalRemaingingToRemove = count;
    List<Resource> removed = [];

    final updatedContents = [...state!.contents];

    for (final entry in state!.contents.asMap().entries) {
      if (totalRemaingingToRemove <= 0) {
        break;
      }
      final index = entry.key;

      List<Resource> slot = entry.value;
      final amountAvailable = slot.where((r) => r.identifier == resource.identifier).toList().length;
      if (amountAvailable >= totalRemaingingToRemove) {
        while (totalRemaingingToRemove > 0) {
          if (updatedContents[index].isEmpty) {
            break;
          }
          final removedResource = updatedContents[index].removeLast();
          removed.add(removedResource);
          totalRemaingingToRemove -= 1;
        }
      }
    }

    state = state!.copyWith(contents: updatedContents);

    return removed;
  }

  List<Resource>? removeContents(int slotIndex, [int count = 1]) {
    if (state == null) {
      print("PlacedResources state is null");
      return null;
    }

    if (state!.contents[slotIndex].isEmpty) {
      print("Nothing to remove in slot $slotIndex");
      return null;
    }

    final amountToRemove = min(count, state!.contents[slotIndex].length);

    final List<Resource> removedResources = [];
    final updatedContents = [...state!.contents];

    for (int i = 0; i < amountToRemove; i++) {
      final resource = [...state!.contents[slotIndex]].removeLast();
      removedResources.add(resource);
      updatedContents[slotIndex].removeLast();
    }

    state = state!.copyWith(contents: updatedContents);

    return removedResources;
  }

  setContents(List<List<Resource>> items) {
    if (state == null) {
      print("PlacedResources state is null");
      return;
    }
    state = state!.copyWith(contents: items);
  }

  setOutput(List<Resource> items) {
    if (state == null) {
      print("PlacedResources state is null");
      return;
    }
    state = state!.copyWith(outputSlotContents: items);
  }

  bool addContents(Resource resource) {
    if (state == null) {
      print("PlacedResources state is null");
      return false;
    }

    int slotIndex = 0;
    bool hasRoom = false;

    while (slotIndex < state!.sprite.resource.slots) {
      if (state!.contents[slotIndex].isEmpty) {
        // it's empty, we are good
        hasRoom = true;
        break;
      }

      if (state!.contents[slotIndex].first.identifier == resource.identifier) {
        // same resource
        if (state!.sprite.resource.resourcesPerSlot > state!.contents[slotIndex].length) {
          // there's still room in this slot
          hasRoom = true;

          break;
        }
      }

      slotIndex += 1;
    }

    if (!hasRoom) {
      ref.read(toastMessagesListProvider.notifier).add(
            "No room to add ${resource.name}.",
            type: ToastMessageType.error,
          );

      return false;
    }

    final contentsOfSlot = state!.contents[slotIndex];

    final updatedContents = [...state!.contents];
    updatedContents[slotIndex] = [...contentsOfSlot, resource];

    state = state!.copyWith(contents: updatedContents);
    return true;
  }

  bool addToOutputSlot(Resource resource) {
    if (state == null) {
      print("PlacedResources state is null");
      return false;
    }
    if (state!.outputSlotContents.length >= state!.sprite.resource.outputSlotSize) {
      print("No Room");
      return false;
    }

    if (state!.outputSlotContents.isNotEmpty && state!.outputSlotContents.first.identifier != resource.identifier) {
      print("Can't combine different resource types in output");
      return false;
    }

    state = state!.copyWith(outputSlotContents: [...state!.outputSlotContents, resource]);
    return true;
  }

  List<Resource> removeFromOutputSlot([int count = 1]) {
    if (state == null) {
      print("PlacedResources state is null");
      return [];
    }

    final amountToRemove = min(count, state!.outputSlotContents.length);
    final updatedContents = [...state!.outputSlotContents];

    final List<Resource> resourcesRemoved = [];
    for (int i = 0; i < amountToRemove; i++) {
      final resourceRemoved = updatedContents.removeLast();
      resourcesRemoved.add(resourceRemoved);
    }

    state = state!.copyWith(outputSlotContents: updatedContents);
    return resourcesRemoved;
  }
}
