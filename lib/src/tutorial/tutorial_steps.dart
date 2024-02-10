import 'package:craftown/src/data/research_levels.dart';
import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/tutorial/tutorial_step.dart';

class TutorialSteps {
  static TutorialStep get step0 {
    return TutorialStep(
      index: 0,
      name: "Craft a Sythe",
      description: "Craft a sythe so you can harvest straw. This will be needed to craft your tent.",
      resourcesRequired: [
        Ingredient(resource: Resources.sythe, quantity: 1),
      ],
    );
  }

  static TutorialStep get step1 {
    return TutorialStep(
      index: 1,
      name: "Build Shelter",
      description: "Craft a tent to have a safe place to rest and recharge.",
      placedResourcesRequired: [
        Ingredient(resource: Resources.tent, quantity: 1),
      ],
    );
  }

  static TutorialStep get step2 {
    return TutorialStep(
      index: 2,
      name: "Craft Wooden Bucket",
      description: "Craft a wooden bucket so you can carry and consume water. This will also let you water your crops!",
      resourcesRequired: [
        Ingredient(resource: Resources.woodenBucket, quantity: 1),
      ],
    );
  }

  static TutorialStep get step3 {
    return TutorialStep(
      index: 3,
      name: "Plant some crops",
      description: "Let's get a farm going so you don't get hungry. Harvest 3 potatos and 3 carrots to continue.",
      resourcesRequired: [
        Ingredient(resource: Resources.potato, quantity: 3),
        Ingredient(resource: Resources.carrot, quantity: 3),
      ],
    );
  }

  // storage

  static TutorialStep get step4 {
    return TutorialStep(
      index: 4,
      name: "Storage",
      description: "Research ${ResearchLevels.storage1.name} then craft and place a ${Resources.chest.name}.",
      placedResourcesRequired: [
        Ingredient(
          resource: Resources.chest,
          quantity: 1,
        )
      ],
      researchLevelsRequired: [
        ResearchLevels.storage1,
      ],
    );
  }

  // power

  static TutorialStep get step5 {
    return TutorialStep(
      index: 5,
      name: "Build Power",
      description: "Craft and place a ${Resources.powerGeneratorWood.name} to start generating power for your town.",
      placedResourcesRequired: [
        Ingredient(resource: Resources.powerGeneratorWood, quantity: 1),
      ],
    );
  }

  static TutorialStep get step6 {
    return TutorialStep(
      index: 6,
      name: "Generate Power",
      description: "Add wood to your ${Resources.powerGeneratorWood.name} and start generating power.",
      powerAvailableRequired: true,
    );
  }

  // mining

  static TutorialStep get step7 {
    return TutorialStep(
        index: 7,
        name: "Mining",
        description: "Research ${ResearchLevels.mining1.name} and then craft and place a Light Miner and Heavy Miner to begin automation!",
        placedResourcesRequired: [
          Ingredient(resource: Resources.lightMiner, quantity: 1),
          Ingredient(resource: Resources.heavyMiner, quantity: 1),
        ],
        researchLevelsRequired: [
          ResearchLevels.mining1,
        ]);
  }

  /// smelting

  static TutorialStep get step8 {
    return TutorialStep(
      index: 8,
      name: "Smelting",
      description: "Research ${ResearchLevels.smelting1.name} and then craft and place a ${Resources.smelterA.name}.",
      placedResourcesRequired: [
        Ingredient(resource: Resources.smelterA, quantity: 1),
      ],
      researchLevelsRequired: [
        ResearchLevels.smelting1,
      ],
    );
  }

  static TutorialStep get step9 {
    return TutorialStep(
      index: 9,
      name: "Construction",
      description: "Research ${ResearchLevels.construction1.name} and then craft and place a ${Resources.constructorA.name}.",
      placedResourcesRequired: [
        Ingredient(resource: Resources.constructorA, quantity: 1),
      ],
      researchLevelsRequired: [
        ResearchLevels.construction1,
      ],
    );
  }

  /// constructing

  static List<TutorialStep> get allSteps => [
        TutorialSteps.step0,
        TutorialSteps.step1,
        TutorialSteps.step2,
        TutorialSteps.step3,
        TutorialSteps.step4,
        TutorialSteps.step5,
        TutorialSteps.step6,
        TutorialSteps.step7,
        TutorialSteps.step8,
        TutorialSteps.step9,
      ];
}
