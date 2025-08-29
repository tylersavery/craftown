// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placed_conveyor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlacedConveyorImpl _$$PlacedConveyorImplFromJson(Map<String, dynamic> json) =>
    _$PlacedConveyorImpl(
      identifier: json['identifier'] as String,
      tileX: (json['tileX'] as num).toInt(),
      tileY: (json['tileY'] as num).toInt(),
      quarterTurns: (json['quarterTurns'] as num).toInt(),
    );

Map<String, dynamic> _$$PlacedConveyorImplToJson(
        _$PlacedConveyorImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'tileX': instance.tileX,
      'tileY': instance.tileY,
      'quarterTurns': instance.quarterTurns,
    };
