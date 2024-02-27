// ignore_for_file: depend_on_referenced_packages

import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/menus/models/resource_contents_menu_state.dart';
import 'package:craftown/src/providers/audio_provider.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resource_contents_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class ResourceContentsMenu extends _$ResourceContentsMenu {
  @override
  ResourceContentsMenuState build() {
    return ResourceContentsMenuState();
  }

  void _playSound() {
    ref.read(audioNotifierProvider.notifier).playRandomBlip();
  }

  void openWith(ResourceSprite sprite) {
    _playSound();
    final placedResource = ref.read(placedResourcesListProvider).firstWhereOrNull((p) => p.uniqueIdentifier == sprite.placementUniqueIdentifier);

    if (placedResource == null) {
      print("placed resource null");
      return;
    }

    state = state.copyWith(isOpen: true, placedResource: placedResource);
  }

  void close() {
    _playSound();
    state = state.copyWith(isOpen: false, placedResource: null);
  }
}
