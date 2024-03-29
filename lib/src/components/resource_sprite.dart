import 'dart:async';
import 'dart:math';

import 'package:craftown/src/components/custom_hitbox.dart';
import 'package:craftown/src/components/output_indicator_sprite.dart';
import 'package:craftown/src/components/mining_collected_indicator.dart';
import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/menus/providers/resource_contents_menu_provider.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/toast_message.dart';
import 'package:craftown/src/providers/audio_provider.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/inventory_map_provider.dart';
import 'package:craftown/src/providers/placed_resource_detail_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:craftown/src/providers/stats_detail_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/utils/collisions.dart';
import 'package:craftown/src/utils/direction.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum SpriteState {
  empty,
  full,
}

class ResourceSprite extends SpriteGroupComponent with HasGameRef<Craftown>, TapCallbacks, RiverpodComponentMixin, HoverCallbacks {
  late final String identifier;
  final Resource resource;
  late Vector2 initialPosition;
  final bool visible;
  final bool isGround;
  final bool isGhost;

  late final Sprite emptySprite;
  late final Sprite fullSprite;

  late final CustomHitbox hitbox;
  String? placementUniqueIdentifier;

  late OutputIndicatorSprite outputIndicatorSprite;

  MiningCollectedIndicator? miningCollectedIndicator;
  double miningCollectedIndicatorOffset = 0;
  bool miningCollectedIndicatorVisible = false;

  int rotationQuarterTurns;

  ResourceSprite({
    required this.resource,
    required this.isGround,
    super.position,
    super.size,
    this.visible = false,
    this.placementUniqueIdentifier,
    this.rotationQuarterTurns = 0,
    this.isGhost = false,
  }) {
    initialPosition = Vector2(position.x, position.y);
    identifier = randomString();
  }

  Map<String, dynamic> toJson() {
    return {
      'resource': resource.toJson(),
      'position': [position.x, position.y],
      'size': [size.x, size.y],
      'visible': visible,
      'isGround': isGround,
    };
  }

  factory ResourceSprite.fromJson(Map<String, dynamic> data) {
    return ResourceSprite(
      resource: Resource.fromJson(data['resource']),
      position: Vector2(data['position'][0], data['position'][1]),
      size: Vector2(data['size'][0], data['size'][1]),
      visible: data['visible'],
      isGround: data['isGround'],
    );
  }

  final rng = Random();

  bool isMining = false;

  double accumulatedTime = 0;
  double fixedDeltaTime = 1 / 60;

  double miningTimeCounter = 0.0;
  double miningAudioTimeCounter = 0.0;

  @override
  FutureOr<void> onLoad() {
    priority = 25;

    if (resource.canRotate) {
      late String? assetFileName;
      switch (rotationQuarterTurns) {
        case 1:
          assetFileName = resource.assetFilename90Degrees;
          break;
        case 2:
          assetFileName = resource.assetFilename180Degrees;
          break;
        case 3:
          assetFileName = resource.assetFilename270Degrees;
          break;
        default:
          assetFileName = resource.assetFileName16;
          break;
      }

      emptySprite = Sprite(
        game.images.fromCache('resources/${assetFileName ?? resource.assetFileName16}'),
      );
      fullSprite = Sprite(
        game.images.fromCache('resources/${assetFileName ?? resource.assetFileName16}'),
      );
    } else {
      emptySprite = Sprite(
        game.images.fromCache('resources/${resource.assetFileNameLargeWithFallback}'),
      );

      fullSprite = resource.assetFileNameWhenFull != null
          ? Sprite(
              game.images.fromCache('resources/${resource.assetFileNameWhenFull}'),
            )
          : emptySprite;
    }
    sprites = {SpriteState.empty: emptySprite, SpriteState.full: fullSprite};

    opacity = visible ? 1 : 0;

    current = SpriteState.empty;

    hitbox = CustomHitbox(
      offsetX: 0,
      offsetY: 0,
      width: width,
      height: height,
    );

    // final outputIndicatorSize = size.x >= 32 && size.y >= 32 ? Vector2(16, 16) : Vector2(8, 8);
    final outputIndicatorSize = Vector2(16, 16);
    final outputIndicatorPosition = Vector2(
      (size.x - outputIndicatorSize.x) / 2,
      (size.y - outputIndicatorSize.y) / 2,
    );

    outputIndicatorSprite = OutputIndicatorSprite(
      size: outputIndicatorSize,
      position: outputIndicatorPosition,
    );

    outputIndicatorSprite.opacity = 0;

    add(outputIndicatorSprite);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    accumulatedTime += dt;

    while (accumulatedTime >= fixedDeltaTime) {
      _handleMining();
      accumulatedTime -= fixedDeltaTime;
    }

    if (placementUniqueIdentifier != null) {
      final placedInstance = ref.read(placedResourceDetailProvider(placementUniqueIdentifier!));

      if (placedInstance != null) {
        if (placedInstance.isEmpty && current != SpriteState.empty) {
          current = SpriteState.empty;
        } else if (!placedInstance.isEmpty && current != SpriteState.full) {
          current = SpriteState.full;
        }

        if ((placedInstance.isSmelting || placedInstance.isConstructing) && placedInstance.outputSlotContents.isNotEmpty) {
          if (!outputIndicatorSprite.isVisible) {
            final output = placedInstance.outputSlotContents.first;
            outputIndicatorSprite.isVisible = true;
            outputIndicatorSprite.opacity = 0.75;
            outputIndicatorSprite.sprite = Sprite(game.images.fromCache("resources/${output.assetFileName16}"));
          }
        } else {
          if (outputIndicatorSprite.isVisible) {
            outputIndicatorSprite.isVisible = false;
            outputIndicatorSprite.opacity = 0;
          }
        }
      }
    }

    _updateMiningCollectedIndicatorPosition(dt);

    super.update(dt);
  }

  bool validateInteractivity() {
    if (!isWithinRadius(game.player.position, Vector2(position.x + (resource.placementWidth / 2), position.y + (resource.placementHeight / 2)),
        resource.interactionRadius + max(resource.placementWidth / 2, resource.placementHeight / 2))) {
      ref.read(toastMessagesListProvider.notifier).add(
            "Move closer to interact",
            type: ToastMessageType.info,
          );
      return false;
    }
    return true;
  }

  bool validateMining() {
    if (resource.miningToolRequiredIdentifier != null) {
      if (ref.read(selectedToolProvider) == null || ref.read(selectedToolProvider)!.identifier != resource.miningToolRequiredIdentifier) {
        final tool = Tools.allTools.firstWhere((element) => element.identifier == resource.miningToolRequiredIdentifier);
        ref.read(toastMessagesListProvider.notifier).add("Use a ${tool.name} to mine ${resource.name}.");
        return false;
      }
    }

    if (resource.requiredToMine.isNotEmpty) {
      for (final resource in resource.requiredToMine) {
        if (ref.read(inventoryListProvider.notifier).totalResourcesWithIdentifier(resource.identifier) < 1) {
          ref.read(toastMessagesListProvider.notifier).add(
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
    if (isGhost) {
      return;
    }

    if (!validateInteractivity()) {
      return;
    }

    if (resource.isMiner || resource.canHoldResources || resource.canConstruct || resource.canPickUp || resource.isHouse) {
      ref.read(resourceContentsMenuProvider.notifier).openWith(this);
      return;
    }

    // if (resource.canPickUp) {
    //   ref.read(inventoryListProvider.notifier).addResource(resource);
    //   removeFromParent();
    //   return;
    // }

    if (resource.minePerSecond != null && validateMining()) {
      miningTimeCounter = 0;
      miningAudioTimeCounter = 0;
      isMining = true;

      game.player.isMining = true;
      game.player.interactionAnimationType = resource.interactionAnimation;

      game.player.miningDirection = getWalkDirectionForMining(game.player, this);
    }
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    if (isGhost) {
      return;
    }
    if (resource.minePerSecond != null) {
      isMining = false;
      game.player.isMining = false;
      accumulatedTime = 0;
    }
    super.onTapUp(event);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    if (isGhost) {
      return;
    }
    if (resource.minePerSecond != null) {
      isMining = false;
      game.player.isMining = false;

      accumulatedTime = 0;
    }
    super.onTapCancel(event);
  }

  @override
  void onHoverEnter() {
    if (isGhost) {
      return;
    }
    game.mouseCursor = SystemMouseCursors.click;

    super.onHoverEnter();
  }

  @override
  void onHoverExit() {
    if (isGhost) {
      return;
    }
    game.mouseCursor = SystemMouseCursors.basic;

    super.onHoverExit();
  }

  void _handleMining() async {
    if (resource.secondsToMine == null) return;

    if (isMining) {
      if (ref.read(statsDetailProvider).energy < resource.energyToMine) {
        isMining = false;
        game.player.isMining = false;
        ref.read(toastMessagesListProvider.notifier).add("You're too tired to mine ${resource.name}!");
        return;
      }

      miningTimeCounter += accumulatedTime;
      miningAudioTimeCounter += accumulatedTime;

      if (miningAudioTimeCounter >= 0.75) {
        miningAudioTimeCounter = 0;

        if (resource.miningToolRequiredIdentifier == "pick") {
          ref.read(audioNotifierProvider.notifier).play(AudioAsset.pickaxe);
        } else {
          ref.read(audioNotifierProvider.notifier).play(AudioAsset.chop);
        }
      }

      if (miningTimeCounter >= resource.secondsToMine!) {
        miningTimeCounter = 0;
        ref.read(inventoryListProvider.notifier).addResource(resource);
        ref.read(statsDetailProvider.notifier).decreaseEnergy(resource.energyToMine);

        final text = "1 [${ref.read(inventoryMapProvider)[resource.identifier] ?? 1}]";

        _showMiningCollectedIndicator(text);

        await Future.delayed(Duration(milliseconds: 100));
      }
    } else {
      position = initialPosition;
    }
  }

  void _showMiningCollectedIndicator(String text) {
    if (miningCollectedIndicatorVisible && miningCollectedIndicator != null && miningCollectedIndicator!.isMounted) {
      remove(miningCollectedIndicator!);
    }

    miningCollectedIndicatorVisible = true;
    miningCollectedIndicatorOffset = -8;

    miningCollectedIndicator = MiningCollectedIndicator(
      text: text,
      position: Vector2(size.x / 2, miningCollectedIndicatorOffset),
    );

    add(miningCollectedIndicator!);
  }

  void _updateMiningCollectedIndicatorPosition(double dt) {
    if (!miningCollectedIndicatorVisible) {
      return;
    }

    miningCollectedIndicatorOffset -= 0.75;

    const startY = -8.0;
    const endY = -70.0;
    const range = endY + startY;

    if (miningCollectedIndicatorOffset < endY) {
      if (miningCollectedIndicator != null) {
        if (miningCollectedIndicator!.isMounted) {
          remove(miningCollectedIndicator!);
        }
        miningCollectedIndicatorOffset = 0;
        miningCollectedIndicatorVisible = false;
        return;
      }
    }

    if (miningCollectedIndicator != null) {
      miningCollectedIndicator!.position.y = miningCollectedIndicatorOffset;
      miningCollectedIndicator!.opacity = 1 - (miningCollectedIndicatorOffset / range);
    }
  }
}
