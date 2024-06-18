import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../objectbox.g.dart';

part 'local_db.client.g.dart';

/// Manages the ObjectBox instance and provides access to entity boxes.
/// Manages the ObjectBox instance and provides access to entity boxes.
///
/// This class handles the initialization and provides methods to access
/// ObjectBox boxes for specific data model entities.
class ObjectBoxManager {
  /// ObjectBox store instance.
  late final Store _store;

  /// Creates a new instance of ObjectBoxManager.
  ///
  /// This constructor is private and should only be called by the [init]
  /// method.
  ObjectBoxManager._create(this._store);

  /// Initializes ObjectBox and returns an instance of ObjectBoxManager.
  ///
  /// This method creates a new directory for the ObjectBox database and opens
  /// a store. It returns a Future that completes with an instance of
  /// ObjectBoxManager.
  static Future<ObjectBoxManager> init() async {
    // Get the application documents directory.
    final docsDir = await path_provider.getApplicationDocumentsDirectory();
    // Join the documents directory path with 'obx-frn' to create the database
    // directory path.
    final dbDirPath = p.join(docsDir.path, "obx-dir");
    // Open a store in the database directory.
    final store = await openStore(directory: dbDirPath);
    // Create and return an instance of ObjectBoxManager.
    return ObjectBoxManager._create(store);
  }

  /// Gets a box for a specified data model entity type [T].
  ///
  /// Use this method to access the ObjectBox box for a specific data model
  /// entity. For example:
  ///
}

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
@riverpod
ObjectBoxManager localDb(LocalDbRef ref) {
  throw UnimplementedError("DO NOT access this provider directly.");
}
