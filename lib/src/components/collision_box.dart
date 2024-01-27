import 'package:flame/components.dart';

class CollisionBlock extends PositionComponent {
  final bool isPlatform;
  // final String identifier;
  CollisionBlock({
    super.position,
    super.size,
    this.isPlatform = false,
    // required this.identifier,
  }) {
    debugMode = false;
  }
}
