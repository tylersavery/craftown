import 'package:craftown/src/providers/map_resource_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'occupied_ground_coords_provider.g.dart';

class Coord {
  final int x;
  final int y;
  const Coord(this.x, this.y);
}

@Riverpod(keepAlive: true)
List<Coord> occupiedGroundCoords(OccupiedGroundCoordsRef ref) {
  final placements = ref.watch(mapResourceListProvider);

  final List<Coord> coords = [];

  for (final p in placements) {
    coords.add(Coord(p.tileX, p.tileY));
  }

  return coords;
}
