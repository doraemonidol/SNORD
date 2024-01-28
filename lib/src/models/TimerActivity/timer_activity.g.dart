// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimerActivity _$TimerActivityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'userId', 'startAt', 'expectedDuration'],
  );
  return TimerActivity(
    id: json['id'] as String,
    userId: json['userId'] as String,
    startAt: DateTime.parse(json['startAt'] as String),
    expectedDuration: Duration(microseconds: json['expectedDuration'] as int),
    actualDuration: json['actualDuration'] == null
        ? null
        : Duration(microseconds: json['actualDuration'] as int),
    couponAppliedId: json['couponAppliedId'] as String?,
  );
}

Map<String, dynamic> _$TimerActivityToJson(TimerActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'startAt': instance.startAt.toIso8601String(),
      'expectedDuration': instance.expectedDuration.inMicroseconds,
      'actualDuration': instance.actualDuration?.inMicroseconds,
      'couponAppliedId': instance.couponAppliedId,
    };
