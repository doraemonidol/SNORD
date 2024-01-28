// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'startDate', 'duration', 'points'],
  );
  return Challenge(
    id: json['id'] as String,
    name: json['name'] as String,
    startDate: json['startDate'] as String,
    duration: Duration(microseconds: json['duration'] as int),
    points: json['points'] as int? ?? 0,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startDate': instance.startDate,
      'duration': instance.duration.inMicroseconds,
      'points': instance.points,
      'description': instance.description,
    };
