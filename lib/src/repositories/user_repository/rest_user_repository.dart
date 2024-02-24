import 'package:rehabox/src/data_sources/restful/challenge_rest_data_source.dart';
import 'package:rehabox/src/data_sources/restful/coupon_rest_data_source.dart';
import 'package:rehabox/src/data_sources/restful/timer_rest_data_source.dart';
import 'package:rehabox/src/data_sources/restful/user_rest_data_source.dart';
import 'package:rehabox/src/models/Challenge/challenge.dart';
import 'package:rehabox/src/models/Coupon/coupon.dart';
import 'package:rehabox/src/models/NicontineConsumption/nicotine_consumption.dart';
import 'package:rehabox/src/models/TimerActivity/timer_activity.dart';
import 'package:rehabox/src/models/User/user.dart';
import 'package:rehabox/src/repositories/user_repository/user_repository_interface.dart';

class RESTUserRepository implements UserRepositoryInterface {
  RESTUserRepository({
    required this.token,
  });

  late final UserRESTDataSource userRESTDataSource =
      UserRESTDataSource(token: token);

  late final CouponRESTDataSource couponRESTDataSource =
      CouponRESTDataSource(token: token);

  late final ChallengeRESTDataSource challengeRESTDataSource =
      ChallengeRESTDataSource(token: token);

  late final TimerRESTDataSource timerRESTDataSource =
      TimerRESTDataSource(token: token);

  final String token;

  @override
  Future<bool> collectCoupon(String couponId) =>
      couponRESTDataSource.claimCoupon(couponId);

  @override
  Future<List<Challenge>> getActiveChallenges() async {
    final challenges = await challengeRESTDataSource.readActiveChallenges();

    return challenges ?? [];
  }

  @override
  Future<List<Coupon>> getAvailableCoupons() async {
    final coupons = await couponRESTDataSource.readAvailableCoupons();
    return coupons ?? [];
  }

  @override
  Future<List<Challenge>> getRecommendedChallenges() async {
    final challenges = await challengeRESTDataSource.readAvailableChallenges();

    return challenges ?? [];
  }

  @override
  Future<bool> joinChallenge(String challengeId) =>
      challengeRESTDataSource.joinChallenge(challengeId);

  @override
  Future<User?> read() => userRESTDataSource.read();

  @override
  Future<bool> addNicotineConsumption(
          NicotineConsumption nicotineConsumption) =>
      userRESTDataSource.addNicotineConsumption(nicotineConsumption);

  @override
  Future<bool> closeCurrentTimer() => timerRESTDataSource.closeCurrentTimer();

  @override
  Future<TimerActivity?> getCurrentTimerActivity() =>
      timerRESTDataSource.getCurrentTimer();
  
  @override
  Future<List<NicotineConsumption>?> nicotineConsumptionDaily(DateTime date) =>
      userRESTDataSource.nicotineConsumptionDaily(date);

  @override
  Future<List<NicotineConsumption>?> nicotineConsumptionMonthly(
          DateTime date) =>
      userRESTDataSource.nicotineConsumptionMonthly(date);

  @override
  Future<List<NicotineConsumption>?> nicotineConsumptionWeekly(
          DateTime endDate) =>
      userRESTDataSource.nicotineConsumptionWeekly(endDate);

  @override
  Future<TimerActivity?> startNewTimer(Duration duration) =>
      timerRESTDataSource.startNewTimer(duration);

  @override
  Future<bool?> isFirstTime() => timerRESTDataSource.isFirstTime();
}
