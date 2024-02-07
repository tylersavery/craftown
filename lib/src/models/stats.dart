import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

enum StatType {
  sustainability("Sustainability", true, true, "%"),
  energy("Energy", true, true, "%"),
  hunger("Hunger", true, false, "%"),
  thirst("Thirst", true, false, "%"),
  powerUse("Power Use", true, false, "%"),
  ;

  final bool positiveIsGood;
  final String label;
  final bool isPercent;
  final String unitLabel;
  const StatType(this.label, this.isPercent, this.positiveIsGood, this.unitLabel);
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
