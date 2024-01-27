import 'package:craftown/src/models/modifier_key_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModifierKeyProvider extends StateNotifier<ModifierKeyState> {
  ModifierKeyProvider() : super(ModifierKeyState());

  setShift(bool value) {
    state = state.copyWith(shiftPressed: value);
  }
}

final modifierKeyProvider = StateNotifierProvider<ModifierKeyProvider, ModifierKeyState>((ref) {
  return ModifierKeyProvider();
});
