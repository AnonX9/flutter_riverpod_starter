import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../clients/local_db.client.dart';

part 'splash_loading.provider.g.dart';

/// Riverpod provider for handling splash screen loading logic.
@riverpod
FutureOr<void> splashLoading(SplashLoadingRef ref) {
  return ref.watch(localDbProvider);
}
