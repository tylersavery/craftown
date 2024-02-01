// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapResourceImpl _$$MapResourceImplFromJson(Map<String, dynamic> json) =>
    _$MapResourceImpl(
      uniqueIdentifier: json['uniqueIdentifier'] as String,
      sprite: ResourceSprite.fromJson(json['sprite'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MapResourceImplToJson(_$MapResourceImpl instance) =>
    <String, dynamic>{
      'uniqueIdentifier': instance.uniqueIdentifier,
      'sprite': instance.sprite.toJson(),
    };
