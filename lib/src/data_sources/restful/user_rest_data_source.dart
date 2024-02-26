import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rehabox/src/data_sources/restful/rest_data_source.dart';
import 'package:rehabox/src/models/NicontineConsumption/nicotine_consumption.dart';
import 'package:rehabox/src/models/models.dart' show User;

class UserRESTDataSource extends RESTDataSource<User> {
  UserRESTDataSource({
    super.baseUrl = 'https://cbe2-113-22-113-75.ngrok-free.app',
    super.token = '',
  });

  Future<User?> add() async {
    try {
      final response = await get('/');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return User.fromJson(body['data'] as Map<String, dynamic>);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<User?> read() async {
    try {
      final response = await get('/user');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return User.fromJson(body['data'] as Map<String, dynamic>);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<List<NicotineConsumption>?> nicotineConsumptionDaily(
      DateTime date) async {
    try {
      final response = await get(
          '/nicotine/daily?day=${date.day}&month=${date.month}&year=${date.year}');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return body['data']
            .map<NicotineConsumption>((e) => NicotineConsumption.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<List<NicotineConsumption>?> nicotineConsumptionWeekly(
    DateTime endDate,
  ) async {
    try {
      final response = await get(
          '/nicotine/daily?day=${endDate.day}&month=${endDate.month}&year=${endDate.year}');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return body['data']
            .map<NicotineConsumption>((e) => NicotineConsumption.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<List<NicotineConsumption>?> nicotineConsumptionMonthly(
    DateTime date,
  ) async {
    try {
      final response =
          await get('/nicotine/daily?month=${date.month}&year=${date.year}');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return body['data']
            .map<NicotineConsumption>((e) => NicotineConsumption.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<bool> addNicotineConsumption(
    NicotineConsumption nicotineConsumption,
  ) async {
    try {
      final response = await post(
        '/nicotine/${nicotineConsumption.value}?metric=${nicotineConsumption.metric}',
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return false;
  }
}
