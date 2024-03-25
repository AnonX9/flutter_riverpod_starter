import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_starter/router/router.dart';
import 'package:flutter_riverpod_starter/theme/dark_theme.dart';
import 'package:flutter_riverpod_starter/theme/light_theme.dart';

import '../l10n/gen/app_localizations.dart';

/// Widget representing the entry point of the application.
class AppEntry extends ConsumerWidget {
  /// Constructs the AppEntry widget.
  const AppEntry({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
