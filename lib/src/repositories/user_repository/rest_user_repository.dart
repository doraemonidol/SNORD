import 'package:flutter/material.dart';
import 'package:rehabox/src/data_sources/restful/user_rest_data_source.dart';
import 'package:rehabox/src/models/Challenge/challenge.dart';
import 'package:rehabox/src/models/Coupon/coupon.dart';
import 'package:rehabox/src/models/User/user.dart';
import 'package:rehabox/src/repositories/user_repository/user_repository_interface.dart';

class RestUserRepository implements UserRepositoryInterface {
  RestUserRepository();

  final UserRESTDataSource userRESTDataSource = UserRESTDataSource();

  @override
  Future<bool> collectCoupon(String couponId) {
    // TODO: implement collectCoupon
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteCoupon(String couponId) {
    // TODO: implement deleteCoupon
    throw UnimplementedError();
  }

  @override
  Future<List<Challenge>> getActiveChallenges() {
    // TODO: implement getActiveChallenges
    throw UnimplementedError();
  }

  @override
  Future<List<Coupon>> getAvailableCoupons() {
    // TODO: implement getAvailableCoupons
    throw UnimplementedError();
  }

  @override
  Future<List<Challenge>> getRecommendedChallenges() {
    // TODO: implement getRecommendedChallenges
    throw UnimplementedError();
  }

  @override
  Future<bool> joinChallenge(String challengeId) {
    // TODO: implement joinChallenge
    throw UnimplementedError();
  }

  @override
  Future<bool> useCoupon(String couponId) {
    // TODO: implement useCoupon
    throw UnimplementedError();
  }

  @override
  Future<User?> read(String id) async {
    final user = await userRESTDataSource.read(id);

    debugPrint("User: $user");

    return user;
  }
}
