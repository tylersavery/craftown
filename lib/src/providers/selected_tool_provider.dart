import 'package:craftown/src/data/tools.dart';
import 'package:craftown/src/models/tool.dart';
import 'package:craftown/src/providers/inventory_list_provider.dart';
import 'package:craftown/src/providers/toast_messages_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_tool_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedTool extends _$SelectedTool {
  @override
  Tool? build() {
    return Tools.pick;
  }

  bool set(Tool tool, [bool omitMessage = false]) {
    if (tool.resourcesRequired.isNotEmpty) {
      for (final r in tool.resourcesRequired) {
        if (ref.read(inventoryListProvider.notifier).totalResourcesWithIdentifier(r.identifier) < 1) {
          if (!omitMessage) {
            ref.read(toastMessagesListProvider.notifier).add("${r.name} required to use this tool");
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
