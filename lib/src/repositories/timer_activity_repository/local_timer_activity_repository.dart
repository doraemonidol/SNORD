import 'package:rehabox/src/models/TimerActivity/timer_activity.dart';
import 'package:rehabox/src/repositories/timer_activity_repository/timer_activity_repository_interface.dart';

class LocalTimerActivityRepository implements TimerActivityRepositoryInterface {
  @override
  Future<void> addTimerActivity(TimerActivity timerActivity) {
    // TODO: implement addTimerActivity
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTimerActivity(TimerActivity timerActivity) {
    // TODO: implement deleteTimerActivity
    throw UnimplementedError();
  }

  @override
  Future<TimerActivity> getLatestTimerActivity(String userId) {
    // TODO: implement getLatestTimerActivity
    throw UnimplementedError();
  }

  @override
  Future<void> updateTimerActivity(TimerActivity timerActivity) {
    // TODO: implement updateTimerActivity
    throw UnimplementedError();
  }

}