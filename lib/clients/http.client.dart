import 'package:dio/dio.dart';
import 'package:flutter_riverpod_starter/clients/interceptors/dio_interceptors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

import 'talker.dart';

part 'http.client.g.dart';

/// Base URL of our API service
const baseUrl = 'https://my-api.com'; // TODO: Add api base url

/// API key obtained from environment variables
const apiKey = String.fromEnvironment('API_KEY');

/// Riverpod provider for creating an HTTP client using Dio.
@riverpod
Dio httpClient(HttpClientRef ref, {bool enableLogging = true}) {
  // Configure base options for Dio client
  final options =
      BaseOptions(baseUrl: baseUrl, queryParameters: {'key': apiKey});

  // Create Dio client instance with configured options
  final client = Dio(options);

  // Register a cleanup function to close the client when no longer needed
  ref.onDispose(client.close);

  // Add TalkerDioLogger interceptor if logging is enabled
  if (enableLogging) client.interceptors.add(TalkerDioLogger(talker: talker));

  client.interceptors.add(DioExceptionInterceptor());

  client.interceptors.add(ResponseInterceptor());

  // Return the configured Dio client
  return client;
}
