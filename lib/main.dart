import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_starter/clients/local_db.client.dart';
import 'package:flutter_riverpod_starter/core/app_entry.dart';
import 'package:flutter_riverpod_starter/logs/app_provider_observer.dart';
import 'package:stack_trace/stack_trace.dart';

import 'clients/talker.dart';

/// The entry point of the application.
///
/// Initializes the application and runs the root widget.
Future<void> main() async {
  // Ensure that the Flutter binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure that the EasyLocalization is initialized.
  await EasyLocalization.ensureInitialized();

  // Initialize the ObjectBoxManager.
  final objectBox = await ObjectBoxManager.init();

  // Set the error handler for unhandled exceptions.
  FlutterError.onError = (details) => talker.handle(
        details.exception, // The exception that was thrown.
        switch (details.stack) {
          final value? =>
            Trace.from(value).terse, // The stack trace of the exception.
          _ => null, // If no stack trace is available.
        },
        details
            .exceptionAsString(), // The string representation of the exception.
      );

  // Run the application using the root widget.
  runApp(
    ProviderScope(
      // Override the localDbProvider with the initialized ObjectBoxManager.
      overrides: [localDbProvider.overrideWithValue(objectBox)],
      // Add an observer to track changes in the ProviderScope.
      observers: [AppProviderObserver(talker)],
      child: EasyLocalization(
        // Define the supported locales for the application.
        supportedLocales: [Locale('en'), Locale('fr')],
        // Set the path to the translation files.
        path: 'assets/translations',
        // Set the fallback locale if the current locale is not supported.
        fallbackLocale: Locale('en'),
        // Set the root widget for the application.
        child: AppEntry(),
      ),
    ),
  );
}
