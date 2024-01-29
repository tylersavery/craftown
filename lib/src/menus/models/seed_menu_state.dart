import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'seed_menu_state.freezed.dart';

@freezed
class SeedMenuState with _$SeedMenuState {
  const factory SeedMenuState({
    @Default(false) bool isOpen,
    FarmlandSprite? farmlandSprite,
  }) = _SeedMenuState;
}
