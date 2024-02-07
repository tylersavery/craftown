import 'dart:async';

import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:flame/components.dart';

class GhostResourceSprite extends SpriteComponent with HasGameRef<Craftown> {
  final Resource resource;

  GhostResourceSprite({required this.resource, super.position, super.size});

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(
      game.images.fromCache('resources/${resource.assetFileNameLargeWithFallback}'),
    );
  }
}
