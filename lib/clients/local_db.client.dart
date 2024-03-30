import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../objectbox.g.dart';

part 'local_db.client.g.dart';

/// Manages the ObjectBox instance and provides access to entity boxes.
class ObjectBoxManager {
  late final Store _store;

  ObjectBoxManager._create(this._store);

  /// Initializes ObjectBox and returns an instance of ObjectBoxManager.
  static Future<ObjectBoxManager> init() async {
    final docsDir = await path_provider.getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-frn"));
    return ObjectBoxManager._create(store);
  }

  /// Gets a box for a specified data model entity type [T].
  ///
  /// Use this method to access the ObjectBox box for a specific data model entity.
  /// For example:
  /// ```
  /// final noteBox = objectBoxManager.getBox<Note>();
  /// ```
  Box<T> getBox<T extends Object>() {
    return _store.box<T>();
  }
}

//TODO: Should be tested
/// Riverpod provider for creating a local ObjectBox database instance.
@riverpod
ObjectBoxManager localDb(LocalDbRef ref) {
  throw UnimplementedError("DO NOT access this provider directly.");
}
