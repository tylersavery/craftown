import 'package:craftown/src/models/farmland.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmlandProvider extends StateNotifier<List<Farmland>> {
  final Ref ref;
  FarmlandProvider(this.ref) : super([]);

  set(List<Farmland> items) {
    state = items;
  }

  add(Farmland item) {
    state = [...state, item];
  }
}

final farmlandProvider = StateNotifierProvider<FarmlandProvider, List<Farmland>>((ref) {
  return FarmlandProvider(ref);
});
