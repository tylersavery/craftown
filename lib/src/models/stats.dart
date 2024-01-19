import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';

@freezed
class Stats with _$Stats {
  const factory Stats({
    required double sustainability,
    required double energy,
  }) = _Stats;
}
