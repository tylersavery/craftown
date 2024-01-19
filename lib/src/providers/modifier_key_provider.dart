import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModifierKeyProvider extends StateNotifier<bool> {
  ModifierKeyProvider() : super(false);

  setShift(bool value) {
    state = value;
  }
}

final modifierKeyProvider = StateNotifierProvider<ModifierKeyProvider, bool>((ref) {
  return ModifierKeyProvider();
});
