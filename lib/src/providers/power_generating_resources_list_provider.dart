import 'package:craftown/src/models/placed_resource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'power_generating_resources_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PowerGeneratingResourcesList extends _$PowerGeneratingResourcesList {
  @override
  List<PlacedResource> build() {
    return [];
  }

  void set(List<PlacedResource> items) {
    state = items;
  }

  void add(PlacedResource item) {
    if (state.contains(item)) {
      return;
    }

    state = [...state, item];
  }

  void remove(PlacedResource item) {
    state = [...state]..removeWhere((element) => element.uniqueIdentifier == item.uniqueIdentifier);
  }
}
