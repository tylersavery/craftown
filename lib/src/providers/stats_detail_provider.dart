import 'dart:math';

import 'package:craftown/src/models/stats.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stats_detail_provider.g.dart';

@Riverpod(keepAlive: true)
class StatsDetail extends _$StatsDetail {
  @override
  Stats build() {
    return Stats(
      sustainability: 1,
      energy: 0.5,
      dollars: 10,
    );
  }

  set(Stats value) {
    state = value;
  }

  setSustainability(double value) {
    state = state.copyWith(sustainability: value);
  }

  increaseSustainability(double amount) {
    state = state.copyWith(sustainability: min(1, state.sustainability + amount));
  }

  decreaseSustainability(double amount) {
    state = state.copyWith(sustainability: max(0, state.sustainability - amount));
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
