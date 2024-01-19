import 'dart:math';

import 'package:craftown/src/models/stats.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsProvider extends StateNotifier<Stats> {
  final Ref ref;
  StatsProvider(this.ref, Stats initialState) : super(initialState);

  setEnergy(double value) {
    state = state.copyWith(energy: value);
  }

  increaseEnergy(double amount) {
    state = state.copyWith(energy: min(1, state.energy + amount));
  }

  decreaseEnergy(double amount) {
    state = state.copyWith(energy: max(0, state.energy - amount));
  }
}

final statsProvider = StateNotifierProvider<StatsProvider, Stats>((ref) {
  final initialState = Stats(
    sustainability: 1,
    energy: 0.5,
  );
  return StatsProvider(ref, initialState);
});
