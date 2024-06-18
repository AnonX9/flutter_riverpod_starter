import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../clients/talker.dart';
import 'config.routes.dart';

part 'router.g.dart';

/// Riverpod provider for creating and configuring the GoRouter instance.
///
/// This provider creates and configures a [GoRouter] instance. It sets up the
/// initial location of the router and adds a [TalkerRouteObserver] to observe
/// route changes. The routes are defined in the `config.routes.dart` file.
/// The [GoRouter] instance is returned by this provider and can be accessed
/// using the `ref.watch` function.
@riverpod
GoRouter router(RouterRef ref) {
  // Create a global key for the navigator
  final key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

  // Watch the initial location provider for changes
  final initialLocation = ref.watch(initialLocationProvider);

  // Create the GoRouter instance
  final router = GoRouter(
    navigatorKey: key,

    // Add a route observer to observe route changes
    observers: [TalkerRouteObserver(talker)],

    // Set the initial location of the router
    initialLocation: initialLocation,

    // Define the routes for the router
    routes: $appRoutes,
  );

  // Add a cleanup function to dispose the router when no longer needed
  ref.onDispose(router.dispose);

  // Return the GoRouter instance
  return router;
}

/// Riverpod provider for determining the initial location of the router.
@riverpod
String initialLocation(InitialLocationRef ref) => '/splash';
