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
        ]);
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

  static List<TutorialStep> get allSteps => [
        TutorialSteps.step0,
        TutorialSteps.step1,
        TutorialSteps.step2,
      ];
}
