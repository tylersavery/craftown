import 'dart:async';

import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:flame/components.dart';

class FarmlandGrownSprite extends SpriteComponent with HasGameRef<Craftown> {
  Resource? resource;
  bool isVisible = false;

  FarmlandGrownSprite({this.resource, super.position, super.size});

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(
      game.images.fromCache("farming/grown-carrot-10x16.png"),
    );

    return super.onLoad();
  }
}
