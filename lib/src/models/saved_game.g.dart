// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedGameImpl _$$SavedGameImplFromJson(Map<String, dynamic> json) =>
    _$SavedGameImpl(
      identifier: json['identifier'] as String,
      fileName: json['fileName'] as String,
      character: Character.fromJson(json['character'] as Map<String, dynamic>),
      savedAt: DateTime.parse(json['savedAt'] as String),
      inventory: (json['inventory'] as List<dynamic>?)
              ?.map((e) => InventorySlot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playerPositionX: (json['playerPositionX'] as num).toDouble(),
      playerPositionY: (json['playerPositionY'] as num).toDouble(),
      placedResources: (json['placedResources'] as List<dynamic>?)
              ?.map((e) => PlacedResource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
      inHand: json['inHand'] == null
          ? null
          : Resource.fromJson(json['inHand'] as Map<String, dynamic>),
      farmlands: (json['farmlands'] as List<dynamic>?)
              ?.map((e) => Farmland.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SavedGameImplToJson(_$SavedGameImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'fileName': instance.fileName,
      'character': instance.character.toJson(),
      'savedAt': instance.savedAt.toIso8601String(),
      'inventory': instance.inventory.map((e) => e.toJson()).toList(),
      'playerPositionX': instance.playerPositionX,
      'playerPositionY': instance.playerPositionY,
      'placedResources':
          instance.placedResources.map((e) => e.toJson()).toList(),
      'stats': instance.stats.toJson(),
      'inHand': instance.inHand?.toJson(),
      'farmlands': instance.farmlands.map((e) => e.toJson()).toList(),
    };
