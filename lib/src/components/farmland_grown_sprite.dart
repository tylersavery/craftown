import 'dart:async';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:flame/components.dart';

class FarmlandGrownSprite extends SpriteComponent with HasGameRef<Craftown> {
  final Resource? seed;
  bool isVisible = false;

  FarmlandGrownSprite({this.seed}) {
    if (seed == null || seed?.farmlandGrownAssetPath == null) {
      super.position = Vector2(3, 0);
      super.size = Vector2(11, 16);
    } else {
      final positionX = ((TILE_SIZE - seed!.farmlandGrownWidth) / 2).round().toDouble();
      final positionY = ((TILE_SIZE - seed!.farmlandGrownHeight) / 2).round().toDouble() - 3;
      super.position = Vector2(positionX, positionY);
      super.size = Vector2(seed!.farmlandGrownWidth, seed!.farmlandGrownHeight);
    }
  }

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(
      game.images.fromCache(seed?.farmlandGrownAssetPath ?? "farming/grown-generic-11x9.png"),
    );

    return super.onLoad();
  }
}
