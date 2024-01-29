import 'dart:math';

import 'package:craftown/src/models/stats.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsProvider extends StateNotifier<Stats> {
  final Ref ref;
  StatsProvider(this.ref, Stats initialState) : super(initialState);

  set(Stats value) {
    state = value;
  }

  setEnergy(double value) {
    state = state.copyWith(energy: value);
  }

  increaseEnergy(double amount) {
    state = state.copyWith(energy: min(1, state.energy + amount));
  }

  decreaseEnergy(double amount) {
    state = state.copyWith(energy: max(0, state.energy - amount));
  }

  setDollars(int value) {
    state = state.copyWith(dollars: value);
  }

  increaseDollars(int amount) {
    state = state.copyWith(dollars: state.dollars + amount);
  }

  decreaseDollars(int amount) {
    state = state.copyWith(dollars: max(0, state.dollars - amount));
  }
}

final statsProvider = StateNotifierProvider<StatsProvider, Stats>((ref) {
  final initialState = Stats(
    sustainability: 1,
    energy: 0.5,
    dollars: 10,
  );
  return StatsProvider(ref, initialState);
});
