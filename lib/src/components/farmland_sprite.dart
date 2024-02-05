import 'dart:async';

import 'package:craftown/src/components/farmland_grown_sprite.dart';
import 'package:craftown/src/components/player.dart';
import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/menus/providers/seed_menu_provider.dart';
import 'package:craftown/src/models/calendar_state.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/tool.dart';
import 'package:craftown/src/providers/calendar_provider.dart';
import 'package:craftown/src/providers/farmland_detail_provider.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/utils/collisions.dart';
import 'package:craftown/src/utils/direction.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_riverpod/flame_riverpod.dart';

enum FarmlandState {
  untouched("untouched"),
  dug("dug"),
  growing("growing"),
  watered("watered"),
  grown("grown"),
  ;

  final String identifier;
  const FarmlandState(this.identifier);
}

class FarmlandSprite extends SpriteGroupComponent with HasGameRef<Craftown>, TapCallbacks, RiverpodComponentMixin, HoverCallbacks {
  String identifier;

  FarmlandSprite({required this.identifier, super.position, super.size});

  late final Sprite untouchedSprite;
  late final Sprite dugSprite;
  late final Sprite growingSprite;
  late final Sprite wateredSprite;
  late final Sprite grownSprite;
  FarmlandGrownSprite? grownOverlaySprite;

  Resource? seed;
  DateTime? completeAt;
  int wateringCount = 0;
  CalendarSeason currentSeason = CalendarSeason.summer;

  @override
  FutureOr<void> onLoad() {
    priority = 20;
    untouchedSprite = Sprite(game.images.fromCache("farmland_untouched_16x16.png"));
    dugSprite = Sprite(game.images.fromCache("farmland_dug_16x16.png"));
    growingSprite = Sprite(game.images.fromCache("farmland_growing_16x16.png"));
    wateredSprite = Sprite(game.images.fromCache("farmland_watered_16x16.png"));
    grownSprite = Sprite(game.images.fromCache("farmland_grown_16x16.png"));

    sprites = {
      FarmlandState.untouched: untouchedSprite,
      FarmlandState.dug: dugSprite,
      FarmlandState.growing: growingSprite,
      FarmlandState.watered: wateredSprite,
      FarmlandState.grown: grownSprite,
    };

    current = FarmlandState.untouched;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final season = ref.read(calendarProvider).season;
    if (currentSeason != season) {
      currentSeason = season;

      switch (season) {
        case CalendarSeason.summer:
          opacity = 1;
          break;
        case CalendarSeason.winter:
          current = FarmlandState.untouched;
          final provider = ref.read(farmlandDetailProvider(identifier).notifier);
          provider.setState(FarmlandState.untouched);
          provider.setCompleteAt(null);
          provider.setSeed(null);
          provider.setWateringCount(0);
          opacity = 0;
          completeAt = null;
          seed = null;
          wateringCount = 0;
          if (grownOverlaySprite != null) {
            remove(grownOverlaySprite!);
          }
          return;
      }
    }

    if (current == FarmlandState.grown) {
      return;
    }

    if (seed != null && current == FarmlandState.dug) {
      current = FarmlandState.growing;
      ref.read(farmlandDetailProvider(identifier).notifier).setState(FarmlandState.growing);
      return;
    }

    if (seed != null && (current == FarmlandState.growing || current == FarmlandState.watered)) {
      if (wateringCount > 0 && current == FarmlandState.growing) {
        current = FarmlandState.watered;
      }
      if (completeAt != null && completeAt!.isBefore(DateTime.now())) {
        current = FarmlandState.grown;
        ref.read(farmlandDetailProvider(identifier).notifier).setState(FarmlandState.grown);

        grownOverlaySprite = FarmlandGrownSprite(position: Vector2(0, 0), size: Vector2(16, 16));
        add(grownOverlaySprite!);
      }
    }

    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    final provider = ref.read(farmlandDetailProvider(identifier).notifier);

    if (currentSeason == CalendarSeason.winter) {
      ref.read(toastMessagesListProvider.notifier).add("You can't farm in the winter.");
      return;
    }

    if (!isWithinRadius(game.player.position, position, 64)) {
      return;
    }
    final tool = ref.read(selectedToolProvider);

    switch (current) {
      case FarmlandState.untouched:
        if (tool?.type == ToolType.shovel) {
          current = FarmlandState.dug;
          provider.setState(FarmlandState.dug);
          game.player.isMining = true;
          game.player.interactionAnimationType = PlayerInteractionAnimationType.hoe;

          game.player.miningDirection = getWalkDirectionForMining(game.player, this);

          Future.delayed(Duration(milliseconds: 400), () {
            game.player.isMining = false;
          });
        } else {
          ref.read(toastMessagesListProvider.notifier).add("Use a shovel to dig here.");
        }
        break;
      case FarmlandState.dug:
        ref.read(seedMenuProvider.notifier).openWith(this);
        break;
      case FarmlandState.growing:
      case FarmlandState.watered:
        if (tool?.type == ToolType.waterBucket) {
          game.player.isMining = true;
          game.player.interactionAnimationType = PlayerInteractionAnimationType.wateringCan;

          wateringCount += 1;
          provider.setWateringCount(wateringCount);
          Future.delayed(Duration(milliseconds: 400), () {
            game.player.isMining = false;
          });

          return;
        }

        if (seed != null && seed!.growsInto != null) {
          ref.read(toastMessagesListProvider.notifier).add("Growing ${seed!.growsInto!.namePlural} here.");
        }
      case FarmlandState.grown:
        if (seed == null) {
          return;
        }
        if (tool?.type == ToolType.sythe) {
          if (seed!.growsInto != null) {
            int amount = seed!.farmYieldMin == seed!.farmYieldMax ? seed!.farmYieldMin : randomInt(seed!.farmYieldMin, seed!.farmYieldMax);
            final wateredTooLittle = wateringCount == 0;
            final wateredTooMuch = wateringCount > 2;

            if (wateredTooLittle || wateredTooMuch) {
              amount = (amount / 2).round();
            }

            for (int i = 0; i < amount; i++) {
              ref.read(inventoryListProvider.notifier).addResource(seed!.growsInto!);
            }
            String? tip;
            if (wateredTooMuch) {
              tip = "Try not to water your crops that much.";
            }

            if (wateredTooLittle) {
              tip = "Dont forget to water your crops for a higher yield!";
            }
            ref
                .read(toastMessagesListProvider.notifier)
                .add("Harvested $amount ${amount == 1 ? seed!.growsInto!.name : seed!.growsInto!.namePlural}. ${tip ?? ''}");
          }

          completeAt = null;
          seed = null;
          current = FarmlandState.untouched;
          wateringCount = 0;
          provider.setState(FarmlandState.untouched);
          provider.setCompleteAt(null);
          provider.setSeed(null);
          provider.setWateringCount(0);
          if (grownOverlaySprite != null) {
            remove(grownOverlaySprite!);
          }
        } else {
          if (seed != null && seed!.growsInto != null) {
            ref.read(toastMessagesListProvider.notifier).add("Use a sythe to harvest the ${seed!.growsInto!.namePlural}.");
          }
        }

      default:
        break;
    }

    super.onTapDown(event);
  }
}
