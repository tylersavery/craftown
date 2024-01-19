// ignore_for_file: depend_on_referenced_packages

import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/toast_message.dart';
import 'package:craftown/src/providers/toast_messages_provider.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

//TODO: maybe refactor as a family?
class PlacedResourcesProvider extends StateNotifier<List<PlacedResource>> {
  final Ref ref;
  PlacedResourcesProvider(this.ref) : super([]);

  selectRecipe(String identifier, Resource? recipe) {
    final index = state.indexWhere((p) => p.sprite.identifier == identifier);
    if (index >= 0) {
      final placedResource = state[index];

      state = [...state]
        ..removeAt(index)
        ..insert(
          index,
          placedResource.copyWith(selectedRecipe: recipe),
        );
      return true;
    }

    return false;
  }

  add(ResourceSprite sprite) {
    state = [
      ...state,
      PlacedResource(sprite: sprite, contents: List.generate(sprite.resource.slots, (_) => [])),
    ];
  }

  Resource? removeContents(String identifier, int slotIndex) {
    final index = state.indexWhere((p) => p.sprite.identifier == identifier);

    if (index >= 0) {
      final placedResource = state[index];
      final contentsOfSlot = placedResource.contents[slotIndex];
      if (contentsOfSlot.isEmpty) {
        return null;
      }

      final updatedContents = [...placedResource.contents];

      final resource = updatedContents[slotIndex].first;

      updatedContents[slotIndex] = [...updatedContents[slotIndex]..removeLast()];

      state = [...state]
        ..removeAt(index)
        ..insert(
          index,
          placedResource.copyWith(
            contents: updatedContents,
          ),
        );
      return resource;
    }
    return null;
  }

  bool addContents(String identifier, Resource resource) {
    final index = state.indexWhere((p) => p.sprite.identifier == identifier);

    if (index >= 0) {
      final placedResource = state[index];

      //todo: handle multiple slots
      const slotIndex = 0;
      final contentsOfSlot = placedResource.contents[slotIndex];

      if (contentsOfSlot.isNotEmpty && contentsOfSlot.first.identifier != resource.identifier) {
        ref.read(toastMessagesProvider.notifier).add(
              "No room to add ${resource.name}.",
              type: ToastMessageType.error,
            );

        return false;
      }

      final updatedContents = [...placedResource.contents];
      updatedContents[0] = [...contentsOfSlot, resource];

      state = [...state]
        ..removeAt(index)
        ..insert(
          index,
          placedResource.copyWith(
            contents: updatedContents,
          ),
        );

      return true;
    }
    return false;
  }
}

final placedResourcesProvider = StateNotifierProvider<PlacedResourcesProvider, List<PlacedResource>>((ref) {
  return PlacedResourcesProvider(ref);
});
