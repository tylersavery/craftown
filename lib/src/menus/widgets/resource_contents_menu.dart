// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/menus/providers/inventory_menu_provider.dart';
import 'package:craftown/src/menus/providers/resource_contents_menu_provider.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/modifier_key_provider.dart';
import 'package:craftown/src/providers/placed_resource_detail_provider.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:craftown/src/providers/recipes_list_provider.dart';
import 'package:craftown/src/providers/stats_detail_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:craftown/src/screens/game_screen.dart';
import 'package:craftown/src/widgets/pixel_art_image_asset.dart';
import 'package:craftown/src/widgets/recipes_selector_list.dart';
import 'package:craftown/src/widgets/shared/hold_down_button.dart';
import 'package:craftown/src/widgets/shared/inventory_slot_wrap.dart';
import 'package:craftown/src/widgets/shared/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResourceContentsMenuWidget extends ConsumerWidget {
  const ResourceContentsMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuProvider = ref.read(resourceContentsMenuProvider.notifier);
    final menuState = ref.watch(resourceContentsMenuProvider);

    final inventory = ref.watch(inventoryListProvider);

    final selectedPlacedResource = menuState.placedResource;

    if (selectedPlacedResource == null) {
      print("selectedPlacedResource is null in resource content menu");
      return SizedBox();
    }

    final placedResource = ref.watch(placedResourceDetailProvider(selectedPlacedResource.uniqueIdentifier));

    if (placedResource == null) {
      print("placedResource is null in resource content menu");
      return SizedBox();
    }
    final selectedRecipe = placedResource.selectedRecipe;

    final sprite = placedResource.sprite;
    final resource = sprite.resource;

    final hasTwoColumns = placedResource.sprite.resource.showInventoryColumnInResourceContentsMenu;

    return MenuContainer(
        title: sprite.resource.name,
        handleClose: menuProvider.close,
        width: INVENTORY_MENU_WIDTH / (hasTwoColumns ? 1 : 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasTwoColumns)
              Container(
                width: INVENTORY_MENU_WIDTH / 2,
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
                  child: Builder(builder: (context) {
                    if (placedResource.sprite.resource.canConstruct && selectedRecipe == null) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Select Recipe:",
                          ),
                          RecipeSelectorList(
                            listType: RecipeListType.constructable,
                            onSelect: (index) {
                              final recipe = ref.read(recipeListProvider(RecipeListType.constructable))[index];

                              ref.read(placedResourceDetailProvider(placedResource.uniqueIdentifier).notifier).selectRecipe(recipe);
                            },
                          )
                        ],
                      );
                    }

                    return InventorySlotWrap(
                      selectedIndex: -1,
                      onTap: (int index, bool withMessage) {
                        final slot = inventory[index];

                        if (slot.resource == null) return;

                        final resource = slot.resource!;
                        final placedResourceSprite = placedResource.sprite;

                        final storageType = placedResource.sprite.resource.storageType;
                        if (storageType == StorageType.liquid && !resource.isLiquid) {
                          if (withMessage) {
                            ref.read(toastMessagesListProvider.notifier).add("Only liquids can be stored in ${placedResourceSprite.resource.name}");
                          }
                          return;
                        }

                        if (storageType == StorageType.solid && resource.isLiquid) {
                          if (withMessage) {
                            ref.read(toastMessagesListProvider.notifier).add("Liquids can't be stored in ${placedResourceSprite.resource.name}");
                          }
                          return;
                        }

                        if (storageType == StorageType.specific) {
                          if (!placedResource.sprite.resource.specificStorageWhitelist.contains(resource)) {
                            if (withMessage) {
                              ref
                                  .read(toastMessagesListProvider.notifier)
                                  .add("${resource.namePlural} can't be stored in ${placedResourceSprite.resource.name}");
                            }
                            return;
                          }
                        }

                        final success = ref.read(placedResourceDetailProvider(placedResource.uniqueIdentifier).notifier).addContents(resource);
                        if (success) {
                          ref.read(inventoryListProvider.notifier).removeResource(resource, 1);
                        }
                      },
                    );
                  }),
                ),
              ),
            SizedBox(
              width: INVENTORY_MENU_WIDTH / 2,
              // height: INVENTORY_MENU_HEIGHT,
              child: Builder(
                builder: (context) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Builder(builder: (context) {
                        final slots = List.generate(resource.slots, (index) => index);

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (placedResource.sprite.resource.isMiner && placedResource.sprite.resource.miningOutputResource != null) ...[
                              Text("Mining:"),
                              PixelArtImageAsset(
                                "assets/images/resources/${placedResource.sprite.resource.miningOutputResource!.assetFileNameLargeWithFallback}",
                                width: placedResource.sprite.resource.miningOutputResource!.assetFileNameLarge != null
                                    ? placedResource.sprite.resource.miningOutputResource!.placementWidth * 2
                                    : 32,
                                height: placedResource.sprite.resource.miningOutputResource!.assetFileNameLarge != null
                                    ? placedResource.sprite.resource.miningOutputResource!.placementHeight * 2
                                    : 32,
                              ),
                            ],
                            if (placedResource.sprite.resource.canConstruct && selectedRecipe != null) ...[
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Active Recipe: "),
                                  InkWell(
                                      onTap: () {
                                        ref.read(placedResourceDetailProvider(placedResource.uniqueIdentifier).notifier).selectRecipe(null);
                                      },
                                      child: Text("[Clear]")),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    PixelArtImageAsset(
                                      "assets/images/resources/${selectedRecipe.assetFileNameLargeWithFallback}",
                                      width: selectedRecipe.assetFileNameLarge != null ? selectedRecipe.placementWidth * 2 : 64,
                                      height: selectedRecipe.assetFileNameLarge != null ? selectedRecipe.placementHeight * 2 : 64,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          selectedRecipe.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "Craft Time: ${selectedRecipe.secondsToCraft} ${selectedRecipe.secondsToCraft == 1 ? 'second' : 'seconds'}",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Recipe:",
                              ),
                              Wrap(
                                spacing: 4,
                                runSpacing: 2,
                                children: selectedRecipe.ingredients.map((ingredient) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
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
                                          Text("x ${ingredient.quantity}"),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                            // if (resource.slots > 0) ...[
                            //   SizedBox(
                            //     height: 8,
                            //   ),
                            //   Text(
                            //     "Contents:",
                            //   ),
                            // ],
                            SizedBox(
                              height: 8,
                            ),
                            if (resource.slots > 0)
                              Text(
                                resource.canConstruct ? "Input:" : "Contents:",
                              ),
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 4,
                              runSpacing: 4,
                              children: slots.asMap().entries.map((entry) {
                                final index = entry.key;
                                return Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.black12,
                                    ),
                                  ),
                                  child: Builder(builder: (context) {
                                    if (placedResource.contents[index].isNotEmpty) {
                                      final r = placedResource.contents[index].first;
                                      final count = placedResource.contents[index].length;

                                      return InkWell(
                                        onTap: () {
                                          int amountToRemove = 1;

                                          final totalInSlot = placedResource.contents[index].length;

                                          if (ref.read(modifierKeyProvider).shiftPressed) {
                                            amountToRemove = min(INVENTORY_MOVE_WHEN_SHIFT_PRESSED, totalInSlot);
                                          }

                                          final removedResources = ref
                                              .read(placedResourceDetailProvider(placedResource.uniqueIdentifier).notifier)
                                              .removeContents(index, amountToRemove);
                                          if (removedResources != null) {
                                            for (final r in removedResources) {
                                              ref.read(inventoryListProvider.notifier).addResource(r);
                                            }
                                          }
                                        },
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: PixelArtImageAsset(
                                                "assets/images/resources/${r.assetFileName16}",
                                                width: 32,
                                                height: 32,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(
                                                  count.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }

                                    return SizedBox();
                                  }),
                                );
                              }).toList(),
                            ),
                            if (placedResource.sprite.resource.outputSlotSize > 0) ...[
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Ouput:",
                              ),
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black12,
                                  ),
                                ),
                                child: Builder(builder: (context) {
                                  if (placedResource.outputSlotContents.isNotEmpty) {
                                    final r = placedResource.outputSlotContents.first;
                                    final count = placedResource.outputSlotContents.length;
                                    return InkWell(
                                      onTap: () {
                                        int amountToRemove = 1;

                                        if (ref.read(modifierKeyProvider).shiftPressed) {
                                          amountToRemove = min(INVENTORY_MOVE_WHEN_SHIFT_PRESSED, placedResource.outputSlotContents.length);
                                        }

                                        final removedResources = ref
                                            .read(placedResourceDetailProvider(placedResource.uniqueIdentifier).notifier)
                                            .removeFromOutputSlot(amountToRemove);
                                        for (final removed in removedResources) {
                                          ref.read(inventoryListProvider.notifier).addResource(removed);
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: PixelArtImageAsset(
                                              "assets/images/resources/${r.assetFileName16}",
                                              width: 32,
                                              height: 32,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                count.toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                  return SizedBox();
                                }),
                              ),
                            ],
                            if (placedResource.sprite.resource.canConstruct && selectedRecipe != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HoldDownButton(
                                  label: placedResource.isConstructing ? "Stop Constructing" : "Start Constructing",
                                  duration: Duration.zero,
                                  onComplete: () {
                                    ref.read(placedResourceDetailProvider(placedResource.uniqueIdentifier).notifier).toggleConstruction();
                                  },
                                  completeOnClick: true,
                                  small: true,
                                ),
                              ),
                            if (placedResource.sprite.resource.canSmelt)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HoldDownButton(
                                  label: placedResource.isSmelting ? "Stop Smelting" : "Start Smelting",
                                  duration: Duration.zero,
                                  onComplete: () {
                                    ref.read(placedResourceDetailProvider(placedResource.uniqueIdentifier).notifier).toggleSmelting();
                                  },
                                  completeOnClick: true,
                                  small: true,
                                ),
                              ),
                            if (placedResource.sprite.resource.isMiner)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HoldDownButton(
                                  label: placedResource.isMining ? "Stop Mining" : "Start Mining",
                                  duration: Duration.zero,
                                  onComplete: () {
                                    ref.read(placedResourceDetailProvider(placedResource.uniqueIdentifier).notifier).toggleMining();
                                  },
                                  completeOnClick: true,
                                  small: true,
                                ),
                              ),
                            if (placedResource.sprite.resource.contentsWillSell)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HoldDownButton(
                                  label: placedResource.isSelling ? "Stop Selling" : "Start Selling",
                                  duration: Duration.zero,
                                  onComplete: () {
                                    ref.read(placedResourceDetailProvider(placedResource.uniqueIdentifier).notifier).toggleSelling();
                                  },
                                  completeOnClick: true,
                                  small: true,
                                ),
                              ),

                            if (placedResource.sprite.resource.canGeneratePower)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HoldDownButton(
                                  label: placedResource.isPowerGenerating ? "Stop Generating" : "Start Generating",
                                  duration: Duration.zero,
                                  onComplete: () {
                                    ref.read(placedResourceDetailProvider(placedResource.uniqueIdentifier).notifier).togglePowerGenerating();
                                  },
                                  completeOnClick: true,
                                  small: true,
                                ),
                              ),

                            if (placedResource.sprite.resource.isHouse)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HoldDownButton(
                                  label: "Enter",
                                  duration: Duration.zero,
                                  onComplete: () {
                                    // final level = IndoorLevel(player: gameWidgetKey.currentState!.currentGame.player);
                                    if (gameWidgetKey.currentState == null) {
                                      print("GameState NULL");
                                      return false;
                                    }
                                    ref.read(resourceContentsMenuProvider.notifier).close();
                                    ref.read(toastMessagesListProvider.notifier).add("Can't enter building.");
                                  },
                                  completeOnClick: true,
                                  small: true,
                                ),
                              ),

                            if (placedResource.sprite.resource.canRest)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HoldDownButton(
                                  label: "Rest",
                                  duration: Duration(seconds: 3),
                                  onComplete: () {
                                    final provider = ref.read(statsDetailProvider.notifier);

                                    provider.increaseEnergy(placedResource.sprite.resource.restValue ?? 0.1);
                                    provider.increaseThirst(0.05);
                                    provider.increaseHunger(0.075);
                                  },
                                  small: true,
                                ),
                              ),
                            if (placedResource.sprite.resource.canPlace && !placedResource.isConstructing)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: HoldDownButton(
                                  label: "Pick Up",
                                  duration: Duration.zero,
                                  onComplete: () {
                                    ref.read(placedResourcesListProvider.notifier).pickup(placedResource);
                                    ref.read(resourceContentsMenuProvider.notifier).close();
                                    ref.read(inventoryMenuProvider.notifier).open();
                                  },
                                  completeOnClick: true,
                                  small: true,
                                ),
                              ),
                          ],
                        );
                      }),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
