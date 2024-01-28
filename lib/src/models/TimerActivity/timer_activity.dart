import 'package:json_annotation/json_annotation.dart';

part 'timer_activity.g.dart';

@JsonSerializable()
class TimerActivity {
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
            ? throw ArgumentError('Expected duration must be greater than 0 and greater or equal to actual duration')
            : expectedDuration,
        actualDuration = actualDuration == Duration.zero ||
                (actualDuration != null && actualDuration > expectedDuration)
            ? throw ArgumentError(
                'Actual duration must be greater than 0 and less than expected duration or null')
            : actualDuration;

  factory TimerActivity.fromJson(Map<String, dynamic> json) =>
      _$TimerActivityFromJson(json);

  Map<String, dynamic> toJson() => _$TimerActivityToJson(this);

  @JsonKey(required: true)
  final String id;
  @JsonKey(required: true)
  final String userId;
  @JsonKey(required: true)
  final DateTime startAt;
  @JsonKey(required: true)
  final Duration expectedDuration;
  final Duration? actualDuration;
  final String? couponAppliedId;
}
