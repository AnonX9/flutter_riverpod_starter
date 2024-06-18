// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localDbHash() => r'ecfda335a75f41d2ca7118fcc4f37fdc39bff5a7';

/// Creates an instance of [ObjectBoxManager] by accessing the local database.
///
/// This function is a provider for creating a local ObjectBox database instance.
/// It is intended to be used as a dependency injection mechanism to provide
/// an instance of [ObjectBoxManager] to other parts of the application.
///
/// This function throws an [UnimplementedError] with the message "DO NOT access this provider directly."
/// to indicate that this function should not be called directly, but rather through
/// the dependency injection mechanism provided by the framework.
///
/// Returns an instance of [ObjectBoxManager].
///
/// Copied from [localDb].
@ProviderFor(localDb)
final localDbProvider = AutoDisposeProvider<ObjectBoxManager>.internal(
  localDb,
  name: r'localDbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localDbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalDbRef = AutoDisposeProviderRef<ObjectBoxManager>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
