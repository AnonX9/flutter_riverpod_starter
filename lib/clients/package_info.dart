import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info.g.dart';

/// Provider for retrieving package information.
///
/// This provider provides a [Future] that resolves to a [PackageInfo] object
/// containing information about the package. The provider is asynchronous, and
/// it retrieves the package information from the platform.
///
/// The [PackageInfo] object contains the following information about the package:
///  - [appName] - The name of the application.
///  - [packageName] - The unique identifier for the application.
///  - [version] - The version number of the application.
///  - [buildNumber] - The build number of the application.
///  - [buildSignature] - The signature of the application's build.
///
/// See also:
///  - [PackageInfo.fromPlatform] - Retrieves the package information from the platform.
@riverpod

/// Retrieves the package information from the platform.
///
/// Returns a [Future] that resolves to a [PackageInfo] object containing information about the package.
Future<PackageInfo> packageInfo(PackageInfoRef ref) {
  // Return a future or package information retrieved from the platform.
  return PackageInfo.fromPlatform();
}
