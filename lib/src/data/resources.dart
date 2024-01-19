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
        amountPerSlot: 3,
      );

  static Resource get copper => Resource(
        identifier: 'copper',
        name: "Copper",
        assetFileName16: "copper-16x16.png",
        assetFileNameLarge: "copper-32x32.png",
        secondsToMine: 3,
        amountPerSlot: 25,
      );

  static Resource get wood => Resource(
        identifier: 'wood',
        name: "Wood",
        assetFileName16: "wood-16x16.png",
        secondsToMine: 1,
        amountPerSlot: 3,
      );

  static Resource get water => Resource(
        identifier: 'water',
        name: "Water",
        assetFileName16: "water-16x16.png",
        secondsToMine: 0.5,
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
        ingredients: [
          Ingredient(resource: Resources.water, quantity: 2),
          Ingredient(resource: Resources.straw, quantity: 3),
        ],
        canConsume: true,
      );

  static Resource get constructorA => Resource(
        identifier: "constructor_a",
        assetFileName16: "constructor-a-16x16.png",
        assetFileNameLarge: "constructor-a-26x38.png",
        placementWidth: 26,
        placementHeight: 38,
        name: "Constructor Mk 1",
        secondsToCraft: 10,
        ingredients: [
          Ingredient(resource: Resources.iron, quantity: 20),
          Ingredient(resource: Resources.copper, quantity: 10),
        ],
        canPlace: true,
        slots: 1,
        resourcesPerSlot: 50,
        canConstruct: true,
      );

  static List<Resource> get all => [
        Resources.iron,
        Resources.copper,
        Resources.wood,
        Resources.straw,
        Resources.woodenBucket,
        Resources.soup,
        Resources.constructorA,
      ];

  static List<Resource> get craftable => all.where((r) => r.secondsToCraft != null).toList();
  static List<Resource> get mineable => all.where((r) => r.secondsToMine != null).toList();
}
