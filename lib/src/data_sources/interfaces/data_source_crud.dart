import 'package:rehabox/src/models/models.dart';

abstract interface class TimerActivityDataSource {
  Future<TimerActivity> createTimerActivity(TimerActivity timerActivity);
  Future<TimerActivity?> readTimerActivity(String id);
  Future<List<TimerActivity>> readAllTimerActivities();
  Future<TimerActivity> updateTimerActivity(TimerActivity timerActivity);
  Future<TimerActivity> deleteTimerActivity(String id);
}

abstract interface class CouponDataSource {
  Future<Coupon> createCoupon(Coupon coupon);
  Future<Coupon?> readCoupon(String id);
  Future<List<Coupon>> readAllCoupons();
  Future<Coupon> updateCoupon(Coupon coupon);
  Future<Coupon> deleteCoupon(String id);
}

abstract interface class ChallengeDataSource {
  Future<Challenge> createChallenge(Challenge challenge);
  Future<Challenge?> readChallenge(String id);
  Future<List<Challenge>> readAllChallenges();
  Future<Challenge> updateChallenge(Challenge challenge);
  Future<Challenge> deleteChallenge(String id);
}