import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_starter/router/router.dart';
import 'package:flutter_riverpod_starter/utils/sizer/sizer.dart';

import '../constants.dart';
import '../theme/dark_theme.dart';
import '../theme/light_theme.dart';

/// Widget representing the entry point of the application.
class AppEntry extends ConsumerWidget {
  /// Constructs the AppEntry widget.
  const AppEntry({super.key});

  /// Builds the MaterialApp widget for the application.
  ///
  /// This function is responsible for constructing the main application widget.
  /// It uses the [Sizer] widget to ensure that the application is responsive to
  /// different screen sizes. The [MaterialApp.router] constructor is used to
  /// create a MaterialApp with the specified router configuration. The
  /// [router] is obtained from the [routerProvider] using the [watch] method
  /// of the [WidgetRef]. The [localizationsDelegates], [supportedLocales], and
  /// [locale] properties are obtained from the [BuildContext].
  ///
  /// Returns a [Widget] representing the root of the application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the router from the routerProvider.
    final router = ref.watch(routerProvider);

    // Return the main application widget.
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        // Specify the router configuration.
        routerConfig: router,

        // Set the title of the application.
        title: 'Flutter Demo',

        // Set the light theme for the application.
        theme: lightTheme,

        // Set the dark theme for the application.
        darkTheme: darkTheme,

        // Set the key for the scaffold messenger that will serve for connectivity check.
        scaffoldMessengerKey: networkSnackbarKey,

        // Set the localization delegates for the application.
        localizationsDelegates: context.localizationDelegates,

        // Set the supported locales for the application.
        supportedLocales: context.supportedLocales,

        // Set the locale for the application.
        locale: context.locale,
      ),
    );
  }
}
