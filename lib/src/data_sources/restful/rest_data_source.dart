import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rehabox/src/models/models.dart' show Model;

/// Abstract class for RESTful data sources
/// [T] is the model type to ensure type safety
abstract class RESTDataSource<T extends Model> {
  RESTDataSource();

  final _httpClient = http.Client();

  /// Wrapper for all http methods
  /// In subclasses, use this method to make http requests
  /// by calling this.get(), this.post(), this.put(), this.patch() or this.delete()
  /// [_extractDomain] is used to extract the domain from the [baseUrl]
  /// For example: if [baseUrl] is "https://example.com/api/v1",
  /// then the domain is "https://example.com"
  /// [endpoint] is the path to the resource
  Future<http.Response> get(String endpoint,
      {Map<String, String>? headers}) async {
    final res = await _httpClient.get(
      Uri.parse("${_extractDomain(baseUrl)}$endpoint"),
      headers: headers,
    );
    debugPrint('Response: ${res.body}');
    return res;
  }

  Future<http.Response> post(String endpoint,
          {Map<String, String>? headers, dynamic body}) =>
      _httpClient.post(Uri.parse("${_extractDomain(baseUrl)}$endpoint"),
          headers: headers, body: body);

  Future<http.Response> put(String endpoint,
          {Map<String, String>? headers, dynamic body}) =>
      _httpClient.put(Uri.parse("${_extractDomain(baseUrl)}$endpoint"),
          headers: headers, body: body);

  Future<http.Response> patch(String endpoint,
          {Map<String, String>? headers, dynamic body}) =>
      _httpClient.patch(Uri.parse("${_extractDomain(baseUrl)}$endpoint"),
          headers: headers, body: body);

  Future<http.Response> delete(String endpoint,
          {Map<String, String>? headers}) =>
      _httpClient.delete(Uri.parse("${_extractDomain(baseUrl)}$endpoint"),
          headers: headers);

  String _extractDomain(String url) {
    final uri = Uri.parse(url);
    return '${uri.scheme}://${uri.host}:${uri.port}';
  }

  String get baseUrl;

  Future<T> create(T model);

  Future<T?> read(String id);

  Future<List<T>> readAll();

  Future<T> update(T model);

  Future<T> remove(String id);
}
