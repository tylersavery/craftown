import 'package:craftown/src/components/player.dart';
import 'package:craftown/src/data/research_levels.dart';
import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/resource.dart';

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
        spawnedResourceHitboxWidth: 27,
        spawnedResourceHitboxHeight: 25,
        spawnedResourceHitboxOffsetX: 2,
        spawnedResourceHitboxOffsetY: 3,
        smeltsInto: "iron_plate",
      );

  static Resource get stone => Resource(
        identifier: "stone",
        name: "Stone Ore",
        namePlural: "Stone Ore",
        assetFileName16: "stone-16x16.png",
        assetFileNameLarge: "stone-32x32.png",
        secondsToMine: 2,
        miningToolRequiredIdentifier: "pick",
        spawnedResourceHitboxWidth: 27,
        spawnedResourceHitboxHeight: 25,
        spawnedResourceHitboxOffsetX: 2,
        spawnedResourceHitboxOffsetY: 3,
        smeltsInto: "stone",
      );

  static Resource get clay => Resource(
        identifier: 'clay',
        name: "Clay",
        namePlural: "Clay Ore",
        assetFileName16: "clay-16x16.png",
        assetFileNameLarge: "clay-24x20.png",
        placementWidth: 24,
        placementHeight: 20,
        secondsToMine: 1,
        miningToolRequiredIdentifier: "shovel",
        smeltsInto: "brick",
        interactionAnimation: PlayerInteractionAnimationType.hoe,
      );

  static Resource get copper => Resource(
        identifier: 'copper',
        name: "Copper",
        namePlural: "Copper Ore",
        assetFileName16: "copper-16x16.png",
        assetFileNameLarge: "copper-32x32.png",
        secondsToMine: 3,
        miningToolRequiredIdentifier: "pick",
        spawnedResourceHitboxWidth: 12,
        spawnedResourceHitboxHeight: 8,
        spawnedResourceHitboxOffsetX: 2,
        spawnedResourceHitboxOffsetY: 4,
        // smeltsInto: "wire",
      );

  static Resource get wood => Resource(
        identifier: 'wood',
        name: "Wood",
        namePlural: "Wood",
        assetFileName16: "wood-16x16.png",
        secondsToMine: 1,
        miningToolRequiredIdentifier: "axe",
        spawnedResourceHitboxWidth: 16,
        spawnedResourceHitboxHeight: 16,
        spawnedResourceHitboxOffsetX: 0,
        spawnedResourceHitboxOffsetY: 0,
        interactionAnimation: PlayerInteractionAnimationType.axe,
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
        thirstDecreaseOnConsumption: 0.2,
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

  static Resource get soil => Resource(
          identifier: 'soil',
          name: "Soil",
          namePlural: "Soil Ore",
          assetFileName16: "soil-16x16.png",
          secondsToCraft: 5,
          canPlace: true,
          canFarm: true,
          placeWithHitbox: false,
          ingredients: [
            Ingredient(resource: Resources.clay, quantity: 5),
          ]

          // smeltsInto: "wire",
          );

  static Resource get potato => Resource(
        identifier: "potato",
        assetFileName16: "potato-16x16.png",
        name: "Potato",
        namePlural: "Potatos",
        hungerDecreaseOnConsumption: 0.2,
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
        storeCost: 2,
        farmlandGrownAssetPath: "farming/grown-potato-11x17.png",
        farmlandGrownWidth: 11,
        farmlandGrownHeight: 17,
      );

  static Resource get carrot => Resource(
        identifier: "carrot",
        assetFileName16: "carrot-16x16.png",
        name: "Carrot",
        namePlural: "Carrots",
        hungerDecreaseOnConsumption: 0.15,
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
        storeCost: 3,
        farmlandGrownAssetPath: "farming/grown-carrot-10x16.png",
        farmlandGrownWidth: 10,
        farmlandGrownHeight: 16,
      );

  static Resource get garlic => Resource(
        identifier: "garlic",
        assetFileName16: "garlic-10x12.png",
        name: "Garlic",
        namePlural: "Garlic",
        hungerDecreaseOnConsumption: 0.03,
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
        storeCost: 5,
        farmlandGrownAssetPath: "farming/grown-garlic-10x17.png",
        farmlandGrownWidth: 10,
        farmlandGrownHeight: 17,
      );

  static Resource get tomato => Resource(
        identifier: "tomato",
        assetFileName16: "tomato-16x16.png",
        name: "Tomato",
        namePlural: "Tomato",
        hungerDecreaseOnConsumption: 0.03,
        saleValue: 3,
      );

  static Resource get tomatoSeed => Resource(
        identifier: "tomato_seed",
        assetFileName16: "tomato-seed-16x16.png",
        name: "Tomato Seed",
        namePlural: "Tomato Seeds",
        isSeed: true,
        growsInto: Resources.tomato,
        farmYieldMin: 4,
        farmYieldMax: 10,
        storeCost: 5,
        farmlandGrownAssetPath: "farming/grown-tomato-14x29.png",
        farmlandGrownWidth: 10,
        farmlandGrownHeight: 17,
      );

// Smeltables

  static Resource get ironPlate => Resource(
        identifier: "iron_plate",
        assetFileName16: "iron-plate-16x16.png",
        assetFileNameLarge: "iron-plate-28x24.png",
        name: "Iron Plate",
        namePlural: "Iron Plates",
        secondsToSmelt: 10,
        researchRequirements: [ResearchLevels.smelting1],
        ingredients: [
          Ingredient(resource: Resources.iron, quantity: 3),
        ],
      );

  static Resource get copperPlate => Resource(
        identifier: "copper_plate",
        assetFileName16: "copper-plate-16x16.png",
        assetFileNameLarge: "copper-plate-28x24.png",
        name: "Copper Plate",
        namePlural: "Copper Plates",
        secondsToSmelt: 10,
        ingredients: [
          Ingredient(resource: Resources.copper, quantity: 3),
        ],
        researchRequirements: [ResearchLevels.smelting1],
      );

  static Resource get brick => Resource(
        identifier: "brick",
        assetFileName16: "brick-16x16.png",
        assetFileNameLarge: "brick-17x17.png",
        name: "Brick",
        namePlural: "Bricks",
        secondsToSmelt: 10,
        ingredients: [
          Ingredient(resource: Resources.clay, quantity: 3),
        ],
        researchRequirements: [ResearchLevels.smelting2],
      );

  static Resource get cement => Resource(
        identifier: "cement",
        assetFileName16: "cement-16x16.png",
        assetFileNameLarge: "cement-28x24.png",
        name: "Cement",
        namePlural: "Cement",
        secondsToSmelt: 10,
        ingredients: [
          Ingredient(resource: Resources.stone, quantity: 3),
        ],
        researchRequirements: [ResearchLevels.smelting2],
      );

// Constructables (1 ingredient)

  static Resource get screw => Resource(
        identifier: "screw",
        assetFileName16: "screw-16x16.png",
        name: "Screw",
        namePlural: "Screws",
        secondsToCraft: 10,
        ingredients: [
          Ingredient(resource: Resources.ironPlate, quantity: 3),
        ],
      );

  static Resource get lumber => Resource(
        identifier: "lumber",
        assetFileName16: "lumber-16x16.png",
        assetFileNameLarge: "lumber-15x25.png",
        name: "Lumber",
        namePlural: "Lumber",
        secondsToCraft: 1,
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 1),
        ],
      );

  static Resource get rope => Resource(
        identifier: "rope",
        assetFileName16: "rope-16x16.png",
        assetFileNameLarge: "rope-28x32.png",
        placementWidth: 28,
        placementHeight: 32,
        name: "Rope",
        namePlural: "Rope",
        secondsToCraft: 10,
        ingredients: [
          Ingredient(resource: Resources.straw, quantity: 5),
        ],
        researchRequirements: [],
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
        researchRequirements: [
          ResearchLevels.storage1,
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
        researchRequirements: [
          ResearchLevels.storage1,
        ],
      );

  // Tools

  static Resource get pick => Resource(
        identifier: "pick",
        assetFileName16: "pick-16x16.png",
        assetFileNameLarge: "pick-32x32.png",
        name: "Pick",
        namePlural: "Picks",
        secondsToCraft: 3,
        amountPerSlot: 1,
        equipsTool: "pick",
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 10),
          Ingredient(resource: Resources.iron, quantity: 5),
        ],
      );

  static Resource get axe => Resource(
        identifier: "axe",
        assetFileName16: "axe-16x16.png",
        assetFileNameLarge: "axe-32x32.png",
        name: "Axe",
        namePlural: "Axes",
        secondsToCraft: 3,
        amountPerSlot: 1,
        equipsTool: "axe",
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 10),
          Ingredient(resource: Resources.iron, quantity: 5),
        ],
      );

  static Resource get shovel => Resource(
        identifier: "shovel",
        assetFileName16: "shovel-16x16.png",
        assetFileNameLarge: "shovel-32x32.png",
        name: "Shovel",
        namePlural: "Shovels",
        secondsToCraft: 3,
        amountPerSlot: 1,
        equipsTool: "shovel",
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 10),
          Ingredient(resource: Resources.iron, quantity: 5),
        ],
      );

  static Resource get sythe => Resource(
        identifier: "sythe",
        assetFileName16: "sythe-16x16.png",
        assetFileNameLarge: "sythe-32x32.png",
        name: "Sythe",
        namePlural: "Sythes",
        secondsToCraft: 3,
        amountPerSlot: 1,
        equipsTool: "sythe",
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 10),
          Ingredient(resource: Resources.iron, quantity: 5),
        ],
      );

  static Resource get woodenBucket => Resource(
        identifier: "wooden_bucket",
        assetFileName16: "wooden-bucket-16x16.png",
        assetFileNameLarge: "wooden-bucket-32x32.png",
        name: "Wooden Bucket",
        namePlural: "Wooden Buckets",
        secondsToCraft: 10,
        amountPerSlot: 1,
        canPlace: true,
        canPickUp: true,
        equipsTool: "water_bucket",
        storeCost: 10,
        ingredients: [
          Ingredient(resource: Resources.lumber, quantity: 10),
          Ingredient(resource: Resources.iron, quantity: 5),
        ],
      );

  // Assemblables (2+ ingredients)

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
        hungerDecreaseOnConsumption: 0.1,
        thirstDecreaseOnConsumption: 0.1,
        isLiquid: true,
      );

  static Resource get tent => Resource(
        identifier: "tent",
        assetFileName16: "tent-16x16.png",
        assetFileNameLarge: "tent-34x26.png",
        name: "Tent",
        namePlural: "Tents",
        secondsToCraft: 8,
        canPlace: true,
        canPickUp: true,
        placementWidth: 34,
        placementHeight: 26,
        interactionRadius: 48,
        restValue: 0.4,
        ingredients: [
          Ingredient(resource: Resources.wood, quantity: 10),
          Ingredient(resource: Resources.straw, quantity: 20),
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

  // Special

  static Resource get smelterA => Resource(
      identifier: "smelter_a",
      assetFileName16: "smelter-a-16x16.png",
      assetFileNameLarge: "smelter-a-32x26.png",
      placementWidth: 32,
      placementHeight: 26,
      amountPerSlot: 1,
      name: "Smelter",
      namePlural: "Smelter",
      secondsToCraft: 10,
      ingredients: [
        Ingredient(resource: Resources.iron, quantity: 20),
        Ingredient(resource: Resources.clay, quantity: 10),
        Ingredient(resource: Resources.stone, quantity: 10),
      ],
      storageType: StorageType.all,
      canPlace: true,
      slots: 1,
      resourcesPerSlot: 50,
      canSmelt: true,
      outputSlotSize: 100,
      interactionRadius: 48,
      powerConsumed: 1.0,
      researchRequirements: [ResearchLevels.smelting1]);

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
        powerConsumed: 2.0,
      );

  static Resource get lightMiner => Resource(
      identifier: "light-miner",
      assetFileName16: "miner-a-16x16.png",
      assetFileNameLarge: "miner-a-12x23.png",
      name: "Light Miner",
      namePlural: "Light Miners",
      secondsToCraft: 5,
      canPlace: true,
      placementWidth: 12,
      placementHeight: 23,
      interactionRadius: 48,
      outputSlotSize: 25,
      storageType: StorageType.solid,
      powerConsumed: 0.25,
      ingredients: [
        Ingredient(resource: Resources.iron, quantity: 10),
        Ingredient(resource: Resources.stone, quantity: 10),
      ],
      miningOutputResource: Resources.iron,
      researchRequirements: [
        ResearchLevels.mining1,
      ],
      canOnlyBePlacedOn: [
        Resources.straw,
        Resources.wood,
        Resources.clay,
      ]);

  static Resource get heavyMiner => Resource(
      identifier: "heavy_miner",
      assetFileName16: "mineral-miner-16x16.png",
      assetFileNameLarge: "mineral-miner-12x23.png",
      name: "Heavy Miner",
      namePlural: "Heavy Miners",
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
      powerConsumed: 0.5,
      researchRequirements: [
        ResearchLevels.mining2,
      ],
      canOnlyBePlacedOn: [
        Resources.straw,
        Resources.wood,
        Resources.clay,
        Resources.stone,
        Resources.iron,
        Resources.copper,
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
        Ingredient(resource: Resources.rope, quantity: 5),
        Ingredient(resource: Resources.wood, quantity: 15),
        Ingredient(resource: Resources.iron, quantity: 5),
        Ingredient(resource: Resources.stone, quantity: 50),
      ],
      miningOutputResource: Resources.water,
      canOnlyBePlacedOn: null,
      researchRequirements: [
        ResearchLevels.storage2,
      ]);

  // Houses

  static Resource get woodHouse => Resource(
          identifier: 'wood_house',
          name: "Wood House",
          namePlural: "Wood Houses",
          assetFileName16: "wood-house-16x16.png",
          assetFileNameLarge: "wood-house-96x112.png",
          placementWidth: 96,
          placementHeight: 112,
          canPlace: true,
          canPickUp: true,
          secondsToCraft: 30,
          isHouse: true,
          ingredients: [
            Ingredient(resource: Resources.wood, quantity: 500),
            Ingredient(resource: Resources.stone, quantity: 200),
          ]);

  static Resource get brickHouse => Resource(
          identifier: 'brick_house',
          name: "Brick House",
          namePlural: "Brick Houses",
          assetFileName16: "brick-house-16x16.png",
          assetFileNameLarge: "brick-house-96x112.png",
          placementWidth: 96,
          placementHeight: 112,
          secondsToCraft: 30,
          isHouse: true,
          ingredients: [
            Ingredient(resource: Resources.brick, quantity: 500),
            Ingredient(resource: Resources.stone, quantity: 200),
            Ingredient(resource: Resources.wood, quantity: 100),
          ]);

  // static Resource get conveyorBelt => Resource(
  //         identifier: "conveyor_belt",
  //         name: "Conveyor Belt",
  //         namePlural: "Conveyor Belts",
  //         assetFileName16: "conveyor-belt-16x16.png",
  //         assetFilename90Degrees: "conveyor-belt-16x16-90deg.png",
  //         assetFilename180Degrees: "conveyor-belt-16x16-180deg.png",
  //         assetFilename270Degrees: "conveyor-belt-16x16-270deg.png",
  //         secondsToCraft: 3,
  //         canPlace: true,
  //         placeWithHitbox: false,
  //         canRotate: true,
  //         isConveyor: true,
  //         ingredients: [
  //           Ingredient(resource: Resources.ironPlate, quantity: 2),
  //           Ingredient(resource: Resources.screw, quantity: 4),
  //         ]);

  // Power

  static Resource get powerGeneratorWood => Resource(
          identifier: 'power_generator_wood',
          name: "Wood Power Generator",
          namePlural: "Wood Power Generators",
          assetFileName16: "power-generator-wood-16x16.png",
          assetFileNameLarge: "power-generator-wood-32x74.png",
          placementWidth: 32,
          placementHeight: 74,
          canPlace: true,
          canPickUp: true,
          secondsToCraft: 5,
          slots: 4,
          resourcesPerSlot: 50,
          storageType: StorageType.specific,
          powerGenerated: 5.0,
          sustainabilityPenalty: 0.075,
          specificStorageWhitelist: [
            Resources.wood,
            Resources.lumber,
          ],
          fuelResourceOptions: [
            Resources.wood,
            Resources.lumber,
          ],
          ingredients: [
            Ingredient(resource: Resources.stone, quantity: 25),
            Ingredient(resource: Resources.clay, quantity: 40),
          ],
          researchRequirements: []);

  static Resource get powerGeneratorSolar => Resource(
          identifier: 'power_generator_solar',
          name: "Solar Power Generator",
          namePlural: "Solar Power Generators",
          assetFileName16: "power-generator-solar-16x16.png",
          assetFileNameLarge: "power-generator-solar-32x32.png",
          placementWidth: 32,
          placementHeight: 32,
          canPlace: true,
          canPickUp: true,
          secondsToCraft: 5,
          powerGenerated: 5.0,
          sustainabilityPenalty: 0,
          ingredients: [
            Ingredient(resource: Resources.ironPlate, quantity: 25),
            Ingredient(resource: Resources.screw, quantity: 10),
            Ingredient(resource: Resources.cement, quantity: 5),
          ],
          researchRequirements: [
            ResearchLevels.power1,
          ]);

  static List<Resource> get all => [
        //Primary
        Resources.iron,
        Resources.stone,
        Resources.clay,
        Resources.copper,
        Resources.wood,
        Resources.water,
        Resources.straw,

        // Farming
        Resources.soil,
        Resources.potato,
        Resources.potatoSeed,
        Resources.carrot,
        Resources.carrotSeed,
        Resources.garlic,
        Resources.garlicSeed,

        //Smeltables
        Resources.ironPlate,
        Resources.copperPlate,
        Resources.brick,
        Resources.cement,

        // Constructables
        Resources.screw,
        Resources.lumber,
        Resources.rope,
        Resources.barrel,
        Resources.chest,

        // Tools
        Resources.pick,
        Resources.axe,
        Resources.shovel,
        Resources.sythe,
        Resources.woodenBucket,

        //Assembleables
        Resources.soup,
        Resources.tent,
        Resources.communityChest,
        Resources.constructorA,
        // Resources.conveyorBelt,

        //Special
        Resources.smelterA,
        Resources.well,
        Resources.lightMiner,
        Resources.heavyMiner,
        Resources.powerGeneratorWood,
        Resources.powerGeneratorSolar,

        //Housing
        Resources.woodHouse,
        Resources.brickHouse,
      ];

  static List<Resource> get craftable => all.where((r) => r.secondsToCraft != null).toList();
  static List<Resource> get constructable => craftable.where((r) => r.ingredients.length == 1).toList();
  static List<Resource> get mineable => all.where((r) => r.secondsToMine != null).toList();
  static List<Resource> get availableInStore => all.where((r) => r.availableInStore).toList();
  static List<Resource> get consumables => all.where((r) => r.canConsume).toList();
  static List<Resource> get hungerConsumables => consumables.where((r) => r.hungerDecreaseOnConsumption > 0).toList();
  static List<Resource> get thirstConsumables => consumables.where((r) => r.thirstDecreaseOnConsumption > 0).toList();
}
