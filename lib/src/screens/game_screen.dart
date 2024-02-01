import 'package:craftown/src/craftown.dart';
import 'package:craftown/src/menus/providers/craft_menu_provider.dart';
import 'package:craftown/src/menus/providers/game_menu_provider.dart';
import 'package:craftown/src/menus/providers/inventory_menu_provider.dart';
import 'package:craftown/src/menus/providers/resource_contents_menu_provider.dart';
import 'package:craftown/src/menus/providers/seed_menu_provider.dart';
import 'package:craftown/src/menus/providers/tool_menu_provider.dart';
import 'package:craftown/src/menus/widgets/craft_menu.dart';
import 'package:craftown/src/menus/widgets/game_menu.dart';
import 'package:craftown/src/menus/widgets/inventory_menu.dart';
import 'package:craftown/src/menus/widgets/resource_contents_menu.dart';
import 'package:craftown/src/menus/widgets/seed_menu.dart';
import 'package:craftown/src/menus/widgets/tool_menu.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/resource_in_hand_provider.dart';
import 'package:craftown/src/providers/selected_character_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/widgets/craft_button.dart';
import 'package:craftown/src/widgets/game_menu_button.dart';
import 'package:craftown/src/widgets/inventory_bar.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:craftown/src/widgets/stats_gui.dart';
import 'package:craftown/src/widgets/tool_button.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<RiverpodAwareGameWidgetState<Craftown>> gameWidgetKey = GlobalKey<RiverpodAwareGameWidgetState<Craftown>>();

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, _) {
        final character = ref.watch(selectedCharacterProvider);

        return Stack(
          children: [
            Focus(
              onKey: (node, event) => KeyEventResult.handled,
              child: RiverpodAwareGameWidget(
                game: Craftown(
                  character: character,
                ),
                key: gameWidgetKey,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GameMenuButton(),
                ),
              ),
            ),
            SafeArea(
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InventoryBar(),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ToolButton(),
                      SizedBox(width: 4),
                      CraftButton(),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StatsGui(),
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, _) {
                final toastMessages = ref.watch(toastMessagesListProvider);
                if (toastMessages.isNotEmpty) {
                  return Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: toastMessages.map((t) {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: t.type.bgColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          t.message,
                                          style: TextStyle(
                                            color: t.type.fgColor,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          ref.read(toastMessagesListProvider.notifier).remove(t);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: t.type.fgColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ));
                }

                return const SizedBox.shrink();
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                final resourceInHand = ref.watch(resourceInHandProvider);

                if (resourceInHand != null) {
                  return SafeArea(
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                ref.read(inventoryListProvider.notifier).addResource(resourceInHand);
                                ref.read(resourceInHandProvider.notifier).clear();
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  border: Border.all(
                                    color: Colors.white38,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: PixelArtImageAsset(
                                    resourceInHand.assetPath16,
                                    width: 16,
                                    height: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                if (ref.watch(inventoryMenuProvider).isOpen) {
                  return const Align(
                    alignment: Alignment.center,
                    child: InventoryMenuWidget(),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                if (ref.watch(craftMenuProvider).isOpen) {
                  return const Align(
                    alignment: Alignment.center,
                    child: CraftMenuWidget(),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                if (ref.watch(resourceContentsMenuProvider).isOpen) {
                  return const Align(
                    alignment: Alignment.center,
                    child: ResourceContentsMenuWidget(),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                if (ref.watch(toolMenuProvider).isOpen) {
                  return const Align(
                    alignment: Alignment.center,
                    child: ToolMenuWidget(),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                if (ref.watch(seedMenuProvider).isOpen) {
                  return const Align(
                    alignment: Alignment.center,
                    child: SeedMenuWidget(),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                if (ref.watch(gameMenuProvider).isOpen) {
                  return const Align(
                    alignment: Alignment.center,
                    child: GameMenuWidget(),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        );
      }),
    );
  }
}
