import 'package:freezed_annotation/freezed_annotation.dart';

part 'placed_conveyor.freezed.dart';
part 'placed_conveyor.g.dart';

@freezed
class PlacedConveyor with _$PlacedConveyor {
  const PlacedConveyor._();

  const factory PlacedConveyor({
    required String identifier,
    required int tileX,
    required int tileY,
    required int quarterTurns,
  }) = _PlacedConveyor;

  factory PlacedConveyor.fromJson(Map<String, dynamic> json) => _$PlacedConveyorFromJson(json);
}
