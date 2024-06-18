// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_check.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityCheckHash() => r'105dfd14dfd7270eea7f8d9d661d3ae509f22b22';

/// A Riverpod provider that creates and manages connectivity checks.
///
/// This provider initializes two instances of `Connectivity` and `InternetConnectionChecker`
/// respectively, and returns a function that performs LAN and WAN connectivity checks. The
/// function takes in two parameters: `lanCheck` and `wanCheck`, which are instances of the
/// `Connectivity` and `InternetConnectionChecker` classes respectively.
///
/// The provider also keeps the provider alive during hot restarts.
///
/// Copied from [connectivityCheck].
@ProviderFor(connectivityCheck)
final connectivityCheckProvider = AutoDisposeProvider<ConnectionCheck>.internal(
  connectivityCheck,
  name: r'connectivityCheckProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityCheckHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectivityCheckRef = AutoDisposeProviderRef<ConnectionCheck>;
String _$connectivityStreamHash() =>
    r'a873f4ba5dd0b9f5a470f7c7aa782041537a9732';

/// A Riverpod provider for a continuous stream of connectivity status.
///
/// This provider watches the [connectivityCheckProvider] for changes and returns
/// the full connectivity status stream.
///
/// Copied from [connectivityStream].
@ProviderFor(connectivityStream)
final connectivityStreamProvider = AutoDisposeStreamProvider<bool>.internal(
  connectivityStream,
  name: r'connectivityStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectivityStreamRef = AutoDisposeStreamProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
