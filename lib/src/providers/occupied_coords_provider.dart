import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/providers/placed_resources_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'occupied_coords_provider.g.dart';

class Coord {
  final int x;
  final int y;
  final PlacedResource placedResource;
  const Coord(this.x, this.y, this.placedResource);
}

@Riverpod(keepAlive: true)
List<Coord> occupiedCoords(OccupiedCoordsRef ref) {
  final placements = ref.watch(placedResourcesListProvider);

  final List<Coord> coords = [];

  for (final p in placements) {
    for (int x = p.tileX; x < p.tileX + p.tileSizeX; x++) {
      for (int y = p.tileY; y < p.tileY + p.tileSizeY; y++) {
        coords.add(Coord(x, y, p));
      }
    }
  }

  return coords;
}
