import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info.g.dart';

/// Riverpod provider for retrieving package information.
@riverpod
FutureOr<PackageInfo> packageInfo(PackageInfoRef ref) {
  // Return a future or package information retrieved from the platform.
  return PackageInfo.fromPlatform();
}
