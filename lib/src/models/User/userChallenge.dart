import 'package:json_annotation/json_annotation.dart';
import 'package:rehabox/src/models/Model/model.dart';

part 'userChallenge.g.dart';

@JsonSerializable()
class UserChallenge implements Model {
  UserChallenge({
    required this.id,
    required this.progress,
  });

  factory UserChallenge.fromJson(Map<String, dynamic> json) =>
      _$UserChallengeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserChallengeToJson(this);

  @JsonKey(required: true)
  @override
  final String id;
  @JsonKey(required: true)
  final int progress;

  @override
  String toString() {
    return 'UserChallenge(id: $id, progress: $progress)';
  }

  @override
  UserChallenge copyWith({
    String? id,
    int? progress,
  }) {
    return UserChallenge(
      id: id ?? this.id,
      progress: progress ?? this.progress,
    );
  }
}