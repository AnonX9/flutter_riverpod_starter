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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        scaffoldMessengerKey: networkSnackbarKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
