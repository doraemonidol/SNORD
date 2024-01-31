import 'package:json_annotation/json_annotation.dart';
import 'package:rehabox/src/models/Activity/activity.dart';
import 'package:rehabox/src/models/Model/model.dart';
import 'package:rehabox/src/models/User/userAchievement.dart';
import 'package:rehabox/src/models/User/userChallenge.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements Model {
  User({
    required this.id,
    required this.name,
    required this.point,
    required this.activities,
    required this.challenges,
    required this.goal,
    required this.achievements,
    required this.coupons,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(required: true)
  @override
  final String id;
  @JsonKey(required: true)
  final String name;
  @JsonKey(required: true, defaultValue: 0)
  final int point;
  @JsonKey(required: true, defaultValue: [])
  final List<Activity> activities;
  @JsonKey(required: true, defaultValue: [])
  final List<UserChallenge> challenges;
  @JsonKey(required: true, defaultValue: [])
  final Duration goal;
  @JsonKey(required: true, defaultValue: [])
  final List<UserAchievement> achievements;
  @JsonKey(required: true, defaultValue: [])
  final List<String> coupons;

  @override
  String toString() {
    return 'User(id: $id, name: $name, point: $point, activities: $activities, challenges: $challenges, goal: $goal, achievements: $achievements, coupons: $coupons)';
  }

  @override
  User copyWith({
    String? id,
    String? name,
    int? point,
    List<Activity>? activities,
    List<UserChallenge>? challenges,
    Duration? goal,
    List<UserAchievement>? achievements,
    List<String>? coupons,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      point: point ?? this.point,
      activities: activities ?? this.activities,
      challenges: challenges ?? this.challenges,
      goal: goal ?? this.goal,
      achievements: achievements ?? this.achievements,
      coupons: coupons ?? this.coupons,
    );
  }
}