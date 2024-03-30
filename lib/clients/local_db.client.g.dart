// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localDbHash() => r'ecfda335a75f41d2ca7118fcc4f37fdc39bff5a7';

/// Riverpod provider for creating a local ObjectBox database instance.
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
