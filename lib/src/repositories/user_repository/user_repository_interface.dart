import 'package:rehabox/src/models/NicontineConsumption/nicotine_consumption.dart';
import 'package:rehabox/src/models/models.dart'
    show Challenge, Coupon, TimerActivity, User;

abstract interface class UserRepositoryInterface {
  Future<User?> read();

  Future<List<Coupon>?> getAvailableCoupons();
  Future<bool> collectCoupon(String couponId);

  Future<List<Challenge>?> getActiveChallenges();
  Future<bool> joinChallenge(String challengeId);
  Future<List<Challenge>?> getRecommendedChallenges();

  Future<TimerActivity?> getCurrentTimerActivity();
  Future<bool> closeCurrentTimer();
  Future<TimerActivity?> startNewTimer(Duration duration);
  Future<bool?> isFirstTime();

  Future<List<NicotineConsumption>?> nicotineConsumptionDaily(DateTime date);
  Future<List<NicotineConsumption>?> nicotineConsumptionWeekly(
      DateTime endDate);
  Future<List<NicotineConsumption>?> nicotineConsumptionMonthly(DateTime date);
  Future<bool> addNicotineConsumption(NicotineConsumption nicotineConsumption);
}
