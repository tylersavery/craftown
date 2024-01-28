import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/recipe.dart';
import 'package:craftown/src/models/resource.dart';

class Resources {
  // PRIMARY
  static Resource get iron => Resource(
        identifier: "iron",
        name: "Iron",
        assetFileName16: "iron-16x16.png",
        assetFileNameLarge: "iron-32x32.png",
        secondsToMine: 2,
      );

  static Resource get copper => Resource(
        identifier: 'copper',
        name: "Copper",
        assetFileName16: "copper-16x16.png",
        assetFileNameLarge: "copper-32x32.png",
        secondsToMine: 3,
      );

  static Resource get wood => Resource(
        identifier: 'wood',
        name: "Wood",
        assetFileName16: "wood-16x16.png",
        secondsToMine: 1,
      );

  static Resource get water => Resource(
        identifier: 'water',
        name: "Water",
        assetFileName16: "water-16x16.png",
        secondsToMine: 0.5,
        isLiquid: true,
        requiredToMine: [Resources.woodenBucket],
      );

  static Resource get straw => Resource(
        identifier: "straw",
        assetFileName16: "straw-16x16.png",
        name: "Straw",
        secondsToMine: 1,
      );

// Secondary

  static Resource get woodenBucket => Resource(
        identifier: "wooden_bucket",
        assetFileName16: "wooden-bucket-16x16.png",
        name: "Wooden Bucket",
        secondsToCraft: 1,
        amountPerSlot: 1,
        canPlace: true,
        canPickUp: true,
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 5),
          Ingredient(resource: Resources.iron, quantity: 2),
        ],
      );

  static Resource get soup => Resource(
        identifier: "soup",
        assetFileName16: "soup-16x16.png",
        name: "Soup",
        secondsToCraft: 1,
        amountPerSlot: 10,
        ingredients: [
          Ingredient(resource: Resources.water, quantity: 2),
          Ingredient(resource: Resources.straw, quantity: 3),
        ],
        canConsume: true,
        isLiquid: true,
      );

  static Resource get screw => Resource(
        identifier: "screw",
        assetFileName16: "screw-16x16.png",
        name: "Screw",
        secondsToCraft: 10,
        ingredients: [
          Ingredient(resource: Resources.iron, quantity: 3),
        ],
      );

  static Resource get chest => Resource(
        identifier: "chest",
        assetFileName16: "chest-16x16.png",
        assetFileNameLarge: "chest-30x22.png",
        name: "Chest",
        secondsToCraft: 3,
        canPlace: true,
        placementWidth: 30,
        placementHeight: 22,
        slots: 4,
        amountPerSlot: 1,
        storageType: StorageType.solid,
        resourcesPerSlot: 50,
        interactionRadius: 48,
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 10),
        ],
      );

  static Resource get barrel => Resource(
        identifier: "barrel",
        assetFileName16: "barrel-16x16.png",
        assetFileNameLarge: "barrel-16x25.png",
        assetFileNameWhenFull: "barrel-full-16x25.png",
        name: "Barrel",
        secondsToCraft: 3,
        canPlace: true,
        placementWidth: 16,
        placementHeight: 25,
        amountPerSlot: 1,
        slots: 1,
        resourcesPerSlot: 50,
        storageType: StorageType.liquid,
        interactionRadius: 48,
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 10),
        ],
      );

  static Resource get constructorA => Resource(
        identifier: "constructor_a",
        assetFileName16: "constructor-a-16x16.png",
        assetFileNameLarge: "constructor-a-26x38.png",
        placementWidth: 26,
        placementHeight: 38,
        amountPerSlot: 1,
        name: "Constructor Mk 1",
        secondsToCraft: 10,
        ingredients: [
          Ingredient(resource: Resources.iron, quantity: 20),
          Ingredient(resource: Resources.copper, quantity: 10),
        ],
        storageType: StorageType.all,
        canPlace: true,
        slots: 1,
        resourcesPerSlot: 50,
        canConstruct: true,
        outputSlotSize: 100,
        interactionRadius: 48,
      );

  static List<Resource> get all => [
        Resources.iron,
        Resources.copper,
        Resources.wood,
        Resources.straw,
        Resources.screw,
        Resources.woodenBucket,
        Resources.soup,
        Resources.chest,
        Resources.constructorA,
      ];

  static List<Resource> get craftable => all.where((r) => r.secondsToCraft != null).toList();
  static List<Resource> get mineable => all.where((r) => r.secondsToMine != null).toList();
}
