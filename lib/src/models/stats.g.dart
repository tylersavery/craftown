// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatsImpl _$$StatsImplFromJson(Map<String, dynamic> json) => _$StatsImpl(
      dollars: json['dollars'] as int,
      sustainability: (json['sustainability'] as num).toDouble(),
      energy: (json['energy'] as num).toDouble(),
    );

Map<String, dynamic> _$$StatsImplToJson(_$StatsImpl instance) =>
    <String, dynamic>{
      'dollars': instance.dollars,
      'sustainability': instance.sustainability,
      'energy': instance.energy,
    };
