import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/tool.dart';

class Tools {
  static Tool get pick => Tool(
        identifier: "pick",
        name: "Pick Axe",
        assetName: "pick",
      );
  static Tool get axe => Tool(
        identifier: "axe",
        name: "Axe",
        assetName: "axe",
      );
  static Tool get shovel => Tool(
        identifier: "shovel",
        name: "Shovel",
        assetName: "shovel",
      );
  static Tool get sythe => Tool(
        identifier: "sythe",
        name: "Sythe",
        assetName: "sythe",
      );
  static Tool get waterBucket => Tool(
        identifier: "water_bucket",
        name: "Wooden Bucket",
        assetName: "water_bucket",
        resourcesRequired: [Resources.woodenBucket],
      );

  static List<Tool> get allTools => [
        pick,
        axe,
        shovel,
        sythe,
        waterBucket,
      ];
}
