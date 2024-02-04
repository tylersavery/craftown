import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/inventory_slot.dart';

class SpawnState {
  static List<InventorySlot> get inventory {
    final initialState = List.generate(
      16,
      (index) => InventorySlot(resource: null, count: 0),
    );

    initialState[0] = InventorySlot(resource: Resources.potatoSeed, count: 6);

    return initialState;
  }

  static List<InventorySlot> get inventoryDebug {
    final initialState = List.generate(
      16,
      (index) => InventorySlot(resource: null, count: 0),
    );

    initialState[0] = InventorySlot(resource: Resources.ironPlate, count: 50);
    initialState[1] = InventorySlot(resource: Resources.copper, count: 50);
    initialState[2] = InventorySlot(resource: Resources.straw, count: 50);
    initialState[3] = InventorySlot(resource: Resources.woodenBucket, count: 1);
    initialState[4] = InventorySlot(resource: Resources.constructorA, count: 2);
    initialState[5] = InventorySlot(resource: Resources.tent, count: 2);
    initialState[6] = InventorySlot(resource: Resources.smelterA, count: 2);
    initialState[7] = InventorySlot(resource: Resources.carrotSeed, count: 16);
    initialState[8] = InventorySlot(resource: Resources.shovel, count: 1);
    initialState[9] = InventorySlot(resource: Resources.heavyMiner, count: 10);
    initialState[10] = InventorySlot(resource: Resources.water, count: 3);
    initialState[11] = InventorySlot(resource: Resources.woodHouse, count: 3);

    return initialState;
  }
}
