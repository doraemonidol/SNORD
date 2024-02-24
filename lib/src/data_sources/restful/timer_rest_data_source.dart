import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rehabox/src/data_sources/restful/rest_data_source.dart';
import 'package:rehabox/src/models/models.dart' show TimerActivity;

class TimerRESTDataSource extends RESTDataSource<TimerActivity> {
  TimerRESTDataSource({
    super.baseUrl = 'https://5ba7-115-73-213-165.ngrok-free.app',
    super.token = '',
  });

  Future<TimerActivity?> getCurrentTimer() async {
    try {
      final response = await get('/timer');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return TimerActivity.fromJson(body['data'] as Map<String, dynamic>);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<bool> closeCurrentTimer() async {
    try {
      final response = await put('/timer');
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return false;
  }

  Future<TimerActivity?> startNewTimer(Duration duration) async {
    try {
      final response = await post('/timer/${duration.inMilliseconds}');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return TimerActivity.fromJson(body['data'] as Map<String, dynamic>);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<TimerActivity?> recommendGoal() async {
    try {
      final response = await patch('/timer/goal');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return TimerActivity.fromJson(body['data'] as Map<String, dynamic>);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<bool?> isFirstTime() async {
    debugPrint('Checking isFirstTime');
    try {
      final response = await get('/timer/first-time');
      debugPrint('Status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return body['data'] as bool;
      }
      await Future.delayed(const Duration(seconds: 3), () {});
      return true;
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
