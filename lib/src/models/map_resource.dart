import 'package:craftown/src/components/resource_sprite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_resource.freezed.dart';
part 'map_resource.g.dart';

@freezed
class MapResource with _$MapResource {
  const MapResource._();

  const factory MapResource({
    required String uniqueIdentifier,
    required ResourceSprite sprite,
    required int tileX,
    required int tileY,
  }) = _MapResource;

  factory MapResource.fromJson(Map<String, dynamic> json) => _$MapResourceFromJson(json);
}
