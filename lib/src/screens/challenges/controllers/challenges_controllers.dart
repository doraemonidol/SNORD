import 'package:flutter/material.dart';
import 'package:rehabox/src/models/models.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/utils/controllers_status.dart';

part 'challenges_controllers_state.dart';

class ChallengesControllers extends ChangeNotifier
    implements ControllersStatusInterface {
  ChallengesControllers({
    required UserRepositoryInterface userRepository,
  }) : _userRepository = userRepository;

  // Fetch user challenges and recommended challenges
  Future<void> fetchChallenges() async {
    try {
      state = state.copyWith(status: ControllersStatus.loading);
      notifyListeners();
      final results = await Future.wait([
        _userRepository.getActiveChallenges(),
        _userRepository.getRecommendedChallenges(),
      ]);

      state = state.copyWith(
        status: ControllersStatus.loaded,
        activeChallenges: results[0],
        recommendedChallenges: results[1],
      );
    } catch (e) {
      state =
          const ChallengesControllersState.error("Error fetching challenges");
    }
    notifyListeners();
  }

  Future<void> joinChallenge(String challengeId) async {
    try {
      final result = await _userRepository.joinChallenge(challengeId);
      if (result) {
        await fetchChallenges();
      }
    } catch (e) {
      state =
          const ChallengesControllersState.error("Error joining challenge");
      notifyListeners();
    }
  }

  ChallengesControllersState state =
      const ChallengesControllersState.initial();

  final UserRepositoryInterface _userRepository;

  @override
  String? get errorMessage => state.errorMessage;

  @override
  bool get isError => state.status == ControllersStatus.error;

  @override
  bool get isInitial => state.status == ControllersStatus.initial;

  @override
  bool get isLoaded => state.status == ControllersStatus.loaded;

  @override
  bool get isLoading => state.status == ControllersStatus.loading;
}
