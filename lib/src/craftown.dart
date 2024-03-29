import 'dart:async';
import 'package:craftown/src/components/player.dart';
import 'package:craftown/src/models/character.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
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
  final bool useJoystick;

  late CameraComponent cam;
  late SpriteSheet cropsSpriteSheet;

  late final Player player;
  late Level level;
  late JoystickComponent joystick;

  Craftown({required this.character, required this.useJoystick}) {
    player = Player(character: character);
  }

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    cropsSpriteSheet = SpriteSheet(
      image: await images.load("CL_Crops_Mining.png"),
      srcSize: Vector2(16, 16),
    );

    _loadLevel("tutorial", player, false);

    if (useJoystick) {
      _addJoystick();
      cam.viewport.add(joystick);
    }

    if (PLAY_AUDIO && PLAY_MUSIC) {
      FlameAudio.bgm.initialize();
      FlameAudio.bgm.play('music/music1.mp3');
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (useJoystick) {
      _updateJoystick();
    }
    super.update(dt);
  }

  void _loadLevel(String levelName, Player p, bool supportsWinter) async {
    level = Level(levelName: levelName, player: p, supportsWinter: supportsWinter);

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
