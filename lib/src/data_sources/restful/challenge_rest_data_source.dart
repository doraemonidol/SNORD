import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rehabox/src/data_sources/restful/rest_data_source.dart';
import 'package:rehabox/src/models/models.dart' show Challenge;

class ChallengeRESTDataSource extends RESTDataSource<Challenge> {
  ChallengeRESTDataSource({
    super.baseUrl = 'https://5ba7-115-73-213-165.ngrok-free.app',
    super.token = '',
  });

  Future<List<Challenge>?> readAvailableChallenges() async {
    try {
      final response = await get('/challenges');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return body['data']
            .map<Challenge>((e) => Challenge.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<List<Challenge>?> readActiveChallenges() async {
    try {
      final response = await get('/challenges/active');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return body['data']
            .map<Challenge>((e) => Challenge.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<bool> joinChallenge(String id) async {
    try {
      final response = await post('/challenges/$id');
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return false;
  }
}
