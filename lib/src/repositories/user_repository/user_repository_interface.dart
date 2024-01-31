import 'package:rehabox/src/models/models.dart' show Coupon;

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
}
