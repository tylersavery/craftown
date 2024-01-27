import 'package:collection/collection.dart';
import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/providers/inventory_menu_provider.dart';
import 'package:craftown/src/providers/inventory_provider.dart';
import 'package:craftown/src/providers/placed_resource_detail_provider.dart';
import 'package:craftown/src/providers/resource_in_hand_provider.dart';
import 'package:craftown/src/providers/toast_messages_provider.dart';
import 'package:craftown/src/screens/game_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacedResourcesProvider extends StateNotifier<List<PlacedResource>> {
  final Ref ref;
  PlacedResourcesProvider(this.ref) : super([]);

  set(List<PlacedResource> items) {
    state = items;
  }

  add(ResourceSprite sprite) {
    state = [
      ...state,
      PlacedResource(sprite: sprite, contents: List.generate(sprite.resource.slots, (_) => [])),
    ];
  }

  bool pickup(PlacedResource item) {
    final inputs = item.contents.expand((item) => item).toList();
    final outputs = item.outputSlotContents;

    for (final r in [...inputs, ...outputs, item.sprite.resource]) {
      final success = ref.read(inventoryProvider.notifier).addResource(r);

      //TODO: add this back in when ready to test

      // if (!success) {
      //   ref.read(toastMessagesProvider.notifier).add("Not enough room to move everything");
      //   return false;
      // }
    }

    //TODO: some funky stuff happening with multiple dudes - need a better identifier method perhaps

    final index = ref.read(inventoryProvider).indexWhere((element) => element.resource?.identifier == item.sprite.resource.identifier);
    if (index > -1) {
      ref.read(inventoryMenuProvider.notifier).setSelected(index);
    }

    final gameComponent = gameWidgetKey.currentState!.currentGame.level.children.firstWhere((element) {
      if (element is ResourceSprite) {
        if (element.identifier == item.sprite.identifier) {
          return true;
        }
      }
      return false;
    });

    gameWidgetKey.currentState!.currentGame.level.remove(gameComponent);
    //TODO: remove collision box!

    final collisionBlockIndex = gameWidgetKey.currentState!.currentGame.level.collisionBlocks.indexWhere(
      (element) => element.x == item.sprite.x && element.y == item.sprite.y,
    );

    if (collisionBlockIndex >= 0) {
      gameWidgetKey.currentState!.currentGame.level.collisionBlocks.removeAt(collisionBlockIndex);
    }

    // ref.invalidate(placedResourceDetailProvider(item.sprite.identifier));
    state = [...state]..removeWhere((element) => element.sprite.identifier == item.sprite.identifier);

    return true;
  }
}

final placedResourcesProvider = StateNotifierProvider<PlacedResourcesProvider, List<PlacedResource>>((ref) {
  return PlacedResourcesProvider(ref);
});
