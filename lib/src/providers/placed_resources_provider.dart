import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacedResourcesProvider extends StateNotifier<List<PlacedResource>> {
  final Ref ref;
  PlacedResourcesProvider(this.ref) : super([]);

  add(ResourceSprite sprite) {
    state = [
      ...state,
      PlacedResource(sprite: sprite, contents: List.generate(sprite.resource.slots, (_) => [])),
    ];
  }
}

final placedResourcesProvider = StateNotifierProvider<PlacedResourcesProvider, List<PlacedResource>>((ref) {
  return PlacedResourcesProvider(ref);
});
