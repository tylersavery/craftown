import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/inventory_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResourceInHandProvider extends StateNotifier<Resource?> {
  final Ref ref;
  ResourceInHandProvider(this.ref, [Resource? initialState]) : super(initialState);

  void set(Resource? resource) {
    final selectedTool = ref.read(selectedToolProvider);

    if (resource != null && selectedTool != null) {
      for (final r in selectedTool.resourcesRequired) {
        final count = ref.read(inventoryProvider.notifier).totalResourcesWithIdentifier(r.identifier);
        if (count < 1) {
          ref.read(selectedToolProvider.notifier).clear();
          break;
        }
      }
    }
    state = resource;
  }

  void clear() {
    state = null;
  }
}

final resourceInHandProvider = StateNotifierProvider<ResourceInHandProvider, Resource?>((ref) {
  return ResourceInHandProvider(ref, null);
});
