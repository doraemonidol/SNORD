import 'package:rehabox/src/data_sources/data_sources.dart';
import 'package:rehabox/src/models/Coupon/coupon.dart';
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
}
