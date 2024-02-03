import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/tool.dart';

class Tools {
  static Tool get pick => Tool(
        type: ToolType.pick,
        identifier: "pick",
        name: "Pick Axe",
        assetName: "pick",
      );
  static Tool get axe => Tool(
        type: ToolType.axe,
        identifier: "axe",
        name: "Axe",
        assetName: "axe",
      );
  static Tool get shovel => Tool(
        type: ToolType.shovel,
        identifier: "shovel",
        name: "Shovel",
        assetName: "shovel",
        resourcesRequired: [Resources.shovel],
      );
  static Tool get sythe => Tool(
        type: ToolType.sythe,
        identifier: "sythe",
        name: "Sythe",
        assetName: "sythe",
      );
  static Tool get waterBucket => Tool(
        type: ToolType.waterBucket,
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
