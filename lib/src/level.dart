// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:craftown/src/components/collision_box.dart';
import 'package:craftown/src/components/grid_overlay.dart';
import 'package:craftown/src/components/player.dart';
import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/constants.dart';
import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/inventory_provider.dart';
import 'package:craftown/src/providers/modifier_key_provider.dart';
import 'package:craftown/src/providers/placed_resources_provider.dart';
import 'package:craftown/src/providers/player_position_provider.dart';
import 'package:craftown/src/providers/resource_in_hand_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/src/services/raw_keyboard.dart';

class Level extends World with HasGameRef<Craftown>, RiverpodComponentMixin, KeyboardHandler {
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
      for (final object in resourcesLayer.objects) {
        Resource? resource;
        switch (object.class_) {
          case "Iron":
            resource = Resources.iron;
            break;
          case "Copper":
            resource = Resources.copper;
            break;
          case "Wood":
            resource = Resources.wood;
          case "Water":
            resource = Resources.water;
          case "Straw":
            resource = Resources.straw;
        }
        if (resource != null) {
          final sprite = ResourceSprite(
            resource: resource,
            position: Vector2(object.x, object.y),
            size: Vector2(object.width, object.height),
          );
          add(sprite);
        }
      }
    }
  }

  void _addCollisions() {
    final collisionsLayer = backgroundMap.tileMap.getLayer<ObjectGroup>("CollisionBoxes");
    if (collisionsLayer != null) {
      for (final collision in collisionsLayer.objects) {
        final block = CollisionBlock(
          // identifier: "map_${collision.id}",
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

      ref.read(resourceInHandProvider.notifier).clear();

      final uniqueIdentifier = randomString();

      final newResource = ResourceSprite(
        resource: resource,
        placementUniqueIdentifier: uniqueIdentifier,
        position: Vector2(x, y),
        size: Vector2(resource.placementWidth, resource.placementHeight),
        visible: true,
      );

      add(newResource);
      ref.read(placedResourcesProvider.notifier).add(uniqueIdentifier, newResource);
      final block = CollisionBlock(
        position: newResource.position,
        size: newResource.size,
      );
      add(block);
      collisionBlocks.add(block);
    }
  }
}
