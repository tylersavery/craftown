import 'dart:async';

import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/menus/providers/seed_menu_provider.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/tool.dart';
import 'package:craftown/src/providers/farmland_detail_provider.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/utils/collisions.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_riverpod/flame_riverpod.dart';

enum FarmlandState {
  untouched("untouched"),
  dug("dug"),
  growing("growing"),
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
  late final Sprite grownSprite;

  Resource? seed;
  DateTime? completeAt;

  @override
  FutureOr<void> onLoad() {
    priority = 20;
    untouchedSprite = Sprite(game.images.fromCache("farmland_untouched_16x16.png"));
    dugSprite = Sprite(game.images.fromCache("farmland_dug_16x16.png"));
    growingSprite = Sprite(game.images.fromCache("farmland_growing_16x16.png"));
    grownSprite = Sprite(game.images.fromCache("farmland_grown_16x16.png"));

    sprites = {
      FarmlandState.untouched: untouchedSprite,
      FarmlandState.dug: dugSprite,
      FarmlandState.growing: growingSprite,
      FarmlandState.grown: grownSprite,
    };

    current = FarmlandState.untouched;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (current == FarmlandState.grown) {
      return;
    }

    if (seed != null && current == FarmlandState.dug) {
      current = FarmlandState.growing;
      ref.read(farmlandDetailProvider(identifier).notifier).setState(FarmlandState.growing);
      return;
    }

    if (seed != null && current == FarmlandState.growing) {
      if (completeAt != null && completeAt!.isBefore(DateTime.now())) {
        current = FarmlandState.grown;
        ref.read(farmlandDetailProvider(identifier).notifier).setState(FarmlandState.grown);
      }
    }

    super.update(dt);
  }

  @override
  void onTapUp(TapUpEvent event) {
    final provider = ref.read(farmlandDetailProvider(identifier).notifier);

    if (!isWithinRadius(game.player.position, position, 48)) {
      return;
    }
    final tool = ref.read(selectedToolProvider);

    switch (current) {
      case FarmlandState.untouched:
        if (tool?.type == ToolType.shovel) {
          current = FarmlandState.dug;
          provider.setState(FarmlandState.dug);
        } else {
          ref.read(toastMessagesListProvider.notifier).add("Use a shovel to dig here.");
        }
        break;
      case FarmlandState.dug:
        ref.read(seedMenuProvider.notifier).openWith(this);
        break;
      case FarmlandState.growing:
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

            for (int i = 0; i < amount; i++) {
              ref.read(inventoryListProvider.notifier).addResource(seed!.growsInto!);
            }
            ref
                .read(toastMessagesListProvider.notifier)
                .add("Harvested $amount ${amount == 1 ? seed!.growsInto!.name : seed!.growsInto!.namePlural}.");
          }

          completeAt = null;
          seed = null;
          current = FarmlandState.untouched;
          provider.setState(FarmlandState.untouched);
          provider.setCompleteAt(null);
          provider.setSeed(null);
        } else {
          if (seed != null && seed!.growsInto != null) {
            ref.read(toastMessagesListProvider.notifier).add("Use a sythe to harvest the ${seed!.growsInto!.namePlural}.");
          }
        }

      default:
        break;
    }

    super.onTapUp(event);
  }
}
