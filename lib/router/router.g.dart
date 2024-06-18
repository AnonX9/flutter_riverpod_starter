// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'eb8fd8a23f8de0ae0f09f08f3713c2992508dfd1';

/// Riverpod provider for creating and configuring the GoRouter instance.
///
/// This provider creates and configures a [GoRouter] instance. It sets up the
/// initial location of the router and adds a [TalkerRouteObserver] to observe
/// route changes. The routes are defined in the `config.routes.dart` file.
/// The [GoRouter] instance is returned by this provider and can be accessed
/// using the `ref.watch` function.
///
/// Copied from [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
String _$initialLocationHash() => r'd728fe399ea383d7607a72ba504a8d4b021c0a48';

/// Riverpod provider for determining the initial location of the router.
///
/// Copied from [initialLocation].
@ProviderFor(initialLocation)
final initialLocationProvider = AutoDisposeProvider<String>.internal(
  initialLocation,
  name: r'initialLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$initialLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InitialLocationRef = AutoDisposeProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
