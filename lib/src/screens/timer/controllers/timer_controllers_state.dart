part of 'timer_controllers.dart';

class TimerControllersState {
  const TimerControllersState({
    this.timerActivity,
    this.errorMessage,
    this.exceedExpectedDuration,
    this.status = ControllersStatus.initial,
  });

  final TimerActivity? timerActivity;
  final bool? exceedExpectedDuration;
  final ControllersStatus status;
  final String? errorMessage;

  TimerControllersState copyWith({
    TimerActivity? timerActivity,
    ControllersStatus? status,
    String? errorMessage,
    bool? exceedExpectedDuration,
  }) {
    return TimerControllersState(
      timerActivity: timerActivity ?? this.timerActivity,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      exceedExpectedDuration:
          exceedExpectedDuration ?? this.exceedExpectedDuration,
    );
  }
}
