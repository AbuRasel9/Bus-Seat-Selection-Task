import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'base_api_services.dart';

class NetworkApiService implements BaseApiServices {
  @override
  Future<http.Response> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    try {
      final response =
          await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response;
      } else {
        debugPrint('Failed to load data: ${response.statusCode}');
        throw Exception("Failed to load data");
      }
    }catch (e) {
      throw Exception('Failed to make request: $e');
    }
  }
}
