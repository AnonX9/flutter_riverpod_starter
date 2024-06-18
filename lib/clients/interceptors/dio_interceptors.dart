import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod_starter/clients/talker.dart';

/// A class to handle Dio errors and parse HTTP responses.
class DioExceptionHandler {
  /// Handle Dio errors and return a formatted error message.
  ///
  /// The error parameter contains information about the type of error that occurred.
  /// The status code and status message of the response can be accessed through
  /// the error parameter if the error type is `DioExceptionType.badResponse`.
  ///
  /// Returns a formatted error message based on the type of error that occurred.
  static String handleError(DioException error) {
    // Handle cancellation error
    if (error.type == DioExceptionType.cancel) {
      return 'Request cancelled';
    }
    // Handle connection timeout error
    else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return 'Connection timeout';
    }
    // Handle bad response error
    else if (error.type == DioExceptionType.badResponse) {
      // Get the status code and status message from the response
      final statusCode = error.response!.statusCode;
      final statusMessage = error.response!.statusMessage;

      // Return a formatted error message based on the status code
      if (statusCode == 401) {
        return 'Unauthorized: Please login again';
      } else if (statusCode == 404) {
        return 'Not found';
      } else if (statusCode == 500) {
        return 'Internal server error';
      } else {
        return 'Error $statusCode: $statusMessage';
      }
    }
    // Handle other types of errors
    else {
      return 'Network error';
    }
  }

  /// Parses the HTTP response body into a dynamic map.
  ///
  /// The response body is expected to be in JSON format. If the parsing fails,
  /// the raw response body is returned.
  ///
  /// Returns a map of key-value pairs if the parsing is successful, otherwise
  /// returns the raw response body.
  static dynamic parseResponseBody(Response response) {
    try {
      // Parse the response body into a map
      final Map<String, dynamic> parsed = json.decode(response.data);
      return parsed;
    } catch (e) {
      // If the parsing fails, return the raw response body
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
