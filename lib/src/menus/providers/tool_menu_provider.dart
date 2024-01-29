import 'package:craftown/src/menus/models/tool_menu_state.dart';
import 'package:craftown/src/models/tool.dart';
import 'package:craftown/src/providers/selected_tool_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolMenuProvider extends StateNotifier<ToolMenuState> {
  final Ref ref;
  ToolMenuProvider(this.ref, ToolMenuState initialState) : super(initialState);

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

final toolMenuProvider = StateNotifierProvider<ToolMenuProvider, ToolMenuState>((ref) {
  final initialState = ToolMenuState();
  return ToolMenuProvider(ref, initialState);
});
