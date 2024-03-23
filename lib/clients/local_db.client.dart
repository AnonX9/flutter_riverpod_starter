import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../objectbox.g.dart';

part 'local_db.client.g.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await path_provider.getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, "obx-example"));
    return ObjectBox._create(store);
  }
}

//TODO: Should be tested
/// Riverpod provider for creating a local ObjectBox database instance.
@riverpod
Future<ObjectBox> localDb(LocalDbRef ref) async {
  final objectBox = await ObjectBox.create();
  return objectBox;
}

/*
@riverpod
Future<ObjectBox> localDb(LocalDbRef ref) async {
  // Get the application documents directory
  final dir = await path_provider.getApplicationDocumentsDirectory();

  /// The Store of this app.
  late final Store store;

  // Initialize ObjectBox database with specified schema and options
  final boxStore = await BoxStore.open(
    directory: dir.path,
    model: ObjectBoxModel()..registerEntity(LocalCurrentWeatherModel),
    maxDBSizeInKB: 2 * 1024 * 1024, // 2 MB (ObjectBox uses KB for maxDBSize)
  );

  return boxStore;
}
*/
