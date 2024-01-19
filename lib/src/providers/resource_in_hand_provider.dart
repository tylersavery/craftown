import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/craft_menu_state.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResourceInHandProvider extends StateNotifier<Resource?> {
  final Ref ref;
  ResourceInHandProvider(this.ref, [Resource? initialState]) : super(initialState);

  void set(Resource? resource) {
    state = resource;
  }

  void clear() {
    state = null;
  }
}

final resourceInHandProvider = StateNotifierProvider<ResourceInHandProvider, Resource?>((ref) {
  final initialState = Resources.soup;

  return ResourceInHandProvider(ref, initialState);
});
