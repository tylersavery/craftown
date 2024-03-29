// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/toast_message.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:craftown/src/providers/power_available_provider.dart';
import 'package:craftown/src/providers/power_consuming_resources_list_provider.dart';
import 'package:craftown/src/providers/power_consumption_provider.dart';
import 'package:craftown/src/providers/power_generating_resources_list_provider.dart';
import 'package:craftown/src/providers/stats_detail_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/tutorial/tutorial_provider.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'placed_resource_detail_provider.g.dart';

@Riverpod(keepAlive: true)
class PlacedResourceDetail extends _$PlacedResourceDetail {
  Timer? constructorTimer;
  Timer? sellingTimer;
  Timer? powerGeneratingTimer;
  Timer? miningTimer;
  Timer? smeltingTimer;

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

  bool startConstruction() {
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

    ref.read(powerConsumingResourcesListProvider.notifier).add(state!);
    state = state!.copyWith(isConstructing: true);

    constructorTimer = Timer.periodic(Duration(seconds: state!.selectedRecipe!.secondsToCraft!.round()), (timer) {
      if (state == null) return;

      if (!_powerAvailableGuard()) {
        return;
      }

      final recipe = state!.selectedRecipe!;

      final resources = state!.contents.expand((element) => element).toList();

      for (final ingredient in recipe.ingredients) {
        final available = resources.where((r) => r.identifier == ingredient.resource.identifier).toList().length;
        if (available < ingredient.quantity) {
          stopConstruction();
          print("Not enough ${ingredient.resource.name} to produce ${recipe.name}");
          return;
        }
      }

      final outputCount = state!.outputSlotContents.length;

      if (outputCount >= state!.sprite.resource.outputSlotSize) {
        print("Output is full");
        stopConstruction();
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

    ref.read(powerConsumingResourcesListProvider.notifier).remove(state!);
    state = state!.copyWith(isConstructing: false);
  }

  void toggleSmelting() {
    if (state == null) {
      print("PlacedResources state is null");
      return;
    }

    if (state!.isSmelting) {
      stopSmelting();
    } else {
      startSmelting();
    }
  }

  bool startSmelting() {
    if (state == null) {
      print("PlacedResources state is null");
      return false;
    }

    if (!state!.sprite.resource.canSmelt) {
      print("Can't smelt");
      return false;
    }

    final resources = state!.contents.expand((element) => element).toList();
    if (resources.isEmpty) {
      ref.read(toastMessagesListProvider.notifier).add("No resources to smelt.");
      return false;
    }

    final inputResource = resources.first;
    final outputResourceIdentifer = inputResource.smeltsInto;

    final outputResource = Resources.all.firstWhereOrNull((r) => r.identifier == outputResourceIdentifer);
    if (outputResource == null || outputResource.secondsToSmelt == null) {
      ref.read(toastMessagesListProvider.notifier).add("${inputResource.name} can't be smelted.");
      return false;
    }

    state = state!.copyWith(isSmelting: true);
    ref.read(powerConsumingResourcesListProvider.notifier).add(state!);
    smeltingTimer = Timer.periodic(Duration(seconds: outputResource.secondsToSmelt!.round()), (timer) {
      if (state == null) return;
      if (!_powerAvailableGuard()) {
        return;
      }
      final resources = state!.contents.expand((element) => element).toList();

      for (final ingredient in outputResource.ingredients) {
        final available = resources.where((r) => r.identifier == ingredient.resource.identifier).toList().length;
        if (available < ingredient.quantity) {
          stopSmelting();
          print("Not enough ${ingredient.resource.name} to produce ${outputResource.name}");
          return;
        }
      }

      final outputCount = state!.outputSlotContents.length;

      if (outputCount >= state!.sprite.resource.outputSlotSize) {
        print("Output is full");
        stopSmelting();
        return;
      }

      for (final ingredient in outputResource.ingredients) {
        removeFromAnySlot(ingredient.resource, count: ingredient.quantity);
      }

      addToOutputSlot(outputResource);
    });

    return true;
  }

  void stopSmelting() {
    if (smeltingTimer != null) {
      smeltingTimer!.cancel();
      smeltingTimer = null;
    }

    if (state == null) {
      print("PlacedResources state is null");
      return;
    }
    ref.read(powerConsumingResourcesListProvider.notifier).remove(state!);
    state = state!.copyWith(isSmelting: false);
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

  bool startSelling() {
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
      if (state == null) return;
      final resources = state!.contents.expand((element) => element).toList().where((element) => element.saleValue > 0).toList();

      if (resources.isEmpty) {
        stopSelling();
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

    if (state == null) {
      print("PlacedResources state is null");
      return;
    }

    state = state!.copyWith(isSelling: false);
  }

  void togglePowerGenerating() {
    if (state == null) {
      print("PlacedResources state is null");
      return;
    }

    if (state!.isPowerGenerating) {
      stopPowerGenerating();
    } else {
      startPowerGenerating();
    }
  }

  void _powerGeneratorTick() {
    if (state == null) return;

    if (ref.read(powerConsumptionProvider) == 0) {
      ref.read(tutorialProvider.notifier).checkProgress();
      return;
    }

    final fuelOptions = state!.sprite.resource.fuelResourceOptions;

    if (fuelOptions.isEmpty) {
      return;
    }

    final resources = state!.contents.expand((element) => element).toList().where((r) => fuelOptions.contains(r)).toList();

    if (resources.isEmpty) {
      stopPowerGenerating();
      return;
    }

    ref.read(tutorialProvider.notifier).checkProgress();

    final r = randomItemInList(resources);
    removeFromAnySlot(r);
  }

  bool startPowerGenerating() {
    if (state == null) {
      print("PlacedResources state is null");
      return false;
    }

    state = state!.copyWith(isPowerGenerating: true);
    ref.read(powerGeneratingResourcesListProvider.notifier).add(state!);

    _powerGeneratorTick();

    powerGeneratingTimer = Timer.periodic(Duration(seconds: state!.sprite.resource.powerFuelConsumptionSeconds), (timer) {
      _powerGeneratorTick();
    });
    return true;
  }

  void stopPowerGenerating() {
    if (powerGeneratingTimer != null) {
      powerGeneratingTimer!.cancel();
      powerGeneratingTimer = null;
    }

    if (state == null) {
      print("PlacedResources state is null");
      return;
    }
    ref.read(powerGeneratingResourcesListProvider.notifier).remove(state!);

    state = state!.copyWith(isPowerGenerating: false);
  }

  void toggleMining() {
    if (state == null) {
      print("PlacedResources state is null");
      return;
    }

    if (state!.isMining) {
      stopMining();
    } else {
      startMining();
    }
  }

  bool startMining() {
    if (state == null) {
      print("PlacedResources state is null");
      return false;
    }
    if (!state!.sprite.resource.isMiner && state!.sprite.resource.miningOutputResource != null) {
      print("Can't mine");
      return false;
    }

    state = state!.copyWith(isMining: true);
    ref.read(powerConsumingResourcesListProvider.notifier).add(state!);

    miningTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (state == null) return;
      if (!_powerAvailableGuard()) {
        return;
      }
      final outputCount = state!.outputSlotContents.length;

      if (outputCount >= state!.sprite.resource.outputSlotSize) {
        print("Output is full");
        stopMining();
        return;
      }

      addToOutputSlot(state!.sprite.resource.miningOutputResource!);
    });
    return true;
  }

  void stopMining() {
    if (miningTimer != null) {
      miningTimer!.cancel();
      miningTimer = null;
    }

    if (state == null) {
      print("PlacedResources state is null");
      return;
    }
    ref.read(powerConsumingResourcesListProvider.notifier).remove(state!);

    state = state!.copyWith(isMining: false);
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

  bool _powerAvailableGuard() {
    final powerUse = ref.read(powerConsumptionProvider);
    final powerAvail = ref.read(powerAvailableProvider);

    if (powerUse > powerAvail) {
      stopConstruction();
      stopMining();
      stopSmelting();

      final possiblePlacedResources = ref.watch(placedResourcesListProvider).where((pr) => pr.sprite.resource.canGeneratePower).toList();
      final List<String> placedResourceIdentifiers = possiblePlacedResources.map((pr) => pr.uniqueIdentifier).toList();

      for (final identifier in placedResourceIdentifiers) {
        final pr = ref.read(placedResourceDetailProvider(identifier).notifier);
        pr.stopPowerGenerating();
        ref.read(toastMessagesListProvider.notifier).add("Power surge!!", type: ToastMessageType.error, identifierOverride: "power_surge");
      }

      return false;
    }

    return true;
  }
}
