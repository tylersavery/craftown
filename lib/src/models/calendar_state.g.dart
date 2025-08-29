// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarStateImpl _$$CalendarStateImplFromJson(Map<String, dynamic> json) =>
    _$CalendarStateImpl(
      monthIndex: (json['monthIndex'] as num?)?.toInt() ?? 0,
      yearIndex: (json['yearIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CalendarStateImplToJson(_$CalendarStateImpl instance) =>
    <String, dynamic>{
      'monthIndex': instance.monthIndex,
      'yearIndex': instance.yearIndex,
    };
