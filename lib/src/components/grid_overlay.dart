import 'dart:async';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/craftown.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class GridOverlay extends ParallaxComponent<Craftown> with HasGameRef<Craftown>, TapCallbacks, HoverCallbacks {
  final Function(int x, int y) handleTap;

  GridOverlay({required this.handleTap, super.position, super.size});

  @override
  FutureOr<void> onLoad() async {
    priority = 100;
    parallax = await game.loadParallax(
      [
        ParallaxImageData('grid_cell.png'),
      ],
      baseVelocity: Vector2(0, 0),
      repeat: ImageRepeat.repeat,
      fill: LayerFill.none,
    );
    return super.onLoad();
  }

  @override
  void onHoverEnter() {
    game.mouseCursor = SystemMouseCursors.click;

    super.onHoverEnter();
  }

  @override
  void onHoverExit() {
    game.mouseCursor = SystemMouseCursors.basic;

    super.onHoverExit();
  }

  @override
  void onTapUp(TapUpEvent event) {
    final x = (event.localPosition.x / TILE_SIZE).floor();
    final y = (event.localPosition.y / TILE_SIZE).floor();
    handleTap(x, y);

    super.onTapUp(event);
  }
}
