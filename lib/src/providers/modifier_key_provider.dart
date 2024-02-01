import 'package:craftown/src/models/modifier_key_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'modifier_key_provider.g.dart';

@Riverpod(keepAlive: true)
class ModifierKey extends _$ModifierKey {
  @override
  ModifierKeyState build() {
    return ModifierKeyState();
  }

  setShift(bool value) {
    state = state.copyWith(shiftPressed: value);
  }
}
