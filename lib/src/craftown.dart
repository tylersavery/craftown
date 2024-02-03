import 'dart:async';
import 'package:craftown/src/components/indoor_level.dart';
import 'package:craftown/src/components/player.dart';
import 'package:craftown/src/components/shift_button.dart';
import 'package:craftown/src/models/character.dart';
import 'package:flame/sprite.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:craftown/src/constants.dart';
import 'package:craftown/src/components/level.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class Craftown extends FlameGame with HasKeyboardHandlerComponents, TapCallbacks, DragCallbacks, RiverpodGameMixin {
  final Character character;
  late CameraComponent cam;
  late SpriteSheet cropsSpriteSheet;

  late final Player player;
  late Level level;
  late JoystickComponent joystick;

  Craftown({required this.character}) {
    player = Player(character: character);
    // globalGameReference.gameReference = this;
  }

  // GlobalGameReference globalGameReference = Get.put(GlobalGameReference());

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    cropsSpriteSheet = SpriteSheet(
      image: await images.load("CL_Crops_Mining.png"),
      srcSize: Vector2(16, 16),
    );

    _loadLevel();

    if (JOYSTICK_ENABLED) {
      _addJoystick();
      cam.viewport.add(joystick);
      // cam.viewport.add(ShiftButton());
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (JOYSTICK_ENABLED) {
      _updateJoystick();
    }
    super.update(dt);
  }

  void _loadLevel() {
    level = Level(levelName: "level_0", player: player);

    final windowWidth = size.x;
    final windowHeight = size.y;

    cam = CameraComponent(
      world: level,
      viewport: FixedSizeViewport(
        windowWidth,
        windowHeight,
      ),
    );

    cam.viewfinder.anchor = Anchor.center;
    cam.viewfinder.zoom = CAMERA_ZOOM;

    final x = (size.x - windowWidth) / 2;
    final y = (size.y - windowHeight) / 2;
    cam.viewport.position = Vector2(x, y);

    cam.follow(player);

    addAll([cam, level]);
  }

  void enterBuilding() {
    // removeWhere((component) => component is Player);
    // _loadLevel();
    final indoorLevel = IndoorLevel();
    indoorLevel.priority = 0;
    add(indoorLevel);

    // indoorLevel.add(player);
    cam.world = indoorLevel;
  }

  void _addJoystick() {
    joystick = JoystickComponent(
      priority: 25,
      knob: SpriteComponent(
        sprite: Sprite(
          images.fromCache("controller/Knob.png"),
        ),
      ),
      background: SpriteComponent(
        sprite: Sprite(
          images.fromCache("controller/Joystick.png"),
        ),
      ),
      margin: const EdgeInsets.only(
        bottom: 32,
        left: 32,
      ),
    );

    // add(joystick);
  }

  void _updateJoystick() {
    switch (joystick.direction) {
      case JoystickDirection.left:
      case JoystickDirection.upLeft:
      case JoystickDirection.downLeft:
        player.horizontalMovement = -1;
        player.verticalMovement = 0;

        break;
      case JoystickDirection.right:
      case JoystickDirection.upRight:
      case JoystickDirection.downRight:
        player.horizontalMovement = 1;
        player.verticalMovement = 0;

        break;
      case JoystickDirection.up:
        player.verticalMovement = -1;
        player.horizontalMovement = 0;

      case JoystickDirection.down:
        player.verticalMovement = 1;
        player.horizontalMovement = 0;

      default:
        player.horizontalMovement = 0;
        player.verticalMovement = 0;
        break;
    }
  }
}
