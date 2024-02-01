import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "resource_in_hand_provider.g.dart";

@Riverpod(keepAlive: true)
class ResourceInHand extends _$ResourceInHand {
  // final Ref ref;
  // ResourceInHandProvider(this.ref, [Resource? initialState]) : super(initialState);

  @override
  Resource? build() {
    return null;
  }

  void set(Resource? resource) {
    final selectedTool = ref.read(selectedToolProvider);

    if (resource != null && selectedTool != null) {
      for (final r in selectedTool.resourcesRequired) {
        final count = ref.read(inventoryListProvider.notifier).totalResourcesWithIdentifier(r.identifier);
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
