import 'dart:async';
import 'dart:math';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/toast_message.dart';
import 'package:craftown/src/providers/inventory_provider.dart';
import 'package:craftown/src/providers/resource_contents_menu_provider.dart';
import 'package:craftown/src/providers/toast_messages_provider.dart';
import 'package:craftown/src/utils/collisions.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/particles.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResourceSprite extends SpriteComponent with HasGameRef<Craftown>, TapCallbacks, RiverpodComponentMixin, HoverCallbacks {
  late final String identifier;
  final Resource resource;
  late Vector2 initialPosition;
  final bool visible;
  final double interactionRadius;

  ResourceSprite({
    required this.resource,
    super.position,
    super.size,
    this.visible = false,
    this.interactionRadius = 48,
  }) {
    initialPosition = Vector2(position.x, position.y);
    identifier = randomString();
  }
  final rng = Random();

  bool isMining = false;

  double accumulatedTime = 0;
  double fixedDeltaTime = 1 / 60;

  double miningTimeCounter = 0.0;

  @override
  FutureOr<void> onLoad() {
    String assetPath = 'resources/${resource.assetFileNameLargeWithFallback}';

    sprite = Sprite(
      game.images.fromCache(assetPath),
    );

    opacity = visible ? 1 : 0;

    return super.onLoad();
  }

  @override
  void update(double dt) {
    accumulatedTime += dt;

    while (accumulatedTime >= fixedDeltaTime) {
      _handleMining();
      accumulatedTime -= fixedDeltaTime;
    }

    super.update(dt);
  }

  bool validateInteractivity() {
    if (!isWithinRadius(game.player.position, position, interactionRadius)) {
      ref.read(toastMessagesProvider.notifier).add(
            "Move closer to interact",
            type: ToastMessageType.info,
          );
      return false;
    }
    return true;
  }

  bool validateMining() {
    if (resource.requiredToMine.isNotEmpty) {
      for (final resource in resource.requiredToMine) {
        if (ref.read(inventoryProvider.notifier).totalResourcesWithIdentifier(resource.identifier) < 1) {
          ref.read(toastMessagesProvider.notifier).add(
                "${resource.name} required.",
                type: ToastMessageType.error,
              );
          return false;
        }
      }
    }

    return true;
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (!validateInteractivity()) {
      return;
    }
    if (resource.canHoldResources) {
      ref.read(resourceContentsMenuProvider.notifier).openWith(this);
      return;
    }

    if (resource.canPickUp) {
      ref.read(inventoryProvider.notifier).addResource(resource);
      removeFromParent();
      return;
    }

    if (resource.minePerSecond != null && validateMining()) {
      miningTimeCounter = 0;
      isMining = true;
    }
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    if (resource.minePerSecond != null) {
      isMining = false;
      accumulatedTime = 0;
    }
    super.onTapUp(event);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    if (resource.minePerSecond != null) {
      isMining = false;
      accumulatedTime = 0;
    }
    super.onTapCancel(event);
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

  void _handleMining() async {
    if (resource.secondsToMine == null) return;

    if (isMining) {
      // position.x = initialPosition.x - rng.nextDouble();
      // position.y = initialPosition.y - rng.nextDouble();

      miningTimeCounter += accumulatedTime;
      if (miningTimeCounter >= resource.secondsToMine!) {
        miningTimeCounter = 0;
        ref.read(inventoryProvider.notifier).addResource(resource);
        await Future.delayed(Duration(milliseconds: 100));
      }
    } else {
      position = initialPosition;
    }
  }
}
