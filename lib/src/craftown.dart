import 'dart:async';
import 'package:craftown/src/components/player.dart';
import 'package:craftown/src/models/character.dart';
import 'package:flame/sprite.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:craftown/src/constants.dart';
import 'package:craftown/src/level.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class Craftown extends FlameGame with HasKeyboardHandlerComponents, TapCallbacks, RiverpodGameMixin {
  final Character character;
  late CameraComponent cam;
  late SpriteSheet cropsSpriteSheet;

  late final Player player;
  late final Level level;

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

    return super.onLoad();
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
}
