// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:craftown/src/components/collision_box.dart';
import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:craftown/src/components/grid_overlay.dart';
import 'package:craftown/src/components/player.dart';
import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/constants.dart';
import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/calendar_state.dart';
import 'package:craftown/src/models/farmland.dart';
import 'package:craftown/src/models/map_resource.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/calendar_provider.dart';
import 'package:craftown/src/providers/farmland_list_provider.dart';
import 'package:craftown/src/providers/map_resource_list_provider.dart';
import 'package:craftown/src/providers/modifier_key_provider.dart';
import 'package:craftown/src/providers/occupied_coords_provider.dart';
import 'package:craftown/src/providers/occupied_ground_coords_provider.dart';
import 'package:craftown/src/providers/placed_resource_detail_provider.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:craftown/src/providers/resource_in_hand_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/src/services/raw_keyboard.dart';

class Level extends World with HasGameRef<Craftown>, RiverpodComponentMixin, KeyboardHandler, TapCallbacks {
  final String levelName;
  final Player player;

  Level({
    required this.levelName,
    required this.player,
  });

  late TiledComponent mapSummer;
  late TiledComponent mapWinter;
  late GridOverlay gridOverlay;
  List<CollisionBlock> collisionBlocks = [];

  bool isPlacingObject = false;
  CalendarSeason currentSeason = CalendarSeason.summer;

  @override
  FutureOr<void> onLoad() async {
    mapSummer = await TiledComponent.load("$levelName.tmx", Vector2.all(16))
      ..priority = 0;

    mapWinter = await TiledComponent.load("${levelName}_winter.tmx", Vector2.all(16))
      ..priority = 0;

    add(mapSummer);

    gridOverlay = GridOverlay(handleTap: _onGridTap, size: mapSummer.size);

    _spawnResources();
    _spawnPlayer();
    _spawnFarmland();
    _addCollisions();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final resourceInHand = ref.read(resourceInHandProvider);

    if (resourceInHand != null && resourceInHand.canPlace && !isPlacingObject) {
      _showGrid();
    } else if (resourceInHand == null && isPlacingObject) {
      _hideGrid();
    }

    _handleSeasons(dt);

    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final shiftKeyPressed = keysPressed.contains(LogicalKeyboardKey.shiftLeft);
    ref.read(modifierKeyProvider.notifier).setShift(shiftKeyPressed);

    return super.onKeyEvent(event, keysPressed);
  }

  void _spawnPlayer() {
    final spawnPointsLayer = mapSummer.tileMap.getLayer<ObjectGroup>("Spawnpoints");
    if (spawnPointsLayer != null) {
      for (final spawnPoint in spawnPointsLayer.objects) {
        switch (spawnPoint.class_) {
          case "Player":
            player.position = Vector2(spawnPoint.x, spawnPoint.y);
            add(player);
            break;
        }
      }
    }
  }

  void _spawnResources() {
    final resourcesLayer = mapSummer.tileMap.getLayer<ObjectGroup>("Resources");
    if (resourcesLayer != null) {
      // final List<String> identifiers = [];
      for (final object in resourcesLayer.objects) {
        final properties = object.properties;
        Resource? resource;
        bool isGround = false;
        switch (object.class_) {
          case "Iron":
            resource = Resources.iron;
            break;

          case "IronGround":
            resource = Resources.iron;
            isGround = true;
            break;
          case "Stone":
            resource = Resources.stone;
            break;
          case "Copper":
            resource = Resources.copper;
            break;
          case "Clay":
            resource = Resources.clay;
            break;
          case "ClayGround":
            resource = Resources.clay;
            isGround = true;
            break;
          case "Wood":
            resource = Resources.wood;
            break;
          case "Water":
            resource = Resources.water;
            break;
          case "Straw":
            resource = Resources.straw;
            break;
        }
        if (resource != null) {
          final uniqueIdentifier = randomString();

          if (isGround) {
            final cols = object.width / TILE_SIZE;
            final rows = object.height / TILE_SIZE;

            for (int x = 0; x < cols; x++) {
              for (int y = 0; y < rows; y++) {
                final sprite = ResourceSprite(
                  placementUniqueIdentifier: uniqueIdentifier,
                  resource: resource,
                  position: Vector2(object.x + (x * TILE_SIZE), object.y + (y * TILE_SIZE)),
                  size: Vector2(TILE_SIZE, TILE_SIZE),
                  isGround: isGround,
                );
                add(sprite);

                Future.delayed(Duration(milliseconds: 10), () {
                  ref.read(mapResourceListProvider.notifier).add(
                        MapResource(
                          uniqueIdentifier: uniqueIdentifier,
                          sprite: sprite,
                          tileX: (object.x / TILE_SIZE).round() + x,
                          tileY: (object.y / TILE_SIZE).round() + y,
                        ),
                      );
                });
              }
            }
          } else {
            final sprite = ResourceSprite(
              placementUniqueIdentifier: uniqueIdentifier,
              resource: resource,
              position: Vector2(object.x, object.y),
              size: Vector2(object.width, object.height),
              isGround: false,
            );
            add(sprite);

            if (resource.spawnedResourceHasHitbox) {
              final block = CollisionBlock(
                position: Vector2(object.x + resource.spawnedResourceHitboxOffsetX, object.y + resource.spawnedResourceHitboxOffsetY),
                size: Vector2(resource.spawnedResourceHitboxWidth ?? object.width, resource.spawnedResourceHitboxHeight ?? object.height),
              );

              collisionBlocks.add(block);
              add(block);
            }

            Future.delayed(Duration(milliseconds: 10), () {
              ref.read(mapResourceListProvider.notifier).add(
                    MapResource(
                        uniqueIdentifier: uniqueIdentifier,
                        sprite: sprite,
                        tileX: (object.x / TILE_SIZE).round(),
                        tileY: (object.y / TILE_SIZE).round()),
                  );

              ref.read(placedResourcesListProvider.notifier).add(
                    uniqueIdentifier,
                    sprite,
                    (object.x / TILE_SIZE).round(),
                    (object.y / TILE_SIZE).round(),
                    (object.width / TILE_SIZE).round(),
                    (object.height / TILE_SIZE).round(),
                  );
            });
          }

          // identifiers.add(uniqueIdentifier);
        }
      }
    }
  }

  void _addCollisions() {
    final collisionsLayer = mapSummer.tileMap.getLayer<ObjectGroup>("CollisionBoxes");
    if (collisionsLayer != null) {
      for (final collision in collisionsLayer.objects) {
        final block = CollisionBlock(
          position: Vector2(collision.x, collision.y),
          size: Vector2(collision.width, collision.height),
        );
        collisionBlocks.add(block);
        add(block);
      }
    }

    player.collisionBlocks = collisionBlocks;
  }

  void _showGrid() {
    isPlacingObject = true;
    add(gridOverlay);
  }

  void _hideGrid() {
    isPlacingObject = false;
    remove(gridOverlay);
  }

  _onGridTap(int tileX, int tileY) {
    if (isPlacingObject) {
      final resource = ref.read(resourceInHandProvider);
      if (resource == null) {
        _hideGrid();
        return;
      }

      final x = (tileX * TILE_SIZE).toDouble();
      final y = (tileY * TILE_SIZE).toDouble();

      PlacedResource? placedResourceAtCoords;

      outerLoop:
      for (int x = tileX; x < (tileX + resource.placementWidth / TILE_SIZE).round(); x++) {
        for (int y = tileY; y < (tileY + resource.placementHeight / TILE_SIZE).round(); y++) {
          final coordWithResource = ref.read(occupiedCoordsProvider).firstWhereOrNull((c) => c.x == x && c.y == y);
          if (coordWithResource != null) {
            placedResourceAtCoords = coordWithResource.placedResource;
            break outerLoop;
          }
        }
      }

      final resourceAtCoords =
          ref.read(mapResourceListProvider).firstWhereOrNull((mapResource) => mapResource.tileX == tileX && mapResource.tileY == tileY);

      if (placedResourceAtCoords != null) {
        ref.read(toastMessagesListProvider.notifier).add("${placedResourceAtCoords.sprite.resource.name} is in the way.");
        return;
      }

      if (resource.canFarm) {
        if (ref.read(occupiedGroundCoordsProvider).firstWhereOrNull((c) => c.x == tileX && c.y == tileY) != null) {
          ref.read(toastMessagesListProvider.notifier).add("Can't farm here.");
          return;
        }
      }

      Resource? updatedResource;

      if (resource.canOnlyBePlacedOn != null) {
        if (resourceAtCoords == null) {
          ref.read(toastMessagesListProvider.notifier).add("${resource.name} can't be placed here.");
          return;
        }

        bool canBePlaced =
            resource.canOnlyBePlacedOn!.firstWhereOrNull((element) => element.identifier == resourceAtCoords.sprite.resource.identifier) != null;
        if (resource.canOnlyBePlacedOnGround) {
          if (!resourceAtCoords.sprite.isGround) {
            canBePlaced = false;
          }
        }

        if (!canBePlaced) {
          ref.read(toastMessagesListProvider.notifier).add("${resource.name} can't be placed here.");

          return false;
        }
      }

      if (resource.isMiner && resourceAtCoords != null) {
        updatedResource = resource.copyWith(miningOutputResource: resourceAtCoords.sprite.resource);
      }

      ref.read(resourceInHandProvider.notifier).clear();

      final uniqueIdentifier = randomString();

      if (resource.canFarm) {
        final farmlandSprite = FarmlandSprite(
          identifier: uniqueIdentifier,
          position: Vector2(x, y),
          size: Vector2.all(TILE_SIZE),
        );

        add(farmlandSprite);
        ref.read(farmlandListProvider.notifier).add(Farmland(identifier: uniqueIdentifier));
        return;
      }

      final newResource = ResourceSprite(
        resource: updatedResource ?? resource,
        placementUniqueIdentifier: uniqueIdentifier,
        position: Vector2(x, y - resource.placementHeight + TILE_SIZE),
        size: Vector2(resource.placementWidth, resource.placementHeight),
        visible: true,
        isGround: false,
      );

      add(newResource);
      ref.read(placedResourcesListProvider.notifier).add(
          uniqueIdentifier, newResource, tileX, tileY, (resource.placementWidth / TILE_SIZE).round(), (resource.placementHeight / TILE_SIZE).round());
      if (resource.placeWithHitbox) {
        final block = CollisionBlock(
          position: newResource.position,
          size: newResource.size,
        );
        add(block);
        collisionBlocks.add(block);
      }

      if (resource.isMiner) {
        ref.read(placedResourceDetailProvider(uniqueIdentifier).notifier).startMining();
      }
    }
  }

  void _spawnFarmland() {
    final farmableLayer = mapSummer.tileMap.getLayer<ObjectGroup>("Farmable");
    if (farmableLayer != null) {
      for (final obj in farmableLayer.objects) {
        final x = obj.x;
        final y = obj.y;

        final cols = (obj.width / TILE_SIZE).round();
        final rows = (obj.height / TILE_SIZE).round();

        final List<String> identifiers = [];

        for (int row = 0; row < rows; row++) {
          for (int col = 0; col < cols; col++) {
            final identifier = randomString();
            final posX = x + (col * TILE_SIZE);
            final posY = y + (row * TILE_SIZE);
            final farmlandSprite = FarmlandSprite(
              identifier: identifier,
              position: Vector2(posX, posY),
              size: Vector2.all(TILE_SIZE),
            );

            identifiers.add(identifier);

            add(farmlandSprite);
          }
        }

        Future.delayed(Duration(milliseconds: 10), () {
          for (final identifier in identifiers) {
            ref.read(farmlandListProvider.notifier).add(Farmland(identifier: identifier));
          }
        });
      }
    }
  }

  void _handleSeasons(double dt) {
    final season = ref.read(calendarProvider).season;

    if (currentSeason != season) {
      currentSeason = season;
      switch (season) {
        case CalendarSeason.summer:
          if (mapWinter.isMounted) {
            remove(mapWinter);
          }
          add(mapSummer);
          break;
        case CalendarSeason.winter:
          if (mapSummer.isMounted) {
            remove(mapSummer);
          }
          add(mapWinter);
          break;
      }
    }
  }
}
