import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'placed_resource.freezed.dart';
part 'placed_resource.g.dart';

@freezed
class PlacedResource with _$PlacedResource {
  const PlacedResource._();

  const factory PlacedResource({
    required String uniqueIdentifier,
    required ResourceSprite sprite,
    @Default([]) List<List<Resource>> contents,
    Resource? selectedRecipe,
    @Default(false) bool isConstructing,
    @Default(false) bool isSelling,
    @Default(false) bool isMining,
    @Default(false) bool isSmelting,
    @Default([]) List<Resource> outputSlotContents,
  }) = _PlacedResource;

  factory PlacedResource.fromJson(Map<String, dynamic> json) => _$PlacedResourceFromJson(json);

  bool get isEmpty {
    return contents.every((element) => element.isEmpty);
  }
}
