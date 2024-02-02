import 'dart:async';

import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:flame/components.dart';

class OutputIndicatorSprite extends SpriteComponent with HasGameRef<Craftown> {
  Resource? resource;
  bool isVisible = false;

  OutputIndicatorSprite({this.resource, super.position, super.size});

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(
      game.images.fromCache("resources/clay-16x16.png"),
    );

    return super.onLoad();
  }
}
