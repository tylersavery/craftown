import 'dart:async';

import 'package:craftown/src/components/collision_box.dart';
import 'package:craftown/src/components/player.dart';
import 'package:craftown/src/craftown.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flame_tiled/flame_tiled.dart';

class IndoorLevel extends World with HasGameRef<Craftown>, RiverpodComponentMixin, KeyboardHandler, TapCallbacks {
  // final Player player;

  IndoorLevel();

  late TiledComponent backgroundMap;
  List<CollisionBlock> collisionBlocks = [];

  @override
  FutureOr<void> onLoad() async {
    priority = 0;
    backgroundMap = await TiledComponent.load("indoor_level_0.tmx", Vector2.all(16))
      ..priority = 0;
    add(backgroundMap);

    _spawnPlayer();
    return super.onLoad();
  }

  void _spawnPlayer() {
    final spawnPointsLayer = backgroundMap.tileMap.getLayer<ObjectGroup>("Spawnpoints");
    if (spawnPointsLayer != null) {
      for (final spawnPoint in spawnPointsLayer.objects) {
        switch (spawnPoint.class_) {
          case "Player":
            print(spawnPoint.x);
            print(spawnPoint.y);
            game.player.position = Vector2(spawnPoint.x, spawnPoint.y);
            // player.position = Vector2(spawnPoint.x, spawnPoint.y);
            // add(player);
            break;
        }
      }
    }
  }
}
