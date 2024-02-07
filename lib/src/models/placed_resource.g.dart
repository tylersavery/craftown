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
      isSelling: json['isSelling'] as bool? ?? false,
      isPowerGenerating: json['isPowerGenerating'] as bool? ?? false,
      isMining: json['isMining'] as bool? ?? false,
      isSmelting: json['isSmelting'] as bool? ?? false,
      outputSlotContents: (json['outputSlotContents'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tileX: json['tileX'] as int,
      tileY: json['tileY'] as int,
      tileSizeX: json['tileSizeX'] as int,
      tileSizeY: json['tileSizeY'] as int,
      rotationQuarterTurns: json['rotationQuarterTurns'] as int? ?? 0,
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
      'isSelling': instance.isSelling,
      'isPowerGenerating': instance.isPowerGenerating,
      'isMining': instance.isMining,
      'isSmelting': instance.isSmelting,
      'outputSlotContents':
          instance.outputSlotContents.map((e) => e.toJson()).toList(),
      'tileX': instance.tileX,
      'tileY': instance.tileY,
      'tileSizeX': instance.tileSizeX,
      'tileSizeY': instance.tileSizeY,
      'rotationQuarterTurns': instance.rotationQuarterTurns,
    };
