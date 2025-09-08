import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../exception/app_exception.dart';
import 'base_api_services.dart';
/// Class for handling network API requests.

class NetworkApiService implements BaseApiServices {

  /// Sends a GET request to the specified [url] and returns the response.
 ///throws exception
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response =
      await http.get(Uri.parse(url)).timeout(Duration(seconds: 20));

      responseJson = returnResponse(response);
    }on SocketException{
     throw NoInternetException();
    }on TimeoutException{
      throw FetchDataException("Network Request Timeout");
    }
    if(kDebugMode){
      print(responseJson);
    }
    return responseJson;
  }


  /// Parses the [response] and returns the corresponding JSON data.
  ///
  /// Throws a [FetchDataException] with the appropriate error message if the response status code is not successful.
  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occurred while communicating with server');
    }
  }
}


