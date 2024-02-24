import 'package:rehabox/src/data_sources/data_sources.dart';
import 'package:rehabox/src/models/Challenge/challenge.dart';
import 'package:rehabox/src/models/Coupon/coupon.dart';
import 'package:rehabox/src/models/NicontineConsumption/nicotine_consumption.dart';
import 'package:rehabox/src/models/TimerActivity/timer_activity.dart';
import 'package:rehabox/src/models/User/user.dart';
import 'package:rehabox/src/repositories/user_repository/user_repository_interface.dart';

class LocalUserRepository implements UserRepositoryInterface {
  const LocalUserRepository({
    required this.localDataSource,
  });

  final LocalDataSource localDataSource;

  @override
  Future<List<Coupon>> getAvailableCoupons() async {
    try {
      final coupons = await localDataSource.readAllCoupons();
      return coupons;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> collectCoupon(String couponId) async {
    try {
      final coupon = await localDataSource.readCoupon(couponId);
      if (coupon == null) {
        return false;
      }
      await localDataSource.updateCoupon(coupon.copyWith(isApplied: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteCoupon(String couponId) {
    // TODO: implement deleteCoupon
    throw UnimplementedError();
  }

  @override
  Future<bool> useCoupon(String couponId) {
    // TODO: implement useCoupon
    throw UnimplementedError();
  }

  @override
  Future<List<Challenge>> getActiveChallenges() => Future.delayed(
      const Duration(seconds: 2),
      () => [
            Challenge(
              id: '1',
              name: '18 hours Challenge',
              startDate: DateTime(2024, 2, 1),
              duration: const Duration(days: 5, hours: 13),
              points: 1000,
            ),
          ]);

  @override
  Future<List<Challenge>> getRecommendedChallenges() => Future.delayed(
      const Duration(seconds: 2),
      () => [
            Challenge(
              id: '2',
              name: 'Together we can change the world',
              startDate: DateTime(2024, 2, 1),
              duration: const Duration(days: 10, hours: 13),
              points: 2000,
            ),
          ]);

  @override
  Future<bool> joinChallenge(String challengeId) {
    throw UnimplementedError();
  }

  @override
  Future<User?> read() {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<bool> addNicotineConsumption(NicotineConsumption nicotineConsumption) {
    // TODO: implement addNicotineConsumption
    throw UnimplementedError();
  }

  @override
  Future<bool> closeCurrentTimer() {
    // TODO: implement closeCurrentTimer
    throw UnimplementedError();
  }

  @override
  Future<TimerActivity?> getCurrentTimerActivity() {
    // TODO: implement getCurrentTimerActivity
    throw UnimplementedError();
  }

  @override
  Future<List<NicotineConsumption>?> nicotineConsumptionDaily(DateTime date) {
    // TODO: implement nicotineConsumptionDaily
    throw UnimplementedError();
  }

  @override
  Future<List<NicotineConsumption>?> nicotineConsumptionMonthly(DateTime date) {
    // TODO: implement nicotineConsumptionMonthly
    throw UnimplementedError();
  }

  @override
  Future<List<NicotineConsumption>?> nicotineConsumptionWeekly(
      DateTime endDate) {
    // TODO: implement nicotineConsumptionWeekly
    throw UnimplementedError();
  }

  @override
  Future<TimerActivity?> startNewTimer(Duration duration) {
    // TODO: implement startNewTimer
    throw UnimplementedError();
  }

  @override
  Future<bool> isFirstTime() {
    // TODO: implement isFistTime
    throw UnimplementedError();
  }
}
