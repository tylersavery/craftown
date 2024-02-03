import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/ingredient.dart';
import 'package:craftown/src/models/research_level.dart';
import 'package:craftown/src/models/resource.dart';

class ResearchLevels {
  static ResearchLevel get level1 {
    return ResearchLevel(
      identifier: "level_1",
      name: "Level 1",
      prerequisites: [],
      timeToUnlock: Duration(seconds: 5),
      cost: [
        Ingredient(resource: Resources.ironPlate, quantity: 10),
      ],
    );
  }

  static ResearchLevel get level2 {
    return ResearchLevel(
      identifier: "level_2",
      name: "Level 2",
      prerequisites: [
        ResearchLevels.level1,
      ],
      timeToUnlock: Duration(seconds: 10),
      cost: [
        Ingredient(resource: Resources.ironPlate, quantity: 10),
        Ingredient(resource: Resources.brick, quantity: 25),
      ],
    );
  }

  static ResearchLevel get level3 {
    return ResearchLevel(
      identifier: "level_3",
      name: "Level 3",
      prerequisites: [],
      timeToUnlock: Duration(seconds: 10),
      cost: [
        Ingredient(resource: Resources.ironPlate, quantity: 10),
        Ingredient(resource: Resources.brick, quantity: 25),
      ],
    );
  }

  static List<ResearchLevel> get allResearchLevels {
    return [
      ResearchLevels.level1,
      ResearchLevels.level2,
      ResearchLevels.level3,
    ];
  }
}
