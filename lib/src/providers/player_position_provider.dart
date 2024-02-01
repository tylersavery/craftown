import 'package:flame/components.dart' show Vector2;
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'player_position_provider.g.dart';

@Riverpod(keepAlive: true)
class PlayerPosition extends _$PlayerPosition {
  @override
  Vector2? build() {
    return null;
  }

  void set(Vector2 value) {
    state = value;
  }
}
