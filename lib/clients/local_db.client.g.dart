// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localDbHash() => r'82d4cbbf0b78b1c855bff4d9107ac9fb801a16be';

/// Riverpod provider for creating a local ObjectBox database instance.
///
/// Copied from [localDb].
@ProviderFor(localDb)
final localDbProvider = AutoDisposeFutureProvider<ObjectBoxManager>.internal(
  localDb,
  name: r'localDbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localDbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalDbRef = AutoDisposeFutureProviderRef<ObjectBoxManager>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
