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
  return ResourceInHandProvider(ref, null);
});
