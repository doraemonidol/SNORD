import 'package:json_annotation/json_annotation.dart';
import 'package:rehabox/src/models/Model/model.dart';

part 'userAchievement.g.dart';

@JsonSerializable()
class UserAchievement implements Model {
  UserAchievement({
    required this.id,
    required this.date,
  });

  factory UserAchievement.fromJson(Map<String, dynamic> json) =>
      _$UserAchievementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserAchievementToJson(this);

  @JsonKey(required: true)
  @override
  final String id;
  @JsonKey(required: true)
  final DateTime date;

  @override
  String toString() {
    return 'UserAchievement(id: $id, date: $date)';
  }

  @override
  UserAchievement copyWith({
    String? id,
    DateTime? date,
  }) {
    return UserAchievement(
      id: id ?? this.id,
      date: date ?? this.date,
    );
  }
}