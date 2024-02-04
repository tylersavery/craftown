import 'package:craftown/src/components/level.dart';
import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/menus/providers/inventory_menu_provider.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/screens/game_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'placed_resources_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PlacedResourcesList extends _$PlacedResourcesList {
  // final Ref ref;
  // PlacedResourcesProvider(this.ref) : super([]);

  @override
  List<PlacedResource> build() {
    return [];
  }

  set(List<PlacedResource> items) {
    state = items;
  }

  add(String uniquePlacementIdentifier, ResourceSprite sprite, int tileX, int tileY) {
    sprite.placementUniqueIdentifier = uniquePlacementIdentifier;

    state = [
      ...state,
      PlacedResource(
        sprite: sprite,
        uniqueIdentifier: uniquePlacementIdentifier,
        contents: List.generate(
          sprite.resource.slots,
          (_) => [],
        ),
        tileX: tileX,
        tileY: tileY,
      ),
    ];
  }

  bool pickup(PlacedResource item) {
    final inputs = item.contents.expand((item) => item).toList();
    final outputs = item.outputSlotContents;

    // grab all inputs, outputs, and the resource itself
    for (final r in [...inputs, ...outputs, item.sprite.resource]) {
      final success = ref.read(inventoryListProvider.notifier).addResource(r);

      //TODO: add this back in when ready to test

      // if (!success) {
      //   ref.read(toastMessagesListProvider.notifier).add("Not enough room to move everything");
      //   return false;
      // }
    }

    //TODO: some funky stuff happening with multiple dudes - need a better identifier method perhaps

    final index = ref.read(inventoryListProvider).indexWhere((element) => element.resource?.identifier == item.sprite.resource.identifier);
    if (index > -1) {
      ref.read(inventoryMenuProvider.notifier).setSelected(index);
    }

    if (gameWidgetKey.currentState == null) {
      print("GameState NULL");
      return false;
    }

    final gameComponent = gameWidgetKey.currentState!.currentGame.level.children.firstWhere((element) {
      if (element is ResourceSprite) {
        if (element.placementUniqueIdentifier == item.uniqueIdentifier) {
          return true;
        }
      }
      return false;
    });

    gameWidgetKey.currentState!.currentGame.level.remove(gameComponent);

    // TODO: Perhaps a better way to do this (tie the two together)

    final level = gameWidgetKey.currentState!.currentGame.level;

    final collisionBlockIndex = level.collisionBlocks.indexWhere(
      (element) => element.x == item.sprite.x && element.y == item.sprite.y,
    );
    if (collisionBlockIndex >= 0) {
      level.collisionBlocks.removeAt(collisionBlockIndex);
    }

    return true;
  }
}
