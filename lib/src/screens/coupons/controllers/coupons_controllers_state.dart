part of 'coupons_controllers.dart';

@immutable
class CouponsControllersState {
  const CouponsControllersState({
    this.errorMessage,
    this.status = ControllersStatus.initial,
    this.availableCoupons = const <Coupon>[],
  });

  final String? errorMessage;
  final ControllersStatus status;
  final List<Coupon> availableCoupons;

  CouponsControllersState copyWith({
    String? errorMessage,
    ControllersStatus? status,
    List<Coupon>? availableCoupons,
  }) {
    return CouponsControllersState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      availableCoupons: availableCoupons ?? this.availableCoupons,
    );
  }
}
