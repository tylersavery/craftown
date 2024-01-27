// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      resource: Resource.fromJson(json['resource'] as Map<String, dynamic>),
      quantity: json['quantity'] as int? ?? 1,
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'resource': instance.resource.toJson(),
      'quantity': instance.quantity,
    };
