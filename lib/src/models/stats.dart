import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

enum StatType {
  sustainability("Sustainability", true),
  energy("Energy", true),
  hunger("Hunger", false),
  thirst("Thirst", false),
  ;

  final bool positiveIsGood;
  final String label;
  const StatType(this.label, this.positiveIsGood);
}

@freezed
class Stats with _$Stats {
  const factory Stats({
    required int dollars,
    required double sustainability,
    required double energy,
    required double hunger,
    required double thirst,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
