import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/inventory_map_provider.dart';
import 'package:craftown/src/providers/resource_available_from_research_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'can_craft_provider.g.dart';

@Riverpod(keepAlive: true)
bool canCraft(CanCraftRef ref, Resource resource) {
  final inventory = ref.watch(inventoryMapProvider);

  for (final ingredient in resource.ingredients) {
    final key = ingredient.resource.identifier;
    if (!inventory.containsKey(key)) {
      return false;
    }

    if ((inventory[key] ?? 0) < ingredient.quantity) {
      return false;
    }
  }

  if (!ref.watch(resourceAvailableFromResearchProvider(resource))) {
    return false;
  }

  return true;
}
