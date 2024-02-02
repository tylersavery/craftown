// ignore_for_file: implementation_imports

import 'dart:async';
import 'dart:ui';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:craftown/src/components/collision_box.dart';
import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:craftown/src/components/grid_overlay.dart';
import 'package:craftown/src/components/player.dart';
import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/constants.dart';
import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/models/farmland.dart';
import 'package:craftown/src/models/map_resource.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/tile_info.dart';
import 'package:craftown/src/models/tool.dart';
import 'package:craftown/src/providers/farmland_list_provider.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/map_resource_list_provider.dart';
import 'package:craftown/src/providers/modifier_key_provider.dart';
import 'package:craftown/src/providers/placed_resource_detail_provider.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:craftown/src/providers/player_position_provider.dart';
import 'package:craftown/src/providers/resource_in_hand_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
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

  late TiledComponent backgroundMap;
  late TiledComponent foregroundMap;
  late GridOverlay gridOverlay;
  List<CollisionBlock> collisionBlocks = [];

  bool isPlacingObject = false;

  @override
  FutureOr<void> onLoad() async {
    backgroundMap = await TiledComponent.load("$levelName.tmx", Vector2.all(16))
      ..priority = 0;
    foregroundMap = await TiledComponent.load("$levelName.tmx", Vector2.all(16))
      ..priority = 10;
    add(backgroundMap);
    add(foregroundMap);

    gridOverlay = GridOverlay(handleTap: _onGridTap);

    _updateBackground();
    _updateForground();
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

    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final shiftKeyPressed = keysPressed.contains(LogicalKeyboardKey.shiftLeft);
    ref.read(modifierKeyProvider.notifier).setShift(shiftKeyPressed);

    return super.onKeyEvent(event, keysPressed);
  }

  void _spawnPlayer() {
    final spawnPointsLayer = backgroundMap.tileMap.getLayer<ObjectGroup>("Spawnpoints");
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
    final resourcesLayer = backgroundMap.tileMap.getLayer<ObjectGroup>("Resources");
    if (resourcesLayer != null) {
      // final List<String> identifiers = [];
      for (final object in resourcesLayer.objects) {
        Resource? resource;
        switch (object.class_) {
          case "Iron":
            resource = Resources.iron;
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

          final sprite = ResourceSprite(
            placementUniqueIdentifier: uniqueIdentifier,
            resource: resource,
            position: Vector2(object.x, object.y),
            size: Vector2(object.width, object.height),
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
                  MapResource(uniqueIdentifier: uniqueIdentifier, sprite: sprite),
                );
          });

          // identifiers.add(uniqueIdentifier);
        }
      }
    }
  }

  void _addCollisions() {
    final collisionsLayer = backgroundMap.tileMap.getLayer<ObjectGroup>("CollisionBoxes");
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

  void _updateBackground() {
    for (final layer in backgroundMap.tileMap.renderableLayers) {
      if (layer.layer.class_ == "Foreground") {
        layer.layer.visible = false;
      }
    }
  }

  void _updateForground() {
    for (final layer in foregroundMap.tileMap.renderableLayers) {
      if (layer.layer.class_ != "Foreground") {
        layer.layer.visible = false;
      }
    }
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

      final resourceAtCoords =
          ref.read(mapResourceListProvider).firstWhereOrNull((mapResource) => mapResource.sprite.x == x && mapResource.sprite.y == y);

      Resource? updatedResource;

      if (resource.canOnlyBePlacedOn != null) {
        if (resourceAtCoords == null) {
          ref.read(toastMessagesListProvider.notifier).add("${resource.name} can't be placed here.");
          return;
        }

        final canBePlaced =
            resource.canOnlyBePlacedOn!.firstWhereOrNull((element) => element.identifier == resourceAtCoords.sprite.resource.identifier) != null;
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

      final newResource = ResourceSprite(
        resource: updatedResource ?? resource,
        placementUniqueIdentifier: uniqueIdentifier,
        position: Vector2(x, y),
        size: Vector2(resource.placementWidth, resource.placementHeight),
        visible: true,
      );

      add(newResource);
      ref.read(placedResourcesListProvider.notifier).add(uniqueIdentifier, newResource);
      final block = CollisionBlock(
        position: newResource.position,
        size: newResource.size,
      );
      add(block);
      collisionBlocks.add(block);

      if (resource.isMiner) {
        ref.read(placedResourceDetailProvider(uniqueIdentifier).notifier).startMining();
      }
    }
  }

  void _spawnFarmland() {
    final farmableLayer = backgroundMap.tileMap.getLayer<ObjectGroup>("Farmable");
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

  // @override
  // void onTapUp(TapUpEvent event) {
  //   final tool = ref.read(selectedToolProvider);

  //   // final tile = _getTappedCell(event.localPosition);

  //   // final layer = backgroundMap.tileMap.getLayer<Layer>("Ground");

  //   final tile = backgroundMap.componentsAtPoint(event.localPosition).first;
  //   print(tile.children);
  //   // final x = event.canvasPosition.x;
  //   // final y = event.canvasPosition.y;

  //   if (tool == null) return;
  //   switch (tool.type) {
  //     case ToolType.shovel:
  //       // print(event);
  //       break;
  //     default:
  //       break;
  //   }
  //   super.onTapUp(event);
  // }
}
