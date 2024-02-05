import 'package:craftown/src/components/player.dart';
import 'package:flame/components.dart';

//TODO: fix this logic, its a bit wonky
WalkDirection getWalkDirectionForMining(Player player, PositionComponent target) {
  final playerCenter = Vector2(player.position.x + (player.size.x / 2), player.position.y + (player.size.y / 2));
  final resourceCenter = Vector2(target.position.x + (target.size.x / 2), target.position.y + (target.y / 2));

  final deltaX = playerCenter.x - resourceCenter.x;
  final deltaY = playerCenter.y - resourceCenter.y;
  if (deltaX > 0 && deltaX > deltaY) {
    return WalkDirection.left;
  } else if (deltaX < 0 && deltaX < deltaY) {
    return WalkDirection.right;
  } else if (deltaY > 0) {
    return WalkDirection.up;
  } else {
    return WalkDirection.down;
  }
}
