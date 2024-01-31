import 'package:flutter/material.dart';
import 'package:rehabox/src/models/models.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/utils/controllers_status.dart';


part 'coupons_controllers_state.dart';

class CouponsControllers extends ChangeNotifier
    implements ControllersStatusInterface {

  CouponsControllers({
    required UserRepositoryInterface userRepository,
  }) : _userRepository = userRepository;
  
  final UserRepositoryInterface _userRepository;
  CouponsControllersState state = const CouponsControllersState();

  Future<void> getAvailableCoupons() async {
    state = state.copyWith(status: ControllersStatus.loading);
    notifyListeners();
    try {
      final coupons = await _userRepository.getAvailableCoupons();
      state = state.copyWith(
        status: ControllersStatus.loaded,
        availableCoupons: coupons,
      );
    } catch (e) {
      state = state.copyWith(
        status: ControllersStatus.error,
        errorMessage: "Couldn't get available coupons.",
      );
    }
    notifyListeners();
  }

  Future<bool> collectCoupon(Coupon coupon) async {
    state = state.copyWith(status: ControllersStatus.loading);
    notifyListeners();
    try {
      final success = await _userRepository.collectCoupon(coupon.id);
      if (success) {
        state = state.copyWith(
          status: ControllersStatus.loaded,
          availableCoupons: state.availableCoupons.where((element) => element.id != coupon.id).toList(),
        );
      } else {
        state = state.copyWith(
          status: ControllersStatus.error,
          errorMessage: "Couldn't collect coupon.",
        );
      }
      notifyListeners();
      return success;
    } catch (e) {
      state = state.copyWith(
        status: ControllersStatus.error,
        errorMessage: "Couldn't collect coupon.",
      );
    }
    notifyListeners();
    return false;
  }

  @override
  String? get errorMessage => state.errorMessage;

  @override
  bool get isError =>  state.status == ControllersStatus.error;

  @override
  bool get isInitial => state.status == ControllersStatus.initial;

  @override
  bool get isLoaded => state.status == ControllersStatus.loaded;

  @override
  bool get isLoading => state.status == ControllersStatus.loading;
}
