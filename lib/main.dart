import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_starter/logs/app_provider_observer.dart';
import 'package:stack_trace/stack_trace.dart';

import 'clients/talker.dart';
import 'core/app_entry.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize ObjectBoxManager

  FlutterError.onError = (details) => talker.handle(
        details.exception,
        switch (details.stack) {
          final value? => Trace.from(value).terse,
          _ => null,
        },
        details.exceptionAsString(),
      );

  runApp(
    ProviderScope(
      observers: [AppProviderObserver(talker)],
      child: const AppEntry(),
    ),
  );
}
