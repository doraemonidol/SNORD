// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'name',
      'point',
      'activities',
      // 'challenges',
      // 'goal',
      'achievements',
      // 'coupons',
      // 'imageUrl'
    ],
  );
  return User(
    id: json['id'] as String,
    name: json['name'] as String,
    point: json['point'] as int? ?? 0,
    activities: (json['activities'] as List<dynamic>?)
            ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    challenges: (json['challenges'] as List<dynamic>?)
            ?.map((e) => UserChallenge.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    goal: json['goal'] == null
        ? Duration(microseconds: 0)
        : Duration(microseconds: json['goal'] as int),
    achievements: (json['achievements'] as List<dynamic>?)
            ?.map((e) => UserAchievement.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    coupons:
        (json['coupons'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    imageUrl: json['imageUrl'] as String? ?? '',
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'point': instance.point,
      'activities': instance.activities,
      'challenges': instance.challenges,
      'goal': instance.goal.inMicroseconds,
      'achievements': instance.achievements,
      'coupons': instance.coupons,
      'imageUrl': instance.imageUrl,
    };
