import 'package:craftown/src/constants.dart';
import 'package:craftown/src/menus/providers/craft_menu_provider.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/inventory_map_provider.dart';
import 'package:craftown/src/providers/recipes_list_provider.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:craftown/src/widgets/recipes_selector_list.dart';
import 'package:craftown/src/widgets/shared/hold_down_button.dart';
import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CraftMenuWidget extends ConsumerWidget {
  const CraftMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuProvider = ref.read(craftMenuProvider.notifier);
    final invProvider = ref.read(inventoryListProvider.notifier);
    final menuState = ref.watch(craftMenuProvider);
    final recipes = ref.watch(recipesListProvider);

    final selectedResource = recipes[menuState.selectedIndex];

    final canCraft = selectedResource.canCraft(ref.watch(inventoryListProvider));

    return MenuContainer(
      title: "Crafting Table",
      handleClose: menuProvider.close,
      width: CRAFT_MENU_WIDTH,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: CRAFT_MENU_WIDTH / 2,
            height: CRAFT_MENU_HEIGHT,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: RecipeSelectorList(
              selectedIndex: menuState.selectedIndex,
              onSelect: (index) {
                menuProvider.setSelected(index);
              },
            ),
          ),
          SizedBox(
            width: CRAFT_MENU_WIDTH / 2,
            // height: CRAFT_MENU_HEIGHT,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedResource.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: PixelArtImageAsset(
                      "assets/images/resources/${selectedResource.assetFileNameLargeWithFallback}",
                      width: selectedResource.assetFileNameLarge != null ? selectedResource.placementWidth : 32,
                      height: selectedResource.assetFileNameLarge != null ? selectedResource.placementHeight : 32,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Recipe:",
                  ),
                  Wrap(
                    spacing: 4,
                    runSpacing: 2,
                    children: selectedResource.ingredients.map((ingredient) {
                      final inventoryCount = ref.watch(inventoryMapProvider)[ingredient.resource.identifier] ?? 0;

                      final hasEnough = inventoryCount >= ingredient.quantity;

                      return Container(
                        decoration: BoxDecoration(
                          color: hasEnough ? Colors.black12 : Colors.red.shade100,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PixelArtImageAsset(
                                "assets/images/resources/${ingredient.resource.assetFileName16}",
                                width: 16,
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(ingredient.resource.name),
                              ),
                              Text(hasEnough ? "x ${ingredient.quantity}" : "$inventoryCount/${ingredient.quantity}"),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Craft Time: ${selectedResource.secondsToCraft} ${selectedResource.secondsToCraft == 1 ? 'second' : 'seconds'}",
                  ),
                  if (selectedResource.secondsToCraft != null)
                    HoldDownButton(
                      duration: Duration(seconds: selectedResource.secondsToCraft!.round()),
                      disabledMessage: canCraft ? null : "Missing Resources",
                      label: "Craft",
                      onComplete: () {
                        invProvider.removeIngredients(selectedResource.ingredients);
                        invProvider.addResource(selectedResource);
                      },
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
