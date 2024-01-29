// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToolImpl _$$ToolImplFromJson(Map<String, dynamic> json) => _$ToolImpl(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      assetName: json['assetName'] as String,
      resourcesRequired: (json['resourcesRequired'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ToolImplToJson(_$ToolImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'assetName': instance.assetName,
      'resourcesRequired':
          instance.resourcesRequired.map((e) => e.toJson()).toList(),
    };
