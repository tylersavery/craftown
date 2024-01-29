import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/models/tool.dart';
import 'package:craftown/src/providers/inventory_provider.dart';
import 'package:craftown/src/providers/toast_messages_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedToolProvider extends StateNotifier<Tool?> {
  final Ref ref;
  SelectedToolProvider(this.ref, Tool initialState) : super(initialState);

  bool set(Tool tool, [bool omitMessage = false]) {
    if (tool.resourcesRequired.isNotEmpty) {
      for (final r in tool.resourcesRequired) {
        if (ref.read(inventoryProvider.notifier).totalResourcesWithIdentifier(r.identifier) < 1) {
          if (!omitMessage) {
            ref.read(toastMessagesProvider.notifier).add("${r.name} required to use this tool");
          }

          return false;
        }
      }
    }

    state = tool;
    return true;
  }

  clear() {
    state = null;
  }
}

final selectedToolProvider = StateNotifierProvider<SelectedToolProvider, Tool?>((ref) {
  return SelectedToolProvider(ref, Tools.pick);
});
