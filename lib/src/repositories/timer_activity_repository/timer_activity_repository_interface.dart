import 'package:rehabox/src/models/models.dart' show TimerActivity;

abstract interface class TimerActivityRepositoryInterface {
  Future<void> addTimerActivity(TimerActivity timerActivity);
  Future<void> deleteTimerActivity(TimerActivity timerActivity);
  Future<void> updateTimerActivity(TimerActivity timerActivity);
  Future<TimerActivity> getLatestTimerActivity(String userId);
}
