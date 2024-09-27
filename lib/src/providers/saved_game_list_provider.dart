import 'package:craftown/src/components/collision_box.dart';
import 'package:craftown/src/components/farmland_grown_sprite.dart';
import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:craftown/src/constants.dart';
import 'package:craftown/src/menus/providers/research_menu_provider.dart';
import 'package:craftown/src/models/farmland.dart';
import 'package:craftown/src/models/placed_farmland.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/models/saved_game.dart';
import 'package:craftown/src/providers/calendar_provider.dart';
import 'package:craftown/src/providers/farmland_detail_provider.dart';
import 'package:craftown/src/providers/farmland_list_provider.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/placed_farmland_list_provider.dart';
import 'package:craftown/src/providers/placed_resource_detail_provider.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:craftown/src/providers/research_list_provider.dart';
import 'package:craftown/src/providers/resource_in_hand_provider.dart';
import 'package:craftown/src/providers/selected_character_provider.dart';
import 'package:craftown/src/providers/stats_detail_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/screens/game_screen.dart';
import 'package:craftown/src/singletons.dart';
import 'package:craftown/src/tutorial/tutorial_provider.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:flame/components.dart' hide Notifier;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'saved_game_list_provider.g.dart';

@Riverpod(keepAlive: true)
class SavedGameList extends _$SavedGameList {
  late Database db;
  late StoreRef<int, Map<String, Object?>> store;

  @override
  List<SavedGame> build() {
    db = Singletons.instance<Database>();
    store = intMapStoreFactory.store("savedGamesv18");
    return [];
  }

  Future<void> loadList() async {
    final snapshots = await store.find(db);
    final saves = snapshots.map((record) => SavedGame.fromJson(record.value)).toList();

    state = saves.reversed.toList();
  }

  void loadGame(SavedGame save) {
    ref.read(selectedCharacterProvider.notifier).set(save.character);
    ref.read(inventoryListProvider.notifier).set(save.inventory);
    ref.read(statsDetailProvider.notifier).set(save.stats);
    ref.read(resourceInHandProvider.notifier).set(save.inHand);
    ref.read(researchListProvider.notifier).set(save.researchLevels);
    ref.read(calendarProvider.notifier).set(save.calendarState);
    ref.read(placedFarmlandListProvider.notifier).set(save.placedFarmlands);
    ref.read(tutorialProvider.notifier).set(save.tutorialStep);

    if (save.isResearching != null && save.researchStarted != null) {
      final now = DateTime.now();
      final saveTime = save.savedAt;
      final diff = now.difference(saveTime);

      final started = save.researchStarted!.add(diff);
      ref.read(researchMenuProvider.notifier).continueResearch(save.isResearching!, researchStarted: started);
    }

    // Placed Resources
    final placedResources = save.placedResources;
    final placedResourcesWithUpdatedSprite = placedResources
        .map(
          (pr) => pr.copyWith(sprite: pr.sprite..placementUniqueIdentifier = pr.uniqueIdentifier),
        )
        .toList();

    ref.read(placedResourcesListProvider.notifier).set(placedResourcesWithUpdatedSprite);

    // Farming

    Future.delayed(Duration(milliseconds: 10), () {
      if (gameWidgetKey.currentState == null) {
        print("GameState NULL");
        return false;
      }

      gameWidgetKey.currentState!.currentGame.player.setPosition(Vector2(save.playerPositionX, save.playerPositionY));

      for (final pr in placedResources) {
        gameWidgetKey.currentState!.currentGame.level.add(pr.sprite);
        final block = CollisionBlock(position: pr.sprite.position, size: pr.sprite.size);

        final level = gameWidgetKey.currentState!.currentGame.level;
        level.collisionBlocks.add(block);
        final detailProvider = ref.read(placedResourceDetailProvider(pr.uniqueIdentifier).notifier);
        detailProvider.setContents(pr.contents);
        detailProvider.setOutput(pr.outputSlotContents);
        detailProvider.selectRecipe(pr.selectedRecipe);

        if (pr.isPowerGenerating) {
          detailProvider.startPowerGenerating();
        }

        if (pr.isConstructing) {
          detailProvider.startConstruction();
        }

        if (pr.isSelling) {
          detailProvider.startSelling();
        }

        if (pr.isMining) {
          detailProvider.startMining();
        }
      }

      final farmlands = [...save.farmlands, ...save.placedFarmlands.map((pfl) => pfl.farmland).toList()];

      for (final pfl in save.placedFarmlands) {
        final fls = FarmlandSprite(
          identifier: pfl.identifier,
          position: Vector2(
            pfl.tileX * TILE_SIZE,
            pfl.tileY * TILE_SIZE,
          ),
          size: Vector2(16, 16),
        );

        gameWidgetKey.currentState!.currentGame.level.add(fls);
      }

      final sprites = gameWidgetKey.currentState!.currentGame.level.children;
      int i = 0;
      for (final sprite in sprites) {
        if (sprite is FarmlandSprite) {
          final fl = farmlands[i];
          sprite.identifier = fl.identifier;
          sprite.seed = fl.seed;
          sprite.completeAt = fl.completeAt;
          sprite.current = fl.state;
          sprite.wateringCount = fl.wateringCount;
          i++;

          if (fl.seed != null && fl.completeAt != null && fl.completeAt!.isBefore(DateTime.now())) {
            sprite.grownOverlaySprite = FarmlandGrownSprite(seed: fl.seed);
            sprite.add(sprite.grownOverlaySprite!);
          }
        }
      }

      ref.read(farmlandListProvider.notifier).set(farmlands);
    });
  }

  Future<void> saveGame(String filename, {SavedGame? overwrite}) async {
    if (gameWidgetKey.currentState == null) {
      print("GameState NULL");
      return;
    }
    final playerState = gameWidgetKey.currentState!.currentGame.player;

    final placedResources = ref.read(placedResourcesListProvider);

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
            isMining: detailState.isMining,
            isSmelting: detailState.isSmelting,
            isPowerGenerating: detailState.isPowerGenerating,
          );

          updatedPlacedResources.add(updatedPr);
        } else {
          print("POSSIBLE ISSUE!");
          updatedPlacedResources.add(pr);
        }
      }
    }

    final farmlands = ref.read(farmlandListProvider);

    final List<Farmland> updatedFarmlands = [];

    for (final f in farmlands) {
      final farmland = ref.read(farmlandDetailProvider(f.identifier));
      if (farmland != null) {
        updatedFarmlands.add(farmland);
      }
    }

    final placedFarmlands = ref.read(placedFarmlandListProvider);

    final List<PlacedFarmland> updatedPlacedFarmlands = [];

    for (final pfl in placedFarmlands) {
      final farmland = ref.read(farmlandDetailProvider(pfl.identifier));
      if (farmland != null) {
        updatedPlacedFarmlands.add(
          PlacedFarmland(
            identifier: pfl.identifier,
            farmland: farmland,
            tileX: pfl.tileX,
            tileY: pfl.tileY,
          ),
        );
      }
    }

    final game = SavedGame(
        identifier: overwrite?.identifier ?? randomString(),
        fileName: filename.isNotEmpty ? filename : ref.read(selectedCharacterProvider).name,
        character: ref.read(selectedCharacterProvider),
        savedAt: DateTime.now(),
        inventory: ref.read(inventoryListProvider),
        playerPositionX: playerState.x,
        playerPositionY: playerState.y,
        placedResources: updatedPlacedResources,
        stats: ref.read(statsDetailProvider),
        inHand: ref.read(resourceInHandProvider),
        farmlands: updatedFarmlands,
        researchLevels: ref.read(researchListProvider),
        isResearching: ref.read(researchMenuProvider).isResearching,
        researchStarted: ref.read(researchMenuProvider).researchStarted,
        calendarState: ref.read(calendarProvider),
        placedFarmlands: updatedPlacedFarmlands,
        tutorialStep: ref.read(tutorialProvider));

    final data = game.toJson();

    if (overwrite != null) {
      final id = overwrite.identifier;
      store.update(db, data, finder: Finder(filter: Filter.equals('identifier', id)));
    } else {
      store.add(db, data);
    }

    ref.read(toastMessagesListProvider.notifier).add("Game Saved");
  }
}
