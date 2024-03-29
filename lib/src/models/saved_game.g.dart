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
      researchLevels: (json['researchLevels'] as List<dynamic>?)
              ?.map((e) => ResearchLevel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isResearching: json['isResearching'] == null
          ? null
          : ResearchLevel.fromJson(
              json['isResearching'] as Map<String, dynamic>),
      researchStarted: json['researchStarted'] == null
          ? null
          : DateTime.parse(json['researchStarted'] as String),
      calendarState:
          CalendarState.fromJson(json['calendarState'] as Map<String, dynamic>),
      placedFarmlands: (json['placedFarmlands'] as List<dynamic>?)
              ?.map((e) => PlacedFarmland.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tutorialStep: json['tutorialStep'] == null
          ? null
          : TutorialStep.fromJson(json['tutorialStep'] as Map<String, dynamic>),
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
      'researchLevels': instance.researchLevels.map((e) => e.toJson()).toList(),
      'isResearching': instance.isResearching?.toJson(),
      'researchStarted': instance.researchStarted?.toIso8601String(),
      'calendarState': instance.calendarState.toJson(),
      'placedFarmlands':
          instance.placedFarmlands.map((e) => e.toJson()).toList(),
      'tutorialStep': instance.tutorialStep?.toJson(),
    };
