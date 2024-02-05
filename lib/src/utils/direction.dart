import 'package:craftown/src/components/player.dart';
import 'package:flame/components.dart';

WalkDirection getWalkDirectionForMining(Player player, PositionComponent target) {
  final playerCenter = Vector2(player.position.x + (player.size.x / 2), player.position.y + (player.size.y / 2));

  final targetL = target.position.x;
  final targetR = target.position.x + target.size.x;
  final targetT = target.position.y;

  if (playerCenter.x < targetL) {
    return WalkDirection.right;
  }

  if (playerCenter.x > targetR) {
    return WalkDirection.left;
  }

  if (playerCenter.y > targetT) {
    return WalkDirection.up;
  }

  return WalkDirection.down;
}
