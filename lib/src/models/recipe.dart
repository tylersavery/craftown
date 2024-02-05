import 'package:craftown/src/models/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

// @freezed
// class ResourceIngredient with _$ResourceIngredient {
//   const factory ResourceIngredient({
//     required Resource resource,
//     @Default(1) int quantity,
//   }) = _ResourceIngredient;
// }

@freezed
class Recipe with _$Recipe {
  const Recipe._();

  const factory Recipe({
    required String name,
    required String assetFileName,
    @Default([]) List<Ingredient> resourceIngredients,
    required int secondsToCraft,
  }) = _Recipe;

  String get assetPath {
    return "assets/images/recipes/$assetFileName";
  }
}
