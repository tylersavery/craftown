// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioStateImpl _$$AudioStateImplFromJson(Map<String, dynamic> json) =>
    _$AudioStateImpl(
      soundEnabled: json['soundEnabled'] as bool? ?? true,
      musicEnabled: json['musicEnabled'] as bool? ?? true,
      volume: (json['volume'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$$AudioStateImplToJson(_$AudioStateImpl instance) =>
    <String, dynamic>{
      'soundEnabled': instance.soundEnabled,
      'musicEnabled': instance.musicEnabled,
      'volume': instance.volume,
    };
