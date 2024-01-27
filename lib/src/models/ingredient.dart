import 'package:craftown/src/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const Ingredient._();

  const factory Ingredient({
    required Resource resource,
    @Default(1) int quantity,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}
