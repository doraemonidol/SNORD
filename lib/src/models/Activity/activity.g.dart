// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'date', 'point'],
  );
  return Activity(
    id: json['id'] as String,
    name: json['name'] as String,
    type: $enumDecodeNullable(_$ActivityTypeEnumMap, json['type']) ??
        ActivityType.streak,
    date: DateTime.parse(json['date'] as String),
    point: json['point'] as int? ?? 0,
  );
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ActivityTypeEnumMap[instance.type]!,
      'date': instance.date.toIso8601String(),
      'point': instance.point,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.streak: 'streak',
  ActivityType.timer: 'timer',
  ActivityType.challenge: 'challenge',
};
