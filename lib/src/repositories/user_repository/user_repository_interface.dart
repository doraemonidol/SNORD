import 'package:rehabox/src/models/models.dart' show Challenge, Coupon;

abstract interface class UserRepositoryInterface {
  // Future<User> create(User user);

  // Future<User?> read(String id);

  // Future<List<User>> readAll();

  // Future<User> update(User user);

  // Future<User> remove(String id);

  Future<List<Coupon>> getAvailableCoupons();
  Future<bool> collectCoupon(String couponId);
  Future<bool> useCoupon(String couponId);
  Future<bool> deleteCoupon(String couponId);

  // Get the user's active and recommended challenges
  Future<List<Challenge>> getActiveChallenges();
  Future<List<Challenge>> getRecommendedChallenges();
  Future<bool> joinChallenge(String challengeId);
}
