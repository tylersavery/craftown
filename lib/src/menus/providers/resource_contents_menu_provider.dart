// ignore_for_file: depend_on_referenced_packages

import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/menus/models/resource_contents_menu_state.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

class ResourceContentsMenuProvider extends StateNotifier<ResourceContentsMenuState> {
  final Ref ref;
  ResourceContentsMenuProvider(this.ref, ResourceContentsMenuState initialState) : super(initialState);

  void openWith(ResourceSprite sprite) {
    final placedResource = ref.read(placedResourcesListProvider).firstWhereOrNull((p) => p.uniqueIdentifier == sprite.placementUniqueIdentifier);

    if (placedResource == null) {
      print("placed resource null");
      return;
    }

    state = state.copyWith(isOpen: true, placedResource: placedResource);
  }

  void close() {
    state = state.copyWith(isOpen: false, placedResource: null);
  }
}

final resourceContentsMenuProvider = StateNotifierProvider<ResourceContentsMenuProvider, ResourceContentsMenuState>((ref) {
  final initialState = ResourceContentsMenuState();
  return ResourceContentsMenuProvider(ref, initialState);
});
