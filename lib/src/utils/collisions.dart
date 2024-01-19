import 'dart:math';

import 'package:craftown/src/components/collision_box.dart';
import 'package:craftown/src/components/player.dart';
import 'package:flame/components.dart';

bool checkCollision(Player player, CollisionBlock block) {
  final hitbox = player.hitbox;
  final playerX = player.position.x + hitbox.offsetX;
  final playerY = player.position.y + hitbox.offsetY;
  final playerWidth = hitbox.width;
  final playerHeight = hitbox.height;

  final blockX = block.x;
  final blockY = block.y;
  final blockWidth = block.width;
  final blockHeight = block.height;

  // final fixedX = player.scale.x < 0 ? playerX - (hitbox.offsetX * 2) - playerWidth : playerX;
  // final fixedY = block.isPlatform ? playerY + playerHeight : playerY;

  return (playerY < blockY + blockHeight && playerY + playerHeight > blockY && playerX < blockX + blockWidth && playerX + playerWidth > blockX);
}

double distance(Vector2 obj1, Vector2 obj2) {
  return sqrt(pow(obj2.x - obj1.x, 2) + pow(obj2.y - obj1.y, 2));
}

bool isWithinRadius(Vector2 obj1, Vector2 obj2, double radius) {
  return distance(obj1, obj2) <= radius;
}
