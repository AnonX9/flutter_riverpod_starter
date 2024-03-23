import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod_starter/clients/talker.dart';

/// A class to handle Dio errors and parse HTTP responses.
class DioExceptionHandler {
  /// Handle Dio errors and return a formatted error message.
  static String handleError(DioException error) {
    if (error.type == DioExceptionType.cancel) {
      return 'Request cancelled';
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return 'Connection timeout';
    } else if (error.type == DioExceptionType.badResponse) {
      if (error.response!.statusCode == 401) {
        return 'Unauthorized: Please login again';
      } else if (error.response!.statusCode == 404) {
        return 'Not found';
      } else if (error.response!.statusCode == 500) {
        return 'Internal server error';
      } else {
        return 'Error ${error.response!.statusCode}: ${error.response!.statusMessage}';
      }
    } else {
      return 'Network error';
    }
  }

  /// Parse the HTTP response body into a dynamic map.
  static dynamic parseResponseBody(Response response) {
    try {
      final Map<String, dynamic> parsed = json.decode(response.data);
      return parsed;
    } catch (e) {
      return response.data;
    }
  }
}

/// Interceptor to handle Dio errors and response parsing.
class DioExceptionInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle Dio errors
    final errorMessage = DioExceptionHandler.handleError(err);
    talker.error('Dio Exception: $errorMessage');

    // Pass the error to the next interceptor
    handler.next(err);
  }
}

/// Interceptor to parse the HTTP response body into a dynamic map.
class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Parse the response body
    final dynamic parsedBody = DioExceptionHandler.parseResponseBody(response);
    talker.info('Parsed Response: $parsedBody');

    // Pass the response to the next interceptor
    handler.next(response);
  }
}
