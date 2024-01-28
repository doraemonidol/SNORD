import 'package:json_annotation/json_annotation.dart';

part 'challenge.g.dart';

@JsonSerializable()
class Challenge {
  Challenge({
    required this.id,
    required this.name,
    required this.startDate,
    required Duration duration,
    required int points,
    this.description,
  }): duration = duration <= Duration.zero
            ? throw ArgumentError('Duration must be greater than 0')
            : duration,
        points = points < 0
            ? throw ArgumentError('Points must be greater or equal to 0')
            : points;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeToJson(this);

  @JsonKey(required: true)
  final String id;
  @JsonKey(required: true)
  final String name;
  @JsonKey(required: true)
  final String startDate;
  @JsonKey(required: true)
  final Duration duration;
  @JsonKey(required: true, defaultValue: 0)
  final int points;
  final String? description;
}
