import 'package:craftown/src/models/farmland.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'farmland_list_provider.g.dart';

@Riverpod(keepAlive: true)
class FarmlandList extends _$FarmlandList {
  @override
  List<Farmland> build() {
    return [];
  }

  set(List<Farmland> items) {
    state = items;
  }

  add(Farmland item) {
    state = [...state, item];
  }
}
