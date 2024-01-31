import 'package:rehabox/src/models/models.dart';

final coupons = [
  Coupon(
    id: '1',
    name: 'Coupon 1',
    type: CouponType.streak,
    isApplied: false,
    duration: const Duration(days: 1),
    price: 1000,
    expiredAt: DateTime.now().add(const Duration(days: 1)),
  ),
  Coupon(
    id: '2',
    name: 'Coupon 2',
    type: CouponType.timer,
    isApplied: false,
    duration: const Duration(days: 2),
    price: 2000,
    expiredAt: DateTime.now().add(const Duration(days: 2)),
  ),
  Coupon(
    id: '3',
    name: 'Coupon 3',
    type: CouponType.streak,
    isApplied: false,
    duration: const Duration(days: 3),
    price: 3000,
    expiredAt: DateTime.now().add(const Duration(days: 3)),
  ),
  Coupon(
    id: '4',
    name: 'Coupon 4',
    type: CouponType.timer,
    isApplied: false,
    duration: const Duration(days: 4),
    price: 4000,
    expiredAt: DateTime.now().add(const Duration(days: 4)),
  ),
];
