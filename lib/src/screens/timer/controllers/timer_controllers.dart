import 'package:flutter/material.dart';
import 'package:rehabox/src/models/models.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/utils/controllers_status.dart';

part 'timer_controllers_state.dart';

class TimerControllers extends ChangeNotifier
    implements ControllersStatusInterface {
  TimerControllers({
    required UserRepositoryInterface userRepository,
  }) : _userRepository = userRepository;

  // ignore: unused_field
  final UserRepositoryInterface _userRepository;

  TimerControllersState _state = const TimerControllersState();

  TimerControllersState get state => _state;

  Future<void> fetchLatestTimerActivity() async {
    try {
      _state = _state.copyWith(status: ControllersStatus.loading);
      // final userId = await _userRepository.getUser();
      TimerActivity? timerActivity =
          await _userRepository.getCurrentTimerActivity();
      if (timerActivity == null) {
        // _state = _state.copyWith(
        //   status: ControllersStatus.error,
        //   errorMessage: 'No timer activity found',
        // );
        // notifyListeners();
        // return;
        await Future.delayed(
            const Duration(seconds: 3), () {}); // Simulate delay
        timerActivity = TimerActivity(
          id: "1",
          userId: "1",
          startAt: DateTime.now().subtract(const Duration(minutes: 1)),
          expectedDuration: const Duration(hours: 1),
          actualDuration: null,
        );
      }
      _state = _state.copyWith(
        timerActivity: timerActivity,
        exceedExpectedDuration: DateTime.now().isAfter(
          timerActivity.startAt.add(timerActivity.expectedDuration),
        ),
        status: ControllersStatus.loaded,
      );
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        status: ControllersStatus.error,
        errorMessage: 'Error fetching latest timer activity',
      );
      notifyListeners();
    }
  }

  Future<void> claimAndCloseTimer() async {
    try {
      _state = _state.copyWith(status: ControllersStatus.loading);
      final successful = await _userRepository.closeCurrentTimer();
      // await Future.delayed(const Duration(seconds: 3), () {}); // Simulate delay
      if (!successful) {
        throw Exception('Error claiming and closing timer activity');
      }
      _state = const TimerControllersState(
        timerActivity: null,
        exceedExpectedDuration: null,
        status: ControllersStatus.loaded,
      );
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        status: ControllersStatus.error,
        errorMessage: 'Error claiming and closing timer activity',
      );
      notifyListeners();
    }
  }

  Future<void> dismissTimer() async {
    try {
      _state = _state.copyWith(status: ControllersStatus.loading);
      final successful = await _userRepository.closeCurrentTimer();
      // await Future.delayed(const Duration(seconds: 3), () {}); // Simulate delay
      if (!successful) {
        throw Exception('Error dismissing timer activity');
      }
      _state = const TimerControllersState(
        timerActivity: null,
        status: ControllersStatus.loaded,
      );
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        status: ControllersStatus.error,
        errorMessage: 'Error dismissing timer activity',
      );
      notifyListeners();
    }
  }

  void updateExceedExpectedDuration(bool value) {
    _state = _state.copyWith(exceedExpectedDuration: value);
    notifyListeners();
  }

  @override
  String? get errorMessage => _state.errorMessage;

  @override
  bool get isError => _state.status == ControllersStatus.error;

  @override
  bool get isInitial => _state.status == ControllersStatus.initial;

  @override
  bool get isLoaded => _state.status == ControllersStatus.loaded;

  @override
  bool get isLoading => _state.status == ControllersStatus.loading;
}
