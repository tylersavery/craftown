// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmland.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FarmlandImpl _$$FarmlandImplFromJson(Map<String, dynamic> json) =>
    _$FarmlandImpl(
      identifier: json['identifier'] as String,
      seed: json['seed'] == null
          ? null
          : Resource.fromJson(json['seed'] as Map<String, dynamic>),
      completeAt: json['completeAt'] == null
          ? null
          : DateTime.parse(json['completeAt'] as String),
      wateringCount: json['wateringCount'] as int? ?? 0,
      state: json['state'] == null
          ? FarmlandState.untouched
          : farmlandStateFromJson(json['state'] as String),
    );

Map<String, dynamic> _$$FarmlandImplToJson(_$FarmlandImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'seed': instance.seed?.toJson(),
      'completeAt': instance.completeAt?.toIso8601String(),
      'wateringCount': instance.wateringCount,
      'state': farmlandStateToJson(instance.state),
    };
