part of 'challenges_controllers.dart';

@immutable
class ChallengesControllersState {
  const ChallengesControllersState({
    required this.status,
    required this.activeChallenges,
    required this.recommendedChallenges,
    this.errorMessage,
  });

  const ChallengesControllersState.initial()
      : status = ControllersStatus.initial,
        activeChallenges = const [],
        recommendedChallenges = const [],
        errorMessage = null;

  const ChallengesControllersState.error(
    String this.errorMessage,
  )
      : status = ControllersStatus.initial,
        activeChallenges = const [],
        recommendedChallenges = const [];

  final ControllersStatus status;
  final List<Challenge> activeChallenges;
  final List<Challenge> recommendedChallenges;
  final String? errorMessage;

  ChallengesControllersState copyWith({
    ControllersStatus? status,
    List<Challenge>? activeChallenges,
    List<Challenge>? recommendedChallenges,
    String? errorMessage,
  }) {
    return ChallengesControllersState(
      status: status ?? this.status,
      activeChallenges: activeChallenges ?? this.activeChallenges,
      recommendedChallenges: recommendedChallenges ?? this.recommendedChallenges,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}