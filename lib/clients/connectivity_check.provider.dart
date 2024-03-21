import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_check.provider.g.dart';

/// Typedef for the connection check function.
typedef ConnectionCheck = ({Connectivity lanCheck, InternetConnectionChecker wanCheck});

/// Riverpod provider for connection checking.
@riverpod
ConnectionCheck connectivityCheck(ConnectivityCheckRef ref) {
  // Keep the provider alive during hot restarts
  ref.keepAlive();

  // Initialize connectivity check instances
  final lanConnectivity = Connectivity();
  final wanConnectivity = InternetConnectionChecker.createInstance();

  // Return the connection check function
  return (lanCheck: lanConnectivity, wanCheck: wanConnectivity);
}

/// Riverpod provider for connection status stream.
@riverpod
Stream<bool> connectivityStream(ConnectivityStreamRef ref) {
  // Watch the connection check provider for changes
  final client = ref.watch(connectivityCheckProvider);

  // Return the full connectivity status stream
  return client.fullConnectivityStream;
}

/// Extension on ConnectionCheck for additional connectivity check methods.
extension ConnectionCheckExtension on ConnectionCheck {
  /// Asynchronous method to check full connectivity status.
  Future<bool> checkFullConnectivity() async {
    final lanConnectionStatus = await lanCheck.checkConnectivity();
    if (lanConnectionStatus == ConnectivityResult.none) return false;

    final wanConnectionStatus = await wanCheck.hasConnection;
    return wanConnectionStatus;
  }

  /// Asynchronous stream generator for full connectivity status.
  Stream<bool> get fullConnectivityStream async* {
    await for (final lanChange in lanCheck.onConnectivityChanged) {
      if (lanChange == ConnectivityResult.none) {
        yield false;
        continue;
      }

      final wanChange = wanCheck.onStatusChange.map(
            (event) => event == InternetConnectionStatus.connected,
      );

      yield* wanChange;
    }
  }
}
