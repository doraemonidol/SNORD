// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userAchievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAchievement _$UserAchievementFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'date'],
  );
  return UserAchievement(
    id: json['id'] as String,
    date: DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$UserAchievementToJson(UserAchievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
    };
