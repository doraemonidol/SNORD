// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userChallenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserChallenge _$UserChallengeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'progress'],
  );
  return UserChallenge(
    id: json['id'] as String,
    progress: json['progress'] as int,
  );
}

Map<String, dynamic> _$UserChallengeToJson(UserChallenge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'progress': instance.progress,
    };
