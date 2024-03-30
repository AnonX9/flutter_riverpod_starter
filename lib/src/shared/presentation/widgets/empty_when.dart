import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_starter/clients/talker.dart';

import 'started_when.dart';

/// Extension method for handling different states of an AsyncValue<T>.
extension StandardWhen<T> on AsyncValue<T> {
  /// Widget to display when AsyncValue is empty.
  ///
  /// [data]: Widget to build when data is available.
  /// [skipLoadingOnReload]: Whether to skip loading widget on reload.
  /// [skipLoadingOnRefresh]: Whether to skip loading widget on refresh.
  /// [skipError]: Whether to skip error widget.
  Widget emptyWhen({
    required Widget Function(T data) data,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
  }) =>
      standardWhen(
        data: data,
        loading: SizedBox.shrink, // Widget to show when loading.
        error: (error, stackTrace) {
          talker.error("An error occurred", error, stackTrace); // Logging
          return const SizedBox.shrink();
        }, // Widget to show on error.
        skipError: skipError,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        skipLoadingOnReload: skipLoadingOnReload,
      );
}
