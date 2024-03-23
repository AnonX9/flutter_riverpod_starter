import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'standard_error_widget.dart';
import 'standard_loading_widget.dart';

/// Extension method for handling different states of an AsyncValue<T>.
extension StandardWhen<T> on AsyncValue<T> {
  /// Widget builder for handling different states of an AsyncValue<T>.
  ///
  /// Use this method to display different widgets based on the state of an AsyncValue<T>.
  ///
  /// Parameters:
  /// - [data]: Widget builder for data state. This widget will be displayed when data is available.
  /// - [loading]: Widget builder for loading state. This widget will be displayed when data is loading.
  /// - [error]: Widget builder for error state. This widget will be displayed when an error occurs.
  /// - [skipLoadingOnReload]: Whether to skip the loading widget when the data is reloaded.
  /// - [skipLoadingOnRefresh]: Whether to skip the loading widget when the data is refreshed.
  /// - [skipError]: Whether to skip the error widget.
  ///
  /// Returns:
  /// A widget based on the current state of the AsyncValue<T>.
  Widget standardWhen({
    required Widget Function(T data) data,
    Widget Function() loading = StandardLoadingWidget.new,
    Widget Function(Object error, StackTrace stackTrace) error =
        StandardErrorWidget.new,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
  }) =>
      when(
        data: data,
        loading: loading,
        error: error,
        skipError: skipError,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        skipLoadingOnReload: skipLoadingOnReload,
      );
}
