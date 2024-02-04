import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_state.freezed.dart';
part 'calendar_state.g.dart';

enum CalendarSeason {
  winter,
  // spring,
  summer,
  // autumn,
}

enum CalendarMonth {
  january("January", CalendarSeason.winter),
  february("February", CalendarSeason.winter),
  march("March", CalendarSeason.summer),
  april("April", CalendarSeason.summer),
  may("May", CalendarSeason.summer),
  june("June", CalendarSeason.summer),
  july("July", CalendarSeason.summer),
  august("August", CalendarSeason.summer),
  september("September", CalendarSeason.summer),
  october("October", CalendarSeason.summer),
  november("November", CalendarSeason.winter),
  december("December", CalendarSeason.winter),
  ;

  final String label;
  final CalendarSeason season;
  const CalendarMonth(this.label, this.season);
}

@freezed
class CalendarState with _$CalendarState {
  const CalendarState._();

  const factory CalendarState({
    @Default(0) int monthIndex,
    @Default(0) int yearIndex,
  }) = _CalendarState;

  factory CalendarState.fromJson(Map<String, dynamic> json) => _$CalendarStateFromJson(json);

  CalendarMonth get month {
    return CalendarMonth.values[monthIndex];
  }

  CalendarSeason get season {
    return month.season;
  }

  int get year {
    return DateTime.now().year + yearIndex;
  }

  CalendarState get nextMonth {
    int newMonthIndex = monthIndex + 1;
    int newYearIndex = yearIndex;
    if (newMonthIndex > 11) {
      newMonthIndex = 0;
      newYearIndex++;
    }

    return copyWith(
      monthIndex: newMonthIndex,
      yearIndex: newYearIndex,
    );
  }
}
