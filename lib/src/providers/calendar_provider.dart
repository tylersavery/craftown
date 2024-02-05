import 'dart:async';

import 'package:craftown/src/constants.dart';
import 'package:craftown/src/models/calendar_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_provider.g.dart';

@Riverpod(keepAlive: true)
class Calendar extends _$Calendar {
  Timer? timer;
  @override
  CalendarState build() {
    timer = Timer.periodic(Duration(seconds: SECONDS_BETWEEN_MONTHS.round()), (_) => nextMonth());
    return CalendarState(monthIndex: 4);
  }

  set(CalendarState calendarState) {
    state = calendarState;
  }

  nextMonth() {
    state = state.nextMonth;
  }
}
