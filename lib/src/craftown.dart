import 'dart:async';
import 'package:craftown/src/components/player.dart';
import 'package:flame/sprite.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:craftown/src/components/camera_position.dart';
import 'package:craftown/src/constants.dart';
import 'package:craftown/src/level.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/widgets.dart';

class Craftown extends FlameGame with HasKeyboardHandlerComponents, TapCallbacks, RiverpodGameMixin {
  late CameraComponent cam;
  late SpriteSheet cropsSpriteSheet;

  final player = Player(character: Character.character10);

  Craftown() {
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

    return super.onLoad();
  }

  void _loadLevel() {
    Level world = Level(levelName: "level_0", player: player);

    final windowWidth = size.x;
    final windowHeight = size.y;

    cam = CameraComponent(
      world: world,
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

    // final mapCenter = Vector2(
    //   (((50 * TILE_SIZE) / 2) - (VIEWPORT_WIDTH / 2)) * CAMERA_ZOOM,
    //   (((50 * TILE_SIZE) / 2) - (VIEWPORT_HEIGHT / 2)) * CAMERA_ZOOM,
    // );
    //TODO: The math here is not correct but works well enough
    // final mapCenter = Vector2(25 * TILE_SIZE / CAMERA_ZOOM, 25 * TILE_SIZE / CAMERA_ZOOM);

    // final cameraPosition = CameraPosition(
    //   position: mapCenter,
    //   mapWidth: 50,
    //   mapHeight: 50,
    //   viewportWidth: windowWidth / CAMERA_ZOOM,
    //   viewportHeight: windowHeight / CAMERA_ZOOM,
    // );

    cam.follow(player);

    addAll([cam, world]);
  }
}
