import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/research_level.dart';

class ResearchLevels {
  static ResearchLevel get storage1 {
    return ResearchLevel(
      identifier: "storage1",
      name: "Storage 1",
      prerequisites: [],
      timeToUnlock: Duration(seconds: 30),
      cost: [
        Ingredient(resource: Resources.lumber, quantity: 15),
        Ingredient(resource: Resources.clay, quantity: 15),
      ],
    );
  }

  static ResearchLevel get storage2 {
    return ResearchLevel(
      identifier: "storage2",
      name: "Storage 2",
      prerequisites: [],
      timeToUnlock: Duration(seconds: 60),
      cost: [
        Ingredient(resource: Resources.lumber, quantity: 25),
        Ingredient(resource: Resources.brick, quantity: 25),
      ],
    );
  }

  static ResearchLevel get mining1 {
    return ResearchLevel(
      identifier: "mining1",
      name: "Mining 1",
      prerequisites: [],
      timeToUnlock: Duration(seconds: 30),
      cost: [
        Ingredient(resource: Resources.stone, quantity: 10),
        Ingredient(resource: Resources.iron, quantity: 10),
        Ingredient(resource: Resources.clay, quantity: 10),
      ],
    );
  }

  static ResearchLevel get mining2 {
    return ResearchLevel(
      identifier: "mining1",
      name: "Mining 1",
      prerequisites: [
        ResearchLevels.mining1,
      ],
      timeToUnlock: Duration(seconds: 60),
      cost: [
        Ingredient(resource: Resources.stone, quantity: 25),
        Ingredient(resource: Resources.iron, quantity: 25),
        Ingredient(resource: Resources.clay, quantity: 25),
      ],
    );
  }

  static ResearchLevel get smelting1 {
    return ResearchLevel(
      identifier: "smelting1",
      name: "Smelting 1",
      prerequisites: [],
      timeToUnlock: Duration(seconds: 30),
      cost: [
        Ingredient(resource: Resources.stone, quantity: 10),
        Ingredient(resource: Resources.iron, quantity: 10),
        Ingredient(resource: Resources.clay, quantity: 10),
      ],
    );
  }

  static ResearchLevel get smelting2 {
    return ResearchLevel(
      identifier: "smelting2",
      name: "Smelting 2",
      prerequisites: [
        ResearchLevels.smelting1,
      ],
      timeToUnlock: Duration(seconds: 30),
      cost: [
        Ingredient(resource: Resources.ironPlate, quantity: 10),
        Ingredient(resource: Resources.copperPlate, quantity: 10),
      ],
    );
  }

  static ResearchLevel get construction1 {
    return ResearchLevel(
      identifier: "construction1",
      name: "Construction 1",
      prerequisites: [],
      timeToUnlock: Duration(seconds: 30),
      cost: [
        Ingredient(resource: Resources.stone, quantity: 10),
        Ingredient(resource: Resources.iron, quantity: 10),
        Ingredient(resource: Resources.clay, quantity: 10),
      ],
    );
  }

  static ResearchLevel get farming1 {
    return ResearchLevel(
      identifier: "farming1",
      name: "Farming 1",
      prerequisites: [],
      timeToUnlock: Duration(seconds: 30),
      cost: [
        Ingredient(resource: Resources.straw, quantity: 25),
      ],
    );
  }

  static ResearchLevel get power1 {
    return ResearchLevel(
      identifier: "power1",
      name: "Power 1",
      prerequisites: [],
      timeToUnlock: Duration(seconds: 30),
      cost: [
        Ingredient(resource: Resources.clay, quantity: 25),
        Ingredient(resource: Resources.iron, quantity: 25),
        Ingredient(resource: Resources.wood, quantity: 25),
      ],
    );
  }

  static List<ResearchLevel> get allResearchLevels {
    return [
      ResearchLevels.storage1,
      ResearchLevels.storage2,
      ResearchLevels.mining1,
      ResearchLevels.mining2,
      ResearchLevels.smelting1,
      ResearchLevels.smelting2,
      ResearchLevels.construction1,
      ResearchLevels.farming1,
      ResearchLevels.power1,
    ];
  }
}
