// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/toast_message.dart';
import 'package:craftown/src/providers/placed_resources_provider.dart';
import 'package:craftown/src/providers/toast_messages_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

class PlacedResourceDetailedProvider extends StateNotifier<PlacedResource?> {
  final Ref ref;
  PlacedResourceDetailedProvider(this.ref, PlacedResource? placedResource) : super(placedResource);

  selectRecipe(Resource? recipe) {
    if (state == null) {
      print("PlacedResources state is null");
      return;
    }
    state = state!.copyWith(selectedRecipe: recipe);
  }

  List<Resource>? removeContents(int slotIndex, int count) {
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
      ref.read(toastMessagesProvider.notifier).add(
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
}

final placedResourceDetailProvider = StateNotifierProvider.family<PlacedResourceDetailedProvider, PlacedResource?, String>((ref, identifier) {
  final placedResource = ref.watch(placedResourcesProvider).firstWhereOrNull((p) => p.sprite.identifier == identifier);

  return PlacedResourceDetailedProvider(
    ref,
    placedResource,
  );
});
