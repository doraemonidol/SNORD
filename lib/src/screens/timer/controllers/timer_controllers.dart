import 'package:flutter/material.dart';
import 'package:rehabox/src/models/models.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/repositories/timer_activity_repository/timer_activity_repository_interface.dart';
import 'package:rehabox/src/utils/controllers_status.dart';

part 'timer_controllers_state.dart';

class TimerControllers extends ChangeNotifier
    implements ControllersStatusInterface {
  TimerControllers({
    required UserRepositoryInterface userRepository,
    required TimerActivityRepositoryInterface timerActivityRepository,
  })  : _userRepository = userRepository,
        _timerActivityRepository = timerActivityRepository;

  // ignore: unused_field
  final UserRepositoryInterface _userRepository;
  // ignore: unused_field
  final TimerActivityRepositoryInterface _timerActivityRepository;

  TimerControllersState _state = const TimerControllersState();

  TimerControllersState get state => _state;

  Future<void> fetchLatestTimerActivity() async {
    try {
      _state = _state.copyWith(status: ControllersStatus.loading);
      // final userId = await _userRepository.getUser();
      // final timerActivity =
      //     await _timerActivityRepository.getLatestTimerActivity(user.id);
      await Future.delayed(const Duration(seconds: 3), () {}); // Simulate delay
      final timerActivity = TimerActivity(
        id: "1",
        userId: "1",
        startAt: DateTime.now().subtract(const Duration(minutes: 50)),
        expectedDuration: const Duration(hours: 1),
        actualDuration: null,
      );
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
      // await _timerActivityRepository.updateTimerActivity(
      //   _state.timerActivity!.copyWith(actualDuration: _state.timerActivity!.expectedDuration),
      // );
      await Future.delayed(const Duration(seconds: 3), () {}); // Simulate delay
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
      // await _timerActivityRepository.deleteTimerActivity(_state.timerActivity!);
      await Future.delayed(const Duration(seconds: 3), () {}); // Simulate delay
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
