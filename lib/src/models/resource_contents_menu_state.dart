import 'package:craftown/src/components/resource_sprite.dart';
import 'package:craftown/src/models/placed_resource.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_contents_menu_state.freezed.dart';

@freezed
class ResourceContentsMenuState with _$ResourceContentsMenuState {
  const factory ResourceContentsMenuState({
    @Default(false) bool isOpen,
    PlacedResource? placedResource,
  }) = _ResourceContentsMenuState;
}
