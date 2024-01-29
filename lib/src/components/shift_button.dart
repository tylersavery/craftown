import 'dart:async';

import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/providers/modifier_key_provider.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_riverpod/flame_riverpod.dart';

class ShiftButton extends SpriteComponent with HasGameRef<Craftown>, TapCallbacks, RiverpodComponentMixin {
  ShiftButton();

  static const margin = 32.0;
  static const offsetX = 72.0;
  static const buttonSize = 64.0;

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache("controller/JumpButton.png"));
    position = Vector2(
      margin + offsetX,
      game.size.y - margin - buttonSize,
    );
    priority = 10;
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    ref.read(modifierKeyProvider.notifier).setShift(true);
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    ref.read(modifierKeyProvider.notifier).setShift(false);

    super.onTapUp(event);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    ref.read(modifierKeyProvider.notifier).setShift(false);

    super.onTapCancel(event);
  }
}
