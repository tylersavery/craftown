// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:craftown/src/components/collision_box.dart';
import 'package:craftown/src/components/custom_hitbox.dart';
import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/character.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/inventory_map_provider.dart';
import 'package:craftown/src/providers/stats_detail_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/utils/collisions.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/src/services/raw_keyboard.dart';

enum PlayerState {
  idleUp("Walk_Up", 1),
  idleDown("Walk_Down", 1),
  idleRight("Walk_Right", 1),
  idleLeft("Walk_Left", 1),
  walkUp("Walk_Up", 4),
  walkDown("Walk_Down", 4),
  walkRight("Walk_Right", 4),
  walkLeft("Walk_Left", 4),
  miningUp("Pickaxe_Up", 4),
  miningDown("Pickaxe_Down", 4),
  miningRight("Pickaxe_Right", 4),
  miningLeft("Pickaxe_Left", 4),
  dead("Dead", 4),
  ;

  final String assetName;
  final int frameCount;
  const PlayerState(this.assetName, this.frameCount);
}

enum WalkDirection {
  up,
  down,
  left,
  right,
  ;
}

enum CauseOfDeath {
  energy("You were too tired passed out!"),
  hunger("You were too hungry and passed out!"),
  thirst("You were too thirsty and passed out!"),
  ;

  final String message;
  const CauseOfDeath(this.message);
}

class Player extends SpriteAnimationGroupComponent with HasGameRef<Craftown>, RiverpodComponentMixin, KeyboardHandler, CollisionCallbacks {
  final Character character;

  Player({required this.character, super.position});

  // animations
  late final SpriteAnimation idleUpAnimation;
  late final SpriteAnimation idleDownAnimation;
  late final SpriteAnimation idleRightAnimation;
  late final SpriteAnimation idleLeftAnimation;

  late final SpriteAnimation walkUpAnimation;
  late final SpriteAnimation walkDownAnimation;
  late final SpriteAnimation walkRightAnimation;
  late final SpriteAnimation walkLeftAnimation;

  late final SpriteAnimation miningUpAnimation;
  late final SpriteAnimation miningDownAnimation;
  late final SpriteAnimation miningRightAnimation;
  late final SpriteAnimation miningLeftAnimation;

  late final SpriteAnimation deadAnimation;

  //  constants
  static const stepTime = 0.1;

  //  properties
  Vector2 velocity = Vector2.zero();
  double moveSpeed = 100.0;
  Vector2 startingPosition = Vector2.zero();

  bool isDead = false;
  bool isMining = false;
  WalkDirection miningDirection = WalkDirection.down;

  CustomHitbox hitbox = CustomHitbox(
    offsetX: 12,
    offsetY: 18,
    width: 8,
    height: 4,
  );

  double horizontalMovement = 0.0;
  double verticalMovement = 0.0;

  double fixedDeltaTime = 1 / 60;
  double accumulatedTime = 0;
  WalkDirection lastWalkDirection = WalkDirection.down;
  List<CollisionBlock> collisionBlocks = [];

  bool loading = false;

  @override
  FutureOr<void> onLoad() {
    priority = 50;
    debugMode = false;
    _loadAllAnimations();
    startingPosition = Vector2(position.x, position.y);

    add(RectangleHitbox(
      position: Vector2(hitbox.offsetX, hitbox.offsetY),
      size: Vector2(hitbox.width, hitbox.height),
    ));

    super.onLoad();
  }

  setPosition(Vector2 p) async {
    position.x = p.x;
    position.y = p.y;
    loading = true;
  }

  @override
  void update(double dt) {
    if (!isDead) {
      if (ref.read(statsDetailProvider).energy <= 0) {
        _handleDeath(CauseOfDeath.energy);

        super.update(dt);
        return;
      }
      if (ref.read(statsDetailProvider).hunger >= 1) {
        _handleDeath(CauseOfDeath.hunger);

        super.update(dt);
        return;
      }
      if (ref.read(statsDetailProvider).thirst >= 1) {
        _handleDeath(CauseOfDeath.thirst);

        super.update(dt);
        return;
      }
    }

    if (!isDead) {
      _updatePlayerState();
      _updateMovement(dt);
      _checkHorizontalCollisions();
      _checkVerticalCollisions();
    }

    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalMovement = 0.0;
    verticalMovement = 0.0;

    final isLeftKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyA) || keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyD) || keysPressed.contains(LogicalKeyboardKey.arrowRight);

    if (!isLeftKeyPressed && !isRightKeyPressed) {
      final isUpKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyW) || keysPressed.contains(LogicalKeyboardKey.arrowUp);
      final isDownKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyS) || keysPressed.contains(LogicalKeyboardKey.arrowDown);
      verticalMovement += isUpKeyPressed ? -1 : 0;
      verticalMovement += isDownKeyPressed ? 1 : 0;

      if (verticalMovement > 0) {
        lastWalkDirection = WalkDirection.down;
      } else if (verticalMovement < 0) {
        lastWalkDirection = WalkDirection.up;
      }
    } else {
      horizontalMovement += isLeftKeyPressed ? -1 : 0;
      horizontalMovement += isRightKeyPressed ? 1 : 0;

      if (horizontalMovement > 0) {
        lastWalkDirection = WalkDirection.right;
      } else if (horizontalMovement < 0) {
        lastWalkDirection = WalkDirection.left;
      }
    }

    // if (keysPressed.contains(LogicalKeyboardKey.space)) {
    //   game.exitBuilding();
    // }

    return super.onKeyEvent(event, keysPressed);
  }

  void _loadAllAnimations() {
    idleUpAnimation = _spriteAnimation(PlayerState.idleUp);
    idleDownAnimation = _spriteAnimation(PlayerState.idleDown);
    idleRightAnimation = _spriteAnimation(PlayerState.idleRight);
    idleLeftAnimation = _spriteAnimation(PlayerState.idleLeft);

    walkUpAnimation = _spriteAnimation(PlayerState.walkUp);
    walkDownAnimation = _spriteAnimation(PlayerState.walkDown);
    walkRightAnimation = _spriteAnimation(PlayerState.walkRight);
    walkLeftAnimation = _spriteAnimation(PlayerState.walkLeft);

    miningUpAnimation = _spriteAnimation(PlayerState.miningUp);
    miningDownAnimation = _spriteAnimation(PlayerState.miningDown);
    miningRightAnimation = _spriteAnimation(PlayerState.miningRight);
    miningLeftAnimation = _spriteAnimation(PlayerState.miningLeft);

    deadAnimation = _spriteAnimation(PlayerState.dead);

    animations = {
      PlayerState.idleUp: idleUpAnimation,
      PlayerState.idleDown: idleDownAnimation,
      PlayerState.idleRight: idleRightAnimation,
      PlayerState.idleLeft: idleLeftAnimation,
      PlayerState.walkUp: walkUpAnimation,
      PlayerState.walkDown: walkDownAnimation,
      PlayerState.walkRight: walkRightAnimation,
      PlayerState.walkLeft: walkLeftAnimation,
      PlayerState.miningUp: miningUpAnimation,
      PlayerState.miningDown: miningDownAnimation,
      PlayerState.miningRight: miningRightAnimation,
      PlayerState.miningLeft: miningLeftAnimation,
      PlayerState.dead: deadAnimation,
    };

    current = PlayerState.idleDown;
  }

  SpriteAnimation _spriteAnimation(PlayerState playerState) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache("characters/${character.skin.assetNameSpace}/${character.skin.assetNameSpace}_${playerState.assetName}.png"),
      SpriteAnimationData.sequenced(
        amount: playerState.frameCount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }

  void _updateMovement(double dt) {
    if (isMining) return;
    velocity.x = horizontalMovement * moveSpeed;
    position.x += velocity.x * dt;

    velocity.y = verticalMovement * moveSpeed;
    position.y += velocity.y * dt;
  }

  void _updatePlayerState() {
    if (isMining) {
      current = switch (miningDirection) {
        WalkDirection.down => PlayerState.miningDown,
        WalkDirection.up => PlayerState.miningUp,
        WalkDirection.left => PlayerState.miningLeft,
        WalkDirection.right => PlayerState.miningRight,
      };

      lastWalkDirection = miningDirection;

      return;
    }
    PlayerState playerState = switch (lastWalkDirection) {
      WalkDirection.down => PlayerState.idleDown,
      WalkDirection.up => PlayerState.idleUp,
      WalkDirection.left => PlayerState.idleLeft,
      WalkDirection.right => PlayerState.idleRight,
    };

    if (velocity.x > 0) {
      playerState = PlayerState.walkRight;
    }
    if (velocity.x < 0) {
      playerState = PlayerState.walkLeft;
    }

    if (velocity.y < 0) {
      playerState = PlayerState.walkUp;
    }

    if (velocity.y > 0) {
      playerState = PlayerState.walkDown;
    }

    current = playerState;
  }

  void _checkHorizontalCollisions() {
    for (final block in collisionBlocks) {
      if (checkCollision(this, block)) {
        if (velocity.x > 0) {
          velocity.x = 0;
          position.x = block.x - hitbox.offsetX - hitbox.width;
          break;
        }
        if (velocity.x < 0) {
          velocity.x = 0;
          position.x = block.x + block.width - hitbox.offsetX;
          break;
        }
      }
    }
  }

  void _checkVerticalCollisions() {
    for (final block in collisionBlocks) {
      if (checkCollision(this, block)) {
        if (velocity.y > 0) {
          velocity.y = 0;
          position.y = block.y - hitbox.height - hitbox.offsetY;
          break;
        }
        if (velocity.y < 0) {
          velocity.y = 0;
          position.y = block.y + block.height - hitbox.offsetY;
        }
      }
    }
  }

  void _handleDeath(CauseOfDeath causeOfDeath) async {
    isDead = true;
    current = PlayerState.dead;
    ref.read(toastMessagesListProvider.notifier).add(causeOfDeath.message);

    await Future.delayed(Duration(seconds: 5));

    final provider = ref.read(statsDetailProvider.notifier);

    switch (causeOfDeath) {
      case CauseOfDeath.energy:
        provider.setEnergy(0.25);
        provider.increaseHunger(0.25, maximum: 0.9);
        provider.increaseThirst(0.3, maximum: 0.9);
        break;
      case CauseOfDeath.hunger:
        provider.setHunger(0.8);
        provider.increaseThirst(0.3, maximum: 0.9);
        provider.increaseEnergy(0.25);

        bool resourceTaken = false;

        for (final r in Resources.hungerConsumables) {
          if (ref.read(inventoryMapProvider).containsKey(r.identifier)) {
            ref.read(inventoryListProvider.notifier).removeResource(r);
            resourceTaken = true;
            ref.read(toastMessagesListProvider.notifier).add("Luckily you had ${r.namePlural.toLowerCase()} on you.");
            break;
          }
        }
        if (!resourceTaken) {
          ref.read(toastMessagesListProvider.notifier).add("The hospital charged you 5 coins");
          provider.decreaseSustainability(0.1);
          provider.decreaseDollars(5);
        }

        break;
      case CauseOfDeath.thirst:
        provider.setThirst(0.8);
        provider.increaseHunger(0.3, maximum: 0.9);
        provider.increaseEnergy(0.25);

        bool resourceTaken = false;

        for (final r in Resources.thirstConsumables) {
          if (ref.read(inventoryMapProvider).containsKey(r.identifier)) {
            ref.read(inventoryListProvider.notifier).removeResource(r);
            resourceTaken = true;
            ref.read(toastMessagesListProvider.notifier).add("Luckily you had ${r.namePlural.toLowerCase()} on you.");

            break;
          }
        }

        if (!resourceTaken) {
          ref.read(toastMessagesListProvider.notifier).add("The hospital charged you 5 coins");

          provider.decreaseDollars(5);
          provider.decreaseSustainability(0.1);
        }

        break;
    }

    isDead = false;
    current = switch (lastWalkDirection) {
      WalkDirection.down => PlayerState.idleDown,
      WalkDirection.up => PlayerState.idleUp,
      WalkDirection.left => PlayerState.idleLeft,
      WalkDirection.right => PlayerState.idleRight,
    };
  }
}
