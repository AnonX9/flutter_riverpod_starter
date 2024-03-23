import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'started_when.dart';

extension StandardWhen<T> on AsyncValue<T> {
  Widget emptyWhen({
    required Widget Function(T data) data,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
  }) =>
      standardWhen(
        data: data,
        loading: SizedBox.shrink,
        // TODO logging
        error: (error, stackTrace) => const SizedBox.shrink(),
        skipError: skipError,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        skipLoadingOnReload: skipLoadingOnReload,
      );
}
