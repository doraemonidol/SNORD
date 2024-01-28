import 'package:json_annotation/json_annotation.dart';
import 'package:rehabox/src/models/Model/model.dart';

part 'challenge.g.dart';

@JsonSerializable()
class Challenge implements Model {
  Challenge({
    required this.id,
    required this.name,
    required this.startDate,
    required Duration duration,
    required int points,
    this.description,
  })  : duration = duration <= Duration.zero
            ? throw ArgumentError('Duration must be greater than 0')
            : duration,
        points = points < 0
            ? throw ArgumentError('Points must be greater or equal to 0')
            : points;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChallengeToJson(this);

  @JsonKey(required: true)
  @override
  final String id;
  @JsonKey(required: true)
  final String name;
  @JsonKey(required: true)
  final DateTime startDate;
  @JsonKey(required: true)
  final Duration duration;
  @JsonKey(required: true, defaultValue: 0)
  final int points;
  final String? description;

  @override
  String toString() {
    return 'Challenge(id: $id, name: $name, startDate: $startDate, duration: $duration, points: $points, description: $description)';
  }

  @override
  Challenge copyWith({
    String? id,
    String? name,
    DateTime? startDate,
    Duration? duration,
    int? points,
    String? description,
  }) {
    return Challenge(
      id: id ?? this.id,
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      duration: duration ?? this.duration,
      points: points ?? this.points,
      description: description ?? this.description,
    );
  }
}
