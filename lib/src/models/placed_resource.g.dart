// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placed_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlacedResourceImpl _$$PlacedResourceImplFromJson(Map<String, dynamic> json) =>
    _$PlacedResourceImpl(
      uniqueIdentifier: json['uniqueIdentifier'] as String,
      sprite: ResourceSprite.fromJson(json['sprite'] as Map<String, dynamic>),
      contents: (json['contents'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => Resource.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          const [],
      selectedRecipe: json['selectedRecipe'] == null
          ? null
          : Resource.fromJson(json['selectedRecipe'] as Map<String, dynamic>),
      isConstructing: json['isConstructing'] as bool? ?? false,
      outputSlotContents: (json['outputSlotContents'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PlacedResourceImplToJson(
        _$PlacedResourceImpl instance) =>
    <String, dynamic>{
      'uniqueIdentifier': instance.uniqueIdentifier,
      'sprite': instance.sprite.toJson(),
      'contents': instance.contents
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
      'selectedRecipe': instance.selectedRecipe?.toJson(),
      'isConstructing': instance.isConstructing,
      'outputSlotContents':
          instance.outputSlotContents.map((e) => e.toJson()).toList(),
    };
