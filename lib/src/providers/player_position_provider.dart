import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerPositionProvider extends StateNotifier<Vector2?> {
  PlayerPositionProvider() : super(null);

  void set(Vector2 value) {
    state = value;
  }
}

final playerPositionProvider = StateNotifierProvider<PlayerPositionProvider, Vector2?>((ref) {
  return PlayerPositionProvider();
});
