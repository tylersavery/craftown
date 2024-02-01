import 'package:craftown/src/menus/models/tool_menu_state.dart';
import 'package:craftown/src/models/tool.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tool_menu_provider.g.dart';

@Riverpod(keepAlive: true)
class ToolMenu extends _$ToolMenu {
  @override
  ToolMenuState build() {
    return ToolMenuState();
  }

  void open() {
    state = state.copyWith(isOpen: true);
  }

  void close() {
    state = state.copyWith(isOpen: false);
  }

  void setSelected(Tool tool, [bool andClose = false]) {
    final success = ref.read(selectedToolProvider.notifier).set(tool);
    if (success && andClose) {
      close();
    }
  }
}
