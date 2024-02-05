import 'package:craftown/src/models/rotate_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rotate_provider.g.dart';

@Riverpod(keepAlive: true)
class Rotate extends _$Rotate {
  @override
  RotateState build() {
    return RotateState();
  }

  showButton() {
    state = state.copyWith(buttonVisible: true);
  }

  hideButton() {
    state = state.copyWith(buttonVisible: false);
  }

  rotateClockwise() {
    int quarterTurns = state.quarterTurns + 1;
    if (quarterTurns > 3) {
      quarterTurns = 0;
    }

    state = state.copyWith(quarterTurns: quarterTurns);
  }

  rotateCounterClockwise() {
    int quarterTurns = state.quarterTurns - 1;
    if (quarterTurns < 0) {
      quarterTurns = 0;
    }

    state = state.copyWith(quarterTurns: quarterTurns);
  }
}
