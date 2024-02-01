import 'package:craftown/src/models/map_resource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_resource_list_provider.g.dart';

@Riverpod(keepAlive: true)
class MapResourceList extends _$MapResourceList {
  @override
  List<MapResource> build() {
    return [];
  }

  set(List<MapResource> items) {
    state = items;
  }

  add(MapResource item) {
    state = [...state, item];
  }
}
