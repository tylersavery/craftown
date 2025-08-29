// ignore_for_file: implementation_imports, deprecated_member_use

import 'dart:async';
import 'dart:math';

import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/models/character.dart';
import 'package:craftown/src/models/npc.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';

enum NpcAnimationState {
  idleUp("Walk_Up", 1),
  idleDown("Walk_Down", 1),
  idleRight("Walk_Right", 1),
  idleLeft("Walk_Left", 1),
  walkUp("Walk_Up", 4),
  walkDown("Walk_Down", 4),
  walkRight("Walk_Right", 4),
  walkLeft("Walk_Left", 4),
  workingUp("Pickaxe_Up", 4),
  workingDown("Pickaxe_Down", 4),
  workingRight("Pickaxe_Right", 4),
  workingLeft("Pickaxe_Left", 4),
  ;

  final String assetName;
  final int frameCount;
  const NpcAnimationState(this.assetName, this.frameCount);
}

class NpcComponent extends SpriteAnimationGroupComponent<NpcAnimationState>
    with HasGameRef<Craftown>, CollisionCallbacks, RiverpodComponentMixin {
  Npc npcData;
  Vector2? targetPosition;
  List<Vector2> pathToTarget = [];
  double moveSpeed = 50.0; // pixels per second

  // AI timing
  double lastDecisionTime = 0.0;
  double decisionInterval = 2.0; // seconds between AI decisions

  // Animation direction tracking
  NpcAnimationState currentDirection = NpcAnimationState.idleDown;

  NpcComponent({required this.npcData});

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    _setupHitbox();
    _setupPosition();

    current = NpcAnimationState.idleDown;
    lastDecisionTime = 0.0;
    super.onLoad();
  }

  void _loadAllAnimations() {
    final character = npcData.character;
    final Map<NpcAnimationState, SpriteAnimation> animationMap = {};

    for (final state in NpcAnimationState.values) {
      animationMap[state] = _spriteAnimation(state, character);
    }
    
    animations = animationMap;
  }

  SpriteAnimation _spriteAnimation(
      NpcAnimationState state, Character character) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache(
          "characters/${character.skin.assetNameSpace}/${character.skin.assetNameSpace}_${state.assetName}.png"),
      SpriteAnimationData.sequenced(
        amount: state.frameCount,
        stepTime: 0.2,
        textureSize: Vector2.all(32),
      ),
    );
  }

  void _setupHitbox() {
    add(RectangleHitbox(
      position: Vector2(4, 16),
      size: Vector2(24, 16),
    ));
  }

  void _setupPosition() {
    position = Vector2(npcData.tileX * 32, npcData.tileY * 32);
    size = Vector2.all(32);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // AI decision making
    lastDecisionTime += dt;
    if (lastDecisionTime >= decisionInterval) {
      _makeAIDecision();
      lastDecisionTime = 0.0;
    }

    // Movement
    if (targetPosition != null) {
      _moveTowardsTarget(dt);
    }

    // Update animation based on movement
    _updateAnimation();

    // Update NPC stats
    _updateStats(dt);
  }

  void _makeAIDecision() {
    // Simple AI state machine
    switch (npcData.state) {
      case NpcState.idle:
        _findWork();
        break;
      case NpcState.walkingToTarget:
        // Continue walking to target
        break;
      case NpcState.workingAtMachine:
        _workAtMachine();
        break;
      case NpcState.carryingItems:
        _deliverItems();
        break;
      case NpcState.resting:
        if (!npcData.needsBreak) {
          _changeState(NpcState.idle);
        }
        break;
      case NpcState.eating:
      case NpcState.drinking:
        _handleNeeds();
        break;
      case NpcState.goingHome:
      case NpcState.sleeping:
        _handleRest();
        break;
    }
  }

  void _findWork() {
    if (npcData.needsBreak) {
      _changeState(NpcState.resting);
      return;
    }

    // Find a machine that needs items moved
    final placedResources = ref.read(placedResourcesListProvider);
    final workTarget = _findMachineNeedingItems(placedResources);

    if (workTarget != null) {
      _setTarget(workTarget);
      _changeState(NpcState.walkingToTarget);
    }
  }

  PlacedResource? _findMachineNeedingItems(List<PlacedResource> machines) {
    // Simple heuristic: find machines with output that need emptying
    for (final machine in machines) {
      if (machine.outputSlotContents.isNotEmpty) {
        return machine;
      }
    }
    return null;
  }

  void _setTarget(PlacedResource target) {
    targetPosition = Vector2(target.tileX * 32.0, target.tileY * 32.0);
    npcData = npcData.copyWith(targetMachineId: target.uniqueIdentifier);
  }

  void _moveTowardsTarget(double dt) {
    if (targetPosition == null) return;

    final direction = targetPosition! - position;
    final distance = direction.length;

    if (distance < 5.0) {
      // Reached target
      targetPosition = null;
      _arrivedAtTarget();
      return;
    }

    // Move towards target
    final normalizedDirection = direction.normalized();
    position += normalizedDirection * moveSpeed * dt;

    // Update direction for animation
    _updateDirectionFromMovement(normalizedDirection);
  }

  void _updateDirectionFromMovement(Vector2 direction) {
    if (direction.x.abs() > direction.y.abs()) {
      // Moving more horizontally
      currentDirection = direction.x > 0
          ? NpcAnimationState.walkRight
          : NpcAnimationState.walkLeft;
    } else {
      // Moving more vertically
      currentDirection = direction.y > 0
          ? NpcAnimationState.walkDown
          : NpcAnimationState.walkUp;
    }
  }

  void _updateAnimation() {
    NpcAnimationState newState;

    switch (npcData.state) {
      case NpcState.walkingToTarget:
        newState = currentDirection;
        break;
      case NpcState.workingAtMachine:
        newState = _getWorkingAnimation(currentDirection);
        break;
      default:
        newState = _getIdleAnimation(currentDirection);
        break;
    }

    if (current != newState) {
      current = newState;
    }
  }

  NpcAnimationState _getIdleAnimation(NpcAnimationState direction) {
    switch (direction) {
      case NpcAnimationState.walkUp:
        return NpcAnimationState.idleUp;
      case NpcAnimationState.walkDown:
        return NpcAnimationState.idleDown;
      case NpcAnimationState.walkRight:
        return NpcAnimationState.idleRight;
      case NpcAnimationState.walkLeft:
        return NpcAnimationState.idleLeft;
      default:
        return NpcAnimationState.idleDown;
    }
  }

  NpcAnimationState _getWorkingAnimation(NpcAnimationState direction) {
    switch (direction) {
      case NpcAnimationState.walkUp:
      case NpcAnimationState.idleUp:
        return NpcAnimationState.workingUp;
      case NpcAnimationState.walkDown:
      case NpcAnimationState.idleDown:
        return NpcAnimationState.workingDown;
      case NpcAnimationState.walkRight:
      case NpcAnimationState.idleRight:
        return NpcAnimationState.workingRight;
      case NpcAnimationState.walkLeft:
      case NpcAnimationState.idleLeft:
        return NpcAnimationState.workingLeft;
      default:
        return NpcAnimationState.workingDown;
    }
  }

  void _arrivedAtTarget() {
    switch (npcData.state) {
      case NpcState.walkingToTarget:
        _changeState(NpcState.workingAtMachine);
        break;
      default:
        break;
    }
  }

  void _workAtMachine() {
    // Simple work logic - collect items from machine
    final machine = _getCurrentTargetMachine();
    if (machine != null && machine.outputSlotContents.isNotEmpty) {
      // TODO: Implement actual item collection logic
      _changeState(NpcState.carryingItems);
    } else {
      _changeState(NpcState.idle);
    }
  }

  void _deliverItems() {
    // TODO: Find a machine that needs these items
    _changeState(NpcState.idle);
  }

  void _handleNeeds() {
    // TODO: Implement eating/drinking logic
    _changeState(NpcState.idle);
  }

  void _handleRest() {
    // TODO: Implement rest/sleep logic
    _changeState(NpcState.idle);
  }

  PlacedResource? _getCurrentTargetMachine() {
    if (npcData.targetMachineId == null) return null;
    final machines = ref.read(placedResourcesListProvider);
    return machines.firstWhere(
      (m) => m.uniqueIdentifier == npcData.targetMachineId,
      orElse: () => machines.first, // fallback
    );
  }

  void _changeState(NpcState newState) {
    npcData = npcData.copyWith(state: newState);
  }

  void _updateStats(double dt) {
    // Decrease stats over time
    const hungerRate = 5.0; // per minute
    const thirstRate = 8.0; // per minute
    const energyRate = 3.0; // per minute when working

    double hungerDecrease = hungerRate * dt / 60.0;
    double thirstDecrease = thirstRate * dt / 60.0;
    double energyDecrease = (npcData.isWorking ? energyRate : -1.0) * dt / 60.0;

    npcData = npcData.copyWith(
      hunger: max(0.0, npcData.hunger - hungerDecrease),
      thirst: max(0.0, npcData.thirst - thirstDecrease),
      energy: max(0.0, npcData.energy - energyDecrease),
    );
  }
}
