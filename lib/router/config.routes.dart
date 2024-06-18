import 'package:flutter/material.dart';
import 'package:flutter_riverpod_starter/src/home/presentation/home_page.dart';
import 'package:go_router/go_router.dart';

import '../src/splash/presentation/pages/splash_page.dart';

part 'config.routes.g.dart';

/// Configuration file for routes.
///
/// This file defines the routes for the application and associates them with
/// the corresponding classes. It also provides a way to declare the routes
/// for the application.
///
/// The routes declared in this file are:
///
/// - '/': This route is associated with the [HomeRoute] class and is used as
///   the root route for the application.

/// TypedGoRoute for the home route of the application.
@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CounterApp();
  }
}

/// TypedGoRoute for the splash route of the application.
@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}
