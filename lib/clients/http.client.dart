import 'package:dio/dio.dart';
import 'package:flutter_riverpod_starter/clients/interceptors/dio_interceptors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

import 'talker.dart';

part 'http.client.g.dart';

/// This file contains the HTTP client provider using Dio.

/// Base URL of our API service.
///
/// This value is obtained from the environment variables.
const baseUrl = String.fromEnvironment('BASE_URL');

/// API key obtained from environment variables.
///
/// This value is obtained from the environment variables.
const apiKey = String.fromEnvironment('API_KEY');

/// Riverpod provider for creating an HTTP client using Dio.
///
/// This provider configures the base options for the Dio client,
/// creates the client instance with the configured options,
/// registers a cleanup function to close the client when no longer needed,
/// adds a TalkerDioLogger interceptor if logging is enabled,
/// adds DioExceptionInterceptor and ResponseInterceptor interceptors,
/// and returns the configured Dio client.
@riverpod
Dio httpClient(HttpClientRef ref, {bool enableLogging = true}) {
  // Configure base options for Dio client.
  final options = BaseOptions(
    baseUrl: baseUrl,
    queryParameters: {'key': apiKey},
  );

  // Create Dio client instance with configured options.
  final client = Dio(options);

  // Register a cleanup function to close the client when no longer needed.
  ref.onDispose(client.close);

  // Add TalkerDioLogger interceptor if logging is enabled.
  if (enableLogging) {
    client.interceptors.add(TalkerDioLogger(talker: talker));
  }

  // Add DioExceptionInterceptor interceptor.
  client.interceptors.add(DioExceptionInterceptor());

  // Add ResponseInterceptor interceptor.
  client.interceptors.add(ResponseInterceptor());

  // Return the configured Dio client.
  return client;
}
