import 'package:craftown/src/models/placed_conveyor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'conveyor_list_provider.g.dart';

@Riverpod(keepAlive: true)
class ConveyorList extends _$ConveyorList {
  @override
  List<PlacedConveyor> build() {
    return [];
  }

  set(List<PlacedConveyor> items) {
    state = items;
  }

  add(PlacedConveyor item) {
    state = [...state, item];

    print(state);
  }
}
