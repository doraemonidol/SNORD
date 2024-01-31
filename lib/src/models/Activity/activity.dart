import 'package:json_annotation/json_annotation.dart';
import 'package:rehabox/src/models/Model/model.dart';

part 'activity.g.dart';

enum ActivityType { streak, timer, challenge }

@JsonSerializable()
class Activity implements Model {
  Activity({
    required this.id,
    required this.name,
    required this.type,
    required this.date,
    int point = 0,
  }) : point = point < 0
            ? throw ArgumentError('Points must be greater or equal to 0')
            : point;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  @JsonKey(required: true)
  @override
  final String id;
  @JsonKey(required: true)
  final String name;
  @JsonKey(defaultValue: ActivityType.streak)
  final ActivityType type;
  @JsonKey(required: true)
  final DateTime date;
  @JsonKey(required: true, defaultValue: 0)
  final int point;

  @override
  String toString() {
    return 'Activity(id: $id, name: $name, type: $type, date: $date, point: $point)';
  }

  @override
  Activity copyWith({
    String? id,
    String? name,
    ActivityType? type,
    DateTime? date,
    int? point,
  }) {
    return Activity(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      date: date ?? this.date,
      point: point ?? this.point,
    );
  }
}
