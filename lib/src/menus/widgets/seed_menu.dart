import 'package:craftown/src/constants.dart';
import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/menus/providers/inventory_menu_provider.dart';
import 'package:craftown/src/menus/providers/seed_menu_provider.dart';
import 'package:craftown/src/menus/providers/tool_menu_provider.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/inventory_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeedMenu extends ConsumerWidget {
  const SeedMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuProvider = ref.read(seedMenuProvider.notifier);
    final menuState = ref.watch(seedMenuProvider);

    final allSeeds = ref
        .watch(inventoryProvider)
        .where((slot) => slot.resource?.isSeed == true) // Filter out slots with null types
        .expand((slot) => List<Resource>.filled(slot.count, slot.resource!)) // Create a list of types based on count
        .toList();

    Map<String, List<Resource>> groupedMap = {};

    for (final resource in allSeeds) {
      if (!groupedMap.containsKey(resource.identifier)) {
        groupedMap[resource.identifier] = [];
      }
      groupedMap[resource.identifier]!.add(resource);
    }

    List<List<Resource>> groupedResources = groupedMap.values.toList();

    return MenuContainer(
      title: "Seeds",
      handleClose: () {
        menuProvider.close();
      },
      width: SEED_MENU_WIDTH,
      child: SizedBox(
        width: SEED_MENU_WIDTH,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Builder(builder: (context) {
                if (groupedResources.isEmpty) {
                  return Text("No seeds in inventory.");
                }
                return Wrap(
                  alignment: WrapAlignment.center,
                  children: groupedResources.map((resource) {
                    // final isSelected = selectedTool == tool;

                    return InkWell(
                      onTap: () {
                        if (menuState.farmlandSprite != null) {
                          ref.read(inventoryProvider.notifier).removeResource(resource.first, 1);
                          menuState.farmlandSprite!.seed = resource.first;
                          menuState.farmlandSprite!.completeAt = DateTime.now().add(Duration(seconds: resource.first.secondsToGrow));
                        }

                        menuProvider.close();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PixelArtImageAsset(
                              "assets/images/resources/${resource.first.assetFileNameLargeWithFallback}",
                              width: 32,
                              height: 32,
                            ),
                            Text("${resource.length}")
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            )),
      ),
    );
  }
}
