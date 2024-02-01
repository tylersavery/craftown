import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/recipe.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/models/tool.dart';

class Resources {
  // PRIMARY
  static Resource get iron => Resource(
        identifier: "iron",
        name: "Iron Ore",
        namePlural: "Iron Ore",
        assetFileName16: "iron-16x16.png",
        assetFileNameLarge: "iron-32x32.png",
        secondsToMine: 2,
        miningToolRequiredIdentifier: "pick",
      );

  static Resource get stone => Resource(
        identifier: "stone",
        name: "Stone Ore",
        namePlural: "Stone Ore",
        assetFileName16: "stone-16x16.png",
        assetFileNameLarge: "stone-32x32.png",
        secondsToMine: 2,
        miningToolRequiredIdentifier: "pick",
      );

  static Resource get copper => Resource(
        identifier: 'copper',
        name: "Copper",
        namePlural: "Copper Ore",
        assetFileName16: "copper-16x16.png",
        assetFileNameLarge: "copper-32x32.png",
        secondsToMine: 3,
        miningToolRequiredIdentifier: "pick",
      );

  static Resource get wood => Resource(
        identifier: 'wood',
        name: "Wood",
        namePlural: "Wood",
        assetFileName16: "wood-16x16.png",
        secondsToMine: 1,
        miningToolRequiredIdentifier: "axe",
      );

  static Resource get water => Resource(
        identifier: 'water',
        name: "Water",
        namePlural: "Water",
        assetFileName16: "water-16x16.png",
        secondsToMine: 0.5,
        isLiquid: true,
        requiredToMine: [Resources.woodenBucket],
        miningToolRequiredIdentifier: "water_bucket",
      );

  static Resource get straw => Resource(
        identifier: "straw",
        namePlural: "Straw",
        assetFileName16: "straw-16x16.png",
        name: "Straw",
        secondsToMine: 1,
        miningToolRequiredIdentifier: "sythe",
      );

  //Farming

  static Resource get potato => Resource(
        identifier: "potato",
        assetFileName16: "potato-16x16.png",
        name: "Potato",
        namePlural: "Potatos",
        energyWhenConsumed: 0.2,
        saleValue: 2,
      );

  static Resource get potatoSeed => Resource(
        identifier: "potato_seed",
        assetFileName16: "potato-seed-16x16.png",
        name: "Potato Seed",
        namePlural: "Potato Seeds",
        isSeed: true,
        growsInto: Resources.potato,
        farmYieldMin: 4,
        farmYieldMax: 6,
      );

  static Resource get carrot => Resource(
        identifier: "carrot",
        assetFileName16: "carrot-16x16.png",
        name: "Carrot",
        namePlural: "Carrots",
        energyWhenConsumed: 0.15,
        saleValue: 1,
      );

  static Resource get carrotSeed => Resource(
        identifier: "carrot_seed",
        assetFileName16: "carrot-seed-16x16.png",
        name: "Carrot Seed",
        namePlural: "Carrot Seeds",
        isSeed: true,
        growsInto: Resources.carrot,
        farmYieldMin: 14,
        farmYieldMax: 20,
      );

  static Resource get garlic => Resource(
        identifier: "garlic",
        assetFileName16: "garlic-10x12.png",
        name: "Garlic",
        namePlural: "Garlic",
        energyWhenConsumed: 0.03,
        saleValue: 3,
        placementWidth: 10,
        placementHeight: 12,
      );

  static Resource get garlicSeed => Resource(
        identifier: "garlic_seed",
        assetFileName16: "garlic-seed-16x16.png",
        name: "Garlic Seed",
        namePlural: "Garlic Seeds",
        isSeed: true,
        growsInto: Resources.garlic,
        farmYieldMin: 4,
        farmYieldMax: 10,
      );

// Secondary

  static Resource get woodenBucket => Resource(
        identifier: "wooden_bucket",
        assetFileName16: "wooden-bucket-16x16.png",
        name: "Wooden Bucket",
        namePlural: "Wooden Buckets",
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
        namePlural: "Soup",
        secondsToCraft: 1,
        amountPerSlot: 10,
        ingredients: [
          Ingredient(resource: Resources.water, quantity: 2),
          Ingredient(resource: Resources.straw, quantity: 3),
        ],
        energyWhenConsumed: 0.1,
        isLiquid: true,
      );

  static Resource get screw => Resource(
        identifier: "screw",
        assetFileName16: "screw-16x16.png",
        name: "Screw",
        namePlural: "Screws",
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
        namePlural: "Chests",
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

  static Resource get communityChest => Resource(
        identifier: "community_chest",
        assetFileName16: "community-chest-16x16.png",
        assetFileNameLarge: "community-chest-30x22.png",
        name: "Community Chest",
        namePlural: "Community Chests",
        secondsToCraft: 10,
        canPlace: true,
        placementWidth: 30,
        placementHeight: 22,
        slots: 4,
        amountPerSlot: 1,
        storageType: StorageType.solid,
        resourcesPerSlot: 50,
        interactionRadius: 48,
        contentsWillSell: true,
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 15),
          Ingredient(resource: Resources.iron, quantity: 10),
        ],
      );

  static Resource get barrel => Resource(
        identifier: "barrel",
        assetFileName16: "barrel-16x16.png",
        assetFileNameLarge: "barrel-16x25.png",
        assetFileNameWhenFull: "barrel-full-16x25.png",
        name: "Barrel",
        namePlural: "Barrels",
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
        name: "Constructor",
        namePlural: "Constructors",
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

  static Resource get minerA => Resource(
      identifier: "miner_a",
      assetFileName16: "miner-a-16x16.png",
      assetFileNameLarge: "miner-a-12x23.png",
      name: "Miner",
      namePlural: "Miners",
      secondsToCraft: 5,
      canPlace: true,
      placementWidth: 12,
      placementHeight: 23,
      interactionRadius: 48,
      outputSlotSize: 25,
      storageType: StorageType.solid,
      ingredients: [
        Ingredient(resource: Resources.iron, quantity: 10),
        Ingredient(resource: Resources.stone, quantity: 10),
      ],
      miningOutputResource: Resources.iron,
      canOnlyBePlacedOn: [
        Resources.stone,
        Resources.iron,
        Resources.straw,
        Resources.copper,
        Resources.wood,
      ]);

  static Resource get well => Resource(
        identifier: "well",
        assetFileName16: "well-16x16.png",
        assetFileNameLarge: "well-48x57.png",
        name: "Well",
        namePlural: "Wells",
        secondsToCraft: 5,
        canPlace: true,
        placementWidth: 48,
        placementHeight: 57,
        interactionRadius: 54,
        outputSlotSize: 25,
        storageType: StorageType.liquid,
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 15),
          Ingredient(resource: Resources.iron, quantity: 5),
          Ingredient(resource: Resources.stone, quantity: 50),
        ],
        miningOutputResource: Resources.water,
        canOnlyBePlacedOn: null,
      );

  static List<Resource> get all => [
        //Primary
        Resources.stone,
        Resources.iron,
        Resources.copper,
        Resources.wood,
        Resources.straw,

        //Secondary
        Resources.screw,
        Resources.woodenBucket,
        Resources.soup,
        Resources.chest,
        Resources.communityChest,
        Resources.constructorA,
        Resources.well,
        Resources.minerA,

        // Farming
        Resources.carrotSeed,
        Resources.carrot,
        Resources.potatoSeed,
        Resources.potato,
        Resources.garlicSeed,
        Resources.garlic,
      ];

  static List<Resource> get craftable => all.where((r) => r.secondsToCraft != null).toList();
  static List<Resource> get mineable => all.where((r) => r.secondsToMine != null).toList();
}
