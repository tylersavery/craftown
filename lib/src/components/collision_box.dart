import 'package:flame/components.dart';

class CollisionBlock extends PositionComponent {
  final bool isPlatform;
  CollisionBlock({
    super.position,
    super.size,
    this.isPlatform = false,
  }) {
    debugMode = false;
  }
}
