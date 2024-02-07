import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/inventory_slot.dart';

class SpawnState {
  static List<InventorySlot> get inventory {
    final initialState = List.generate(
      16,
      (index) => InventorySlot(resource: null, count: 0),
    );

    initialState[0] = InventorySlot(resource: Resources.pick, count: 1);
    initialState[1] = InventorySlot(resource: Resources.axe, count: 1);
    initialState[2] = InventorySlot(resource: Resources.potatoSeed, count: 8);
    initialState[3] = InventorySlot(resource: Resources.carrotSeed, count: 4);
    initialState[4] = InventorySlot(resource: Resources.soup, count: 3);

    // TEMP:
    initialState[5] = InventorySlot(resource: Resources.shovel, count: 1);
    initialState[6] = InventorySlot(resource: Resources.soil, count: 10);
    initialState[7] = InventorySlot(resource: Resources.woodenBucket, count: 1);
    initialState[8] = InventorySlot(resource: Resources.conveyorBelt, count: 25);
    initialState[9] = InventorySlot(resource: Resources.tomatoSeed, count: 7);
    initialState[10] = InventorySlot(resource: Resources.sythe, count: 1);

    return initialState;
  }

  static List<InventorySlot> get inventoryDebug {
    final initialState = List.generate(
      16,
      (index) => InventorySlot(resource: null, count: 0),
    );

    initialState[0] = InventorySlot(resource: Resources.wood, count: 50);
    initialState[1] = InventorySlot(resource: Resources.pick, count: 1);
    initialState[2] = InventorySlot(resource: Resources.iron, count: 50);
    initialState[3] = InventorySlot(resource: Resources.woodenBucket, count: 1);
    initialState[4] = InventorySlot(resource: Resources.constructorA, count: 2);
    initialState[5] = InventorySlot(resource: Resources.ironPlate, count: 50);
    initialState[6] = InventorySlot(resource: Resources.smelterA, count: 2);
    initialState[7] = InventorySlot(resource: Resources.screw, count: 20);
    initialState[8] = InventorySlot(resource: Resources.cement, count: 10);
    initialState[9] = InventorySlot(resource: Resources.heavyMiner, count: 10);
    initialState[10] = InventorySlot(resource: Resources.powerGeneratorWood, count: 3);
    initialState[11] = InventorySlot(resource: Resources.powerGeneratorSolar, count: 3);

    return initialState;
  }
}
