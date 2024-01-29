import 'package:craftown/src/components/collision_box.dart';
import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:craftown/src/models/farmland.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/models/saved_game.dart';
import 'package:craftown/src/providers/farmland_detail_provider.dart';
import 'package:craftown/src/providers/farmland_provider.dart';
import 'package:craftown/src/providers/inventory_provider.dart';
import 'package:craftown/src/providers/placed_resource_detail_provider.dart';
import 'package:craftown/src/providers/placed_resources_provider.dart';
import 'package:craftown/src/providers/resource_in_hand_provider.dart';
import 'package:craftown/src/providers/selected_character_provider.dart';
import 'package:craftown/src/providers/stats_provider.dart';
import 'package:craftown/src/providers/toast_messages_provider.dart';
import 'package:craftown/src/screens/game_screen.dart';
import 'package:craftown/src/singletons.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/sembast.dart';

class SavedGameProvider extends StateNotifier<List<SavedGame>> {
  final Ref ref;
  final Database db;
  final StoreRef<int, Map<String, Object?>> store = intMapStoreFactory.store("savedGamesv13");

  SavedGameProvider(this.ref, this.db) : super([]);

  Future<void> loadList() async {
    final snapshots = await store.find(db);
    final saves = snapshots.map((record) => SavedGame.fromJson(record.value)).toList();

    state = saves.reversed.toList();
  }

  void loadGame(SavedGame save) {
    ref.read(selectedCharacterProvider.notifier).set(save.character);
    ref.read(inventoryProvider.notifier).set(save.inventory);
    ref.read(statsProvider.notifier).set(save.stats);
    ref.read(resourceInHandProvider.notifier).set(save.inHand);

    // Placed Resources
    final placedResources = save.placedResources;
    final placedResourcesWithUpdatedSprite = placedResources
        .map(
          (pr) => pr.copyWith(sprite: pr.sprite..placementUniqueIdentifier = pr.uniqueIdentifier),
        )
        .toList();

    ref.read(placedResourcesProvider.notifier).set(placedResourcesWithUpdatedSprite);

    // Farming

    Future.delayed(Duration(milliseconds: 10), () {
      gameWidgetKey.currentState!.currentGame.player.setPosition(Vector2(save.playerPositionX, save.playerPositionY));

      for (final pr in placedResources) {
        gameWidgetKey.currentState!.currentGame.level.add(pr.sprite);
        final block = CollisionBlock(position: pr.sprite.position, size: pr.sprite.size);
        gameWidgetKey.currentState!.currentGame.level.collisionBlocks.add(block);
        final detailProvider = ref.read(placedResourceDetailProvider(pr.uniqueIdentifier).notifier);
        detailProvider.setContents(pr.contents);
        detailProvider.setOutput(pr.outputSlotContents);
        detailProvider.selectRecipe(pr.selectedRecipe);
        if (pr.isConstructing) {
          detailProvider.startConstruction();
        }

        if (pr.isSelling) {
          detailProvider.startSelling();
        }
      }

      final farmlands = save.farmlands;

      final sprites = gameWidgetKey.currentState!.currentGame.level.children;
      int i = 0;
      for (final sprite in sprites) {
        if (sprite is FarmlandSprite) {
          final fl = farmlands[i];
          sprite.identifier = fl.identifier;
          sprite.seed = fl.seed;
          sprite.completeAt = fl.completeAt;
          sprite.current = fl.state;
          i++;
        }
      }

      ref.read(farmlandProvider.notifier).set(farmlands);
    });
  }

  Future<void> saveGame(String filename, {SavedGame? overwrite}) async {
    final playerState = gameWidgetKey.currentState!.currentGame.player;

    final placedResources = ref.read(placedResourcesProvider);

    final List<PlacedResource> updatedPlacedResources = [];
    for (final pr in placedResources) {
      if (pr.sprite.placementUniqueIdentifier != null) {
        final detailState = ref.read(placedResourceDetailProvider(pr.sprite.placementUniqueIdentifier!));

        if (detailState != null) {
          final updatedPr = pr.copyWith(
            contents: detailState.contents,
            outputSlotContents: detailState.outputSlotContents,
            isConstructing: detailState.isConstructing,
            selectedRecipe: detailState.selectedRecipe,
            isSelling: detailState.isSelling,
          );

          updatedPlacedResources.add(updatedPr);
        } else {
          print("POSSIBLE ISSUE!");
          updatedPlacedResources.add(pr);
        }
      }
    }

    final farmlands = ref.read(farmlandProvider);

    final List<Farmland> updatedFarmlands = [];

    for (final f in farmlands) {
      final farmland = ref.read(farmlandDetailProvider(f.identifier));
      if (farmland != null) {
        updatedFarmlands.add(farmland);
      }
    }

    final game = SavedGame(
      identifier: overwrite?.identifier ?? randomString(),
      fileName: filename.isNotEmpty ? filename : ref.read(selectedCharacterProvider).name,
      character: ref.read(selectedCharacterProvider),
      savedAt: DateTime.now(),
      inventory: ref.read(inventoryProvider),
      playerPositionX: playerState.x,
      playerPositionY: playerState.y,
      placedResources: updatedPlacedResources,
      stats: ref.read(statsProvider),
      inHand: ref.read(resourceInHandProvider),
      farmlands: updatedFarmlands,
    );

    final data = game.toJson();

    if (overwrite != null) {
      final id = overwrite.identifier;
      store.update(db, data, finder: Finder(filter: Filter.equals('identifier', id)));
    } else {
      store.add(db, data);
    }

    ref.read(toastMessagesProvider.notifier).add("Game Saved");
  }
}

final savedGameProvider = StateNotifierProvider<SavedGameProvider, List<SavedGame>>((ref) {
  return SavedGameProvider(ref, Singletons.instance<Database>());
});
