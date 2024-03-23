import 'package:flutter/material.dart';
import 'package:flutter_riverpod_starter/src/home/presentation/home_page.dart';
import 'package:go_router/go_router.dart';

import '../src/splash/presentation/pages/splash_page.dart';

part 'config.routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage(title: 'Flutter Demo');
  }
}

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}
