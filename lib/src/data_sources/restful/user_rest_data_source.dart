import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rehabox/src/data_sources/restful/rest_data_source.dart';
import 'package:rehabox/src/models/models.dart' show User;

class UserRESTDataSource extends RESTDataSource<User> {
  UserRESTDataSource({
    super.baseUrl = 'https://5ba7-115-73-213-165.ngrok-free.app',
    super.token = '',
  });

  Future<User?> read(String id) async {
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
}
