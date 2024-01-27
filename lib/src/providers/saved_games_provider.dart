import 'package:craftown/src/components/collision_box.dart';
import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/models/saved_game.dart';
import 'package:craftown/src/providers/inventory_provider.dart';
import 'package:craftown/src/providers/placed_resource_detail_provider.dart';
import 'package:craftown/src/providers/placed_resources_provider.dart';
import 'package:craftown/src/providers/player_position_provider.dart';
import 'package:craftown/src/providers/selected_character_provider.dart';
import 'package:craftown/src/providers/toast_messages_provider.dart';
import 'package:craftown/src/screens/game_screen.dart';
import 'package:craftown/src/singletons.dart';
import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/sembast.dart';

class SavedGameProvider extends StateNotifier<List<SavedGame>> {
  final Ref ref;
  final Database db;
  final StoreRef<int, Map<String, Object?>> store = intMapStoreFactory.store("savedGamesv6");

  SavedGameProvider(this.ref, this.db) : super([]);

  Future<void> loadList() async {
    final snapshots = await store.find(db);
    final saves = snapshots.map((record) => SavedGame.fromJson(record.value)).toList();

    state = saves.reversed.toList();
  }

  void loadGame(SavedGame save) {
    ref.read(selectedCharacterProvider.notifier).set(save.character);
    ref.read(inventoryProvider.notifier).set(save.inventory);

    final placedResources = save.placedResources;
    ref.read(placedResourcesProvider.notifier).set(placedResources);

    Future.delayed(Duration(milliseconds: 10), () {
      gameWidgetKey.currentState!.currentGame.player.setPosition(Vector2(save.playerPositionX, save.playerPositionY));

      for (final pr in placedResources) {
        gameWidgetKey.currentState!.currentGame.level.add(pr.sprite);
        final block = CollisionBlock(position: pr.sprite.position, size: pr.sprite.size);
        gameWidgetKey.currentState!.currentGame.level.collisionBlocks.add(block);
        ref.read(placedResourceDetailProvider(pr.sprite.identifier).notifier).setContents(pr.contents);
      }
    });
  }

  Future<void> saveGame() async {
    final playerState = gameWidgetKey.currentState!.currentGame.player;

    final placedResources = ref.read(placedResourcesProvider);

    final List<PlacedResource> updatedPlacedResource = [];
    for (final pr in placedResources) {
      final contents = ref.read(placedResourceDetailProvider(pr.sprite.identifier))?.contents ?? [];
      updatedPlacedResource.add(pr.copyWith(contents: contents));
    }

    final game = SavedGame(
      character: ref.read(selectedCharacterProvider),
      savedAt: DateTime.now(),
      inventory: ref.read(inventoryProvider),
      playerPositionX: playerState.x,
      playerPositionY: playerState.y,
      placedResources: updatedPlacedResource,
    );

    final data = game.toJson();

    store.add(db, data);

    ref.read(toastMessagesProvider.notifier).add("Game Saved");
  }
}

final savedGameProvider = StateNotifierProvider<SavedGameProvider, List<SavedGame>>((ref) {
  return SavedGameProvider(ref, Singletons.instance<Database>());
});
