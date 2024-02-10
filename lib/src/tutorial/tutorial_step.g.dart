// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TutorialStepImpl _$$TutorialStepImplFromJson(Map<String, dynamic> json) =>
    _$TutorialStepImpl(
      index: json['index'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      resourcesRequired: (json['resourcesRequired'] as List<dynamic>?)
              ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      placedResourcesRequired:
          (json['placedResourcesRequired'] as List<dynamic>?)
                  ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
    );

Map<String, dynamic> _$$TutorialStepImplToJson(_$TutorialStepImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'description': instance.description,
      'resourcesRequired':
          instance.resourcesRequired.map((e) => e.toJson()).toList(),
      'placedResourcesRequired':
          instance.placedResourcesRequired.map((e) => e.toJson()).toList(),
    };
