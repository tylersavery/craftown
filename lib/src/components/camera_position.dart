// ignore_for_file: deprecated_member_use

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/craftown.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class CameraPosition extends PositionComponent with HasGameRef<Craftown>, KeyboardHandler {
  final double moveSpeed;
  final double viewportWidth;
  final double viewportHeight;
  final int mapWidth;
  final int mapHeight;

  CameraPosition({
    this.moveSpeed = 200.0,
    required this.viewportWidth,
    required this.viewportHeight,
    required this.mapWidth,
    required this.mapHeight,
    super.position,
  });

  Vector2 velocity = Vector2.zero();
  double horizontalMovement = 0.0;
  double verticalMovement = 0.0;

  double get mapWidthPixels {
    return mapWidth * TILE_SIZE;
  }

  double get mapHeightPixels {
    return mapHeight * TILE_SIZE;
  }

  @override
  void update(double dt) {
    _updateMovement(dt);
    super.update(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalMovement = 0.0;
    verticalMovement = 0.0;

    final isLeftKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyA) || keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyD) || keysPressed.contains(LogicalKeyboardKey.arrowRight);
    final isUpKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyW) || keysPressed.contains(LogicalKeyboardKey.arrowUp);
    final isDownKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyS) || keysPressed.contains(LogicalKeyboardKey.arrowDown);

    horizontalMovement += isLeftKeyPressed ? -1 : 0;
    horizontalMovement += isRightKeyPressed ? 1 : 0;

    verticalMovement += isUpKeyPressed ? -1 : 0;
    verticalMovement += isDownKeyPressed ? 1 : 0;

    return super.onKeyEvent(event, keysPressed);
  }

  void _updateMovement(double dt) {
    velocity.x = horizontalMovement * moveSpeed;
    position.x += velocity.x * dt;
    if (position.x < 0) {
      position.x = 0;
    }
    if (position.x > mapWidthPixels - viewportWidth) {
      position.x = mapWidthPixels - viewportWidth;
    }

    velocity.y = verticalMovement * moveSpeed;
    position.y += velocity.y * dt;

    if (position.y < 0) {
      position.y = 0;
    }

    if (position.y > mapHeightPixels - viewportHeight) {
      position.y = mapHeightPixels - viewportHeight;
    }
  }
}
