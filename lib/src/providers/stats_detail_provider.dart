import 'dart:async';
import 'dart:math';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/models/stats.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stats_detail_provider.g.dart';

@Riverpod(keepAlive: true)
class StatsDetail extends _$StatsDetail {
  late Timer timer;

  @override
  Stats build() {
    timer = Timer.periodic(
      Duration(milliseconds: (SECONDS_BETWEEN_STAT_UPDATES * 1000).round()),
      _updateFromTimer,
    );

    return Stats(
      dollars: 10,
      sustainability: 1,
      energy: 0.9,
      hunger: 0.1,
      thirst: 0.1,
    );
  }

  void _updateFromTimer(Timer _) {
    increaseHunger(0.01);
    increaseThirst(0.03);
    decreaseEnergy(0.01);
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

  setHunger(double value) {
    state = state.copyWith(hunger: value);
  }

  increaseHunger(double amount, {double maximum = 1}) {
    state = state.copyWith(hunger: min(1, min(state.hunger + amount, maximum)));
  }

  decreaseHunger(double amount) {
    state = state.copyWith(hunger: max(0, state.hunger - amount));
  }

  setThirst(double value) {
    state = state.copyWith(thirst: value);
  }

  increaseThirst(double amount, {double maximum = 1}) {
    state = state.copyWith(thirst: min(1, min(state.thirst + amount, maximum)));
  }

  decreaseThirst(double amount) {
    state = state.copyWith(thirst: max(0, state.thirst - amount));
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
