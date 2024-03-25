import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_check.provider.g.dart';

/// Typedef for the connection check function.
typedef ConnectionCheck = ({
  Connectivity lanCheck,
  InternetConnectionChecker wanCheck
});

/// A Riverpod provider that creates and manages connectivity checks.
@riverpod
ConnectionCheck connectivityCheck(ConnectivityCheckRef ref) {
  // Keep the provider alive during hot restarts
  ref.keepAlive();

  // Initialize LAN and WAN connectivity check instances
  final lanConnectivity = Connectivity();
  final wanConnectivity = InternetConnectionChecker.createInstance();

  // Return the connection check function with LAN and WAN checks
  return (lanCheck: lanConnectivity, wanCheck: wanConnectivity);
}

/// A Riverpod provider for a continuous stream of connectivity status.
@riverpod
Stream<bool> connectivityStream(ConnectivityStreamRef ref) {
  // Watch the connection check provider for changes
  final client = ref.watch(connectivityCheckProvider);

  // Return the full connectivity status stream
  return client.fullConnectivityStream;
}

/// Extension on ConnectionCheck for additional connectivity check methods.
extension ConnectionCheckExtension on ConnectionCheck {
  /// Asynchronously checks the full connectivity status including LAN and WAN.
  Future<bool> checkFullConnectivity() async {
    final lanConnectionStatus = await lanCheck.checkConnectivity();
    if (lanConnectionStatus == ConnectivityResult.none) return false;

    final wanConnectionStatus = await wanCheck.hasConnection;
    return wanConnectionStatus;
  }

  /// Generates a continuous stream of full connectivity status including LAN and WAN.
  Stream<bool> get fullConnectivityStream async* {
    await for (final lanChange in lanCheck.onConnectivityChanged) {
      if (lanChange == ConnectivityResult.none) {
        yield false; // No LAN connection, yield false
        continue;
      }

      final wanChange = wanCheck.onStatusChange.map(
        (event) => event == InternetConnectionStatus.connected,
      );

      yield* wanChange; // Yield WAN connection status changes
    }
  }
}
