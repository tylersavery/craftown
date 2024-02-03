// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'research_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResearchLevelImpl _$$ResearchLevelImplFromJson(Map<String, dynamic> json) =>
    _$ResearchLevelImpl(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      prerequisites: (json['prerequisites'] as List<dynamic>?)
              ?.map((e) => ResearchLevel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      timeToUnlock: Duration(microseconds: json['timeToUnlock'] as int),
      cost: (json['cost'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResearchLevelImplToJson(_$ResearchLevelImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'prerequisites': instance.prerequisites.map((e) => e.toJson()).toList(),
      'timeToUnlock': instance.timeToUnlock.inMicroseconds,
      'cost': instance.cost.map((e) => e.toJson()).toList(),
    };
