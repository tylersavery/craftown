import 'package:craftown/src/models/placed_farmland.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'placed_farmland_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PlacedFarmlandList extends _$PlacedFarmlandList {
  @override
  List<PlacedFarmland> build() {
    return [];
  }

  set(List<PlacedFarmland> items) {
    state = items;
  }

  add(PlacedFarmland item) {
    state = [...state, item];
  }
}
