import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'placed_resource.freezed.dart';

@freezed
class PlacedResource with _$PlacedResource {
  const factory PlacedResource({
    required ResourceSprite sprite,
    @Default([]) List<List<Resource>> contents,
    Resource? selectedRecipe,
    @Default(false) bool isConstructing,
    @Default([]) List<Resource> outputSlotContents,
  }) = _PlacedResource;
}
