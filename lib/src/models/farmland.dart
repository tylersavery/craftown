import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'farmland.freezed.dart';
part 'farmland.g.dart';

String farmlandStateToJson(FarmlandState value) {
  return value.identifier;
}

FarmlandState farmlandStateFromJson(String value) {
  return FarmlandState.values.firstWhere((element) => element.identifier == value);
}

@freezed
class Farmland with _$Farmland {
  const Farmland._();

  const factory Farmland({
    required String identifier,
    Resource? seed,
    DateTime? completeAt,
    @Default(0) int wateringCount,
    @JsonKey(fromJson: farmlandStateFromJson, toJson: farmlandStateToJson) @Default(FarmlandState.untouched) FarmlandState state,
  }) = _Farmland;

  factory Farmland.fromJson(Map<String, dynamic> json) => _$FarmlandFromJson(json);
}
