import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'inventory_map_provider.g.dart';

@Riverpod(keepAlive: true)
Map<String, int> inventoryMap(InventoryMapRef ref) {
  final slots = ref.watch(inventoryListProvider);

  Map<String, int> data = {};

  for (final slot in slots) {
    if (slot.resource != null) {
      final key = slot.resource!.identifier;

      if (data.containsKey(key)) {
        data[key] = (data[key] ?? 0) + slot.count;
      } else {
        data[key] = slot.count;
      }
    }
  }
  return data;
}
