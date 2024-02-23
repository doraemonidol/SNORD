import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rehabox/src/data_sources/restful/rest_data_source.dart';
import 'package:rehabox/src/models/Coupon/coupon.dart';

class CouponRESTDataSource extends RESTDataSource<Coupon> {
  CouponRESTDataSource({
    super.baseUrl = 'https://5ba7-115-73-213-165.ngrok-free.app',
    super.token = '',
  });

  Future<List<Coupon>?> readAvailableCoupons() async {
    try {
      final response = await get('/coupons');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return body['data'].map<Coupon>((e) => Coupon.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<bool> claimCoupon(String id) async {
    try {
      final response = await post('/coupons/$id');
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return false;
  }
}
