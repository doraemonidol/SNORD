import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rehabox/src/data_sources/restful/rest_data_source.dart';
import 'package:rehabox/src/models/models.dart' show User;

class UserRESTDataSource extends RESTDataSource<User> {
  UserRESTDataSource({this.url = 'https://5ba7-115-73-213-165.ngrok-free.app'});

  final String url;

  @override
  String get baseUrl => url;

  @override
  Future<User> create(User model) async {
    throw UnimplementedError();
  }

  @override
  Future<User?> read(String id) async {
    try {
      final response = await get('/user');
      debugPrint('Response: ${response.body}');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return User.fromJson(body['data'] as Map<String, dynamic>);
      }
      debugPrint('Error: ${response.statusCode}');
      return null;
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  @override
  Future<List<User>> readAll() {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<User> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<User> update(User model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
