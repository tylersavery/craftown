// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:collection/collection.dart';
import 'package:craftown/src/constants.dart';
import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/menus/providers/inventory_menu_provider.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/resource_in_hand_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:craftown/src/widgets/shared/hold_down_button.dart';
import 'package:craftown/src/widgets/shared/inventory_slot_wrap.dart';
import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InventoryMenuWidget extends ConsumerWidget {
  const InventoryMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuProvider = ref.read(inventoryMenuProvider.notifier);
    final menuState = ref.watch(inventoryMenuProvider);
    final inventory = ref.watch(inventoryListProvider);
    final _inventoryProvider = ref.read(inventoryListProvider.notifier);

    final selectedSlot = inventory[menuState.selectedIndex];

    return MenuContainer(
        title: "Inventory",
        handleClose: menuProvider.close,
        width: INVENTORY_MENU_WIDTH,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: CRAFT_MENU_WIDTH / 2,
              // height: CRAFT_MENU_HEIGHT,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1,
                    color: Colors.black12,
                  ),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InventorySlotWrap(
                  selectedIndex: menuState.selectedIndex,
                  onTap: (int index, bool withMessage) {
                    final slot = inventory[index];
                    if (slot.resource != null) {
                      menuProvider.setSelected(index);
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              width: INVENTORY_MENU_WIDTH / 2,
              child: Builder(
                builder: (context) {
                  if (selectedSlot.resource == null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Select Item",
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  final resource = selectedSlot.resource!;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              resource.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PixelArtImageAsset(
                              "assets/images/resources/${resource.assetFileNameLargeWithFallback}",
                              width: resource.assetFileNameLarge != null ? resource.placementWidth * 2 : 64,
                              height: resource.assetFileNameLarge != null ? resource.placementHeight * 2 : 64,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              resource.description,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.1,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (resource.canPlace)
                              HoldDownButton(
                                duration: Duration(
                                  seconds: 0,
                                ),
                                completeOnClick: true,
                                label: "Place",
                                onComplete: () {
                                  _inventoryProvider.removeResource(resource, 1);
                                  ref.read(resourceInHandProvider.notifier).set(resource);
                                  menuProvider.close();
                                },
                                small: true,
                              ),
                            if (resource.canConsume)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HoldDownButton(
                                  duration: Duration(
                                    seconds: 1,
                                  ),
                                  label: "Consume",
                                  onComplete: () {
                                    _inventoryProvider.consume(resource, 1);
                                  },
                                ),
                              ),
                            if (resource.canEquip)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HoldDownButton(
                                  label: "Equip",
                                  duration: Duration.zero,
                                  onComplete: () {
                                    final toolName = resource.equipsTool;

                                    final tool = Tools.allTools.firstWhereOrNull((t) => t.identifier == toolName);

                                    if (tool != null) {
                                      ref.read(selectedToolProvider.notifier).set(tool);
                                      ref.read(inventoryMenuProvider.notifier).close();
                                    }
                                  },
                                  completeOnClick: true,
                                  small: true,
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
