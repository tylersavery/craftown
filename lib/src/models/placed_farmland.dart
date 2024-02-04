import 'package:craftown/src/models/farmland.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'placed_farmland.freezed.dart';
part 'placed_farmland.g.dart';

@freezed
class PlacedFarmland with _$PlacedFarmland {
  const PlacedFarmland._();

  const factory PlacedFarmland({
    required String identifier,
    required Farmland farmland,
    required int tileX,
    required int tileY,
  }) = _PlacedFarmland;

  factory PlacedFarmland.fromJson(Map<String, dynamic> json) => _$PlacedFarmlandFromJson(json);
}
