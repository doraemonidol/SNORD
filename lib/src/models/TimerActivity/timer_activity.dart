import 'package:json_annotation/json_annotation.dart';
import 'package:rehabox/src/models/Model/model.dart';

part 'timer_activity.g.dart';

@JsonSerializable()
class TimerActivity implements Model {
  TimerActivity({
    required this.id,
    required this.userId,
    required this.startAt,
    required Duration expectedDuration,
    required Duration? actualDuration,
    this.couponAppliedId,
  })  : expectedDuration = expectedDuration == Duration.zero ||
                expectedDuration < Duration.zero ||
                (actualDuration != null && actualDuration > expectedDuration)
            ? throw ArgumentError(
                'Expected duration must be greater than 0 and greater or equal to actual duration')
            : expectedDuration,
        actualDuration = actualDuration == Duration.zero ||
                (actualDuration != null && actualDuration > expectedDuration)
            ? throw ArgumentError(
                'Actual duration must be greater than 0 and less than expected duration or null')
            : actualDuration;

  factory TimerActivity.fromJson(Map<String, dynamic> json) =>
      _$TimerActivityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TimerActivityToJson(this);

  @JsonKey(required: true)
  @override
  final String id;
  @JsonKey(required: true)
  final String userId;
  @JsonKey(required: true)
  final DateTime startAt;
  @JsonKey(required: true)
  final Duration expectedDuration;
  final Duration? actualDuration;
  final String? couponAppliedId;

  @override
  String toString() {
    return 'TimerActivity(id: $id, userId: $userId, startAt: $startAt, expectedDuration: $expectedDuration, actualDuration: $actualDuration, couponAppliedId: $couponAppliedId)';
  }

  @override
  TimerActivity copyWith({
    String? id,
    String? userId,
    DateTime? startAt,
    Duration? expectedDuration,
    Duration? actualDuration,
    String? couponAppliedId,
  }) =>
      TimerActivity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        startAt: startAt ?? this.startAt,
        expectedDuration: expectedDuration ?? this.expectedDuration,
        actualDuration: actualDuration ?? this.actualDuration,
        couponAppliedId: couponAppliedId ?? this.couponAppliedId,
      );
}
