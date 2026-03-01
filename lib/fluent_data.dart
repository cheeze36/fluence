import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

/// A simple, imperative HTTP client for Fluent Flutter.
/// No external dependencies required (uses dart:io).
class FluentData extends ChangeNotifier {
  // Singleton
  static final FluentData _instance = FluentData._internal();
  factory FluentData() => _instance;
  FluentData._internal();

  final HttpClient _client = HttpClient();
  String _baseUrl = '';

  FluentData setBaseUrl(String url) {
    _baseUrl = url;
    return this;
  }

  /// Perform a GET request.
  Future<dynamic> get(String path) async {
    try {
      final uri = Uri.parse(_baseUrl + path);
      final request = await _client.getUrl(uri);
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(body);
      } else {
        throw HttpException('GET failed: ${response.statusCode} - $body');
      }
    } catch (e) {
      if (kDebugMode) print('FluentData Error: $e');
      rethrow;
    }
  }

  /// Perform a POST request.
  Future<dynamic> post(String path, dynamic data) async {
    try {
      final uri = Uri.parse(_baseUrl + path);
      final request = await _client.postUrl(uri);
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(jsonEncode(data)));
      
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(body);
      } else {
        throw HttpException('POST failed: ${response.statusCode} - $body');
      }
    } catch (e) {
      if (kDebugMode) print('FluentData Error: $e');
      rethrow;
    }
  }

  /// Perform a PUT request.
  Future<dynamic> put(String path, dynamic data) async {
    try {
      final uri = Uri.parse(_baseUrl + path);
      final request = await _client.putUrl(uri);
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(jsonEncode(data)));
      
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(body);
      } else {
        throw HttpException('PUT failed: ${response.statusCode} - $body');
      }
    } catch (e) {
      if (kDebugMode) print('FluentData Error: $e');
      rethrow;
    }
  }

  /// Perform a DELETE request.
  Future<dynamic> delete(String path) async {
    try {
      final uri = Uri.parse(_baseUrl + path);
      final request = await _client.deleteUrl(uri);
      
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(body);
      } else {
        throw HttpException('DELETE failed: ${response.statusCode} - $body');
      }
    } catch (e) {
      if (kDebugMode) print('FluentData Error: $e');
      rethrow;
    }
  }
}

/// A global alias for easier access.
final FluentData FData = FluentData();
