import 'dart:convert';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/logger_service.dart';
import 'package:http/http.dart';

class NetworkCaller {
  final LoggerService loggerServices;

  NetworkCaller({required this.loggerServices});

  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      final Uri uri = Uri.parse(url);
      loggerServices.requestLog(url, {}, {}, '');
      final Response response = await get(
        uri,
        headers: {'token': ''},
      );
      if (response.statusCode == 200) {
        loggerServices.responseLog(
            url, response.statusCode, response.body, response.headers, true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodedBody,
        );
      } else {
        loggerServices.responseLog(
            url, response.statusCode, response.body, response.headers, false);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      loggerServices.responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      final Uri uri = Uri.parse(url);
      loggerServices.requestLog(url, {}, body ?? {}, '');
      final Response response = await post(
        uri,
        headers: {
          'token': '',
          'content-type': 'application/json',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        loggerServices.responseLog(
            url, response.statusCode, response.body, response.headers, true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodedBody,
        );
      } else {
        loggerServices.responseLog(
            url, response.statusCode, response.body, response.headers, false);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      loggerServices.responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}
