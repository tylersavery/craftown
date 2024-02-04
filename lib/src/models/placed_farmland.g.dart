// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placed_farmland.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlacedFarmlandImpl _$$PlacedFarmlandImplFromJson(Map<String, dynamic> json) =>
    _$PlacedFarmlandImpl(
      identifier: json['identifier'] as String,
      farmland: Farmland.fromJson(json['farmland'] as Map<String, dynamic>),
      tileX: json['tileX'] as int,
      tileY: json['tileY'] as int,
    );

Map<String, dynamic> _$$PlacedFarmlandImplToJson(
        _$PlacedFarmlandImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'farmland': instance.farmland.toJson(),
      'tileX': instance.tileX,
      'tileY': instance.tileY,
    };
