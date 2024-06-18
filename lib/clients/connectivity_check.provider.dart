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

/// A Riverpod provider that creates and manages connectivity checks.
///
/// This provider initializes two instances of `Connectivity` and `InternetConnectionChecker`
/// respectively, and returns a function that performs LAN and WAN connectivity checks. The
/// function takes in two parameters: `lanCheck` and `wanCheck`, which are instances of the
/// `Connectivity` and `InternetConnectionChecker` classes respectively.
///
/// The provider also keeps the provider alive during hot restarts.
@riverpod
ConnectionCheck connectivityCheck(ConnectivityCheckRef ref) {
  // Keep the provider alive during hot restarts
  ref.keepAlive();

  // Initialize LAN and WAN connectivity check instances
  final lanConnectivity =
      Connectivity(); // Initialize LAN connectivity check instance
  final wanConnectivity = InternetConnectionChecker
      .createInstance(); // Initialize WAN connectivity check instance

  // Return the connection check function with LAN and WAN checks
  return (
    /// The `Connectivity` instance for LAN connectivity check.
    ///
    /// This instance is used to check the LAN (Local Area Network) connectivity status.
    /// It provides methods to check the LAN connectivity status and listen for changes
    /// in the LAN connectivity status.
    lanCheck: lanConnectivity,

    /// The `InternetConnectionChecker` instance for WAN connectivity check.
    ///
    /// This instance is used to check the WAN (Wide Area Network) connectivity status.
    /// It provides methods to check the WAN connectivity status and listen for changes
    /// in the WAN connectivity status.
    wanCheck: wanConnectivity,
  );
}

/// A Riverpod provider for a continuous stream of connectivity status.
@riverpod

/// A Riverpod provider for a continuous stream of connectivity status.
///
/// This provider watches the [connectivityCheckProvider] for changes and returns
/// the full connectivity status stream.
@riverpod
Stream<bool> connectivityStream(ConnectivityStreamRef ref) {
  // Watch the connection check provider for changes
  //
  // The `ref.watch` function takes in a provider and returns the latest value
  // emitted by that provider. In this case, we pass in the [connectivityCheckProvider]
  // to get the latest value of the [ConnectionCheck] object.
  final client = ref.watch(connectivityCheckProvider);

  // Return the full connectivity status stream
  //
  // The `fullConnectivityStream` getter on the [ConnectionCheck] object returns
  // a continuous stream of full connectivity status including LAN and WAN.
  return client.fullConnectivityStream;
}

/// Extension on ConnectionCheck for additional connectivity check methods.
/// Extension on [ConnectionCheck] for additional connectivity check methods.
extension ConnectionCheckExtension on ConnectionCheck {
  /// Asynchronously checks the full connectivity status including LAN and WAN.
  ///
  /// This method checks the LAN connection status and returns `false` if there is no
  /// LAN connection. Otherwise, it checks the WAN connection status and returns
  /// the result of the WAN connection check.
  Future<bool> checkFullConnectivity() async {
    // Check the LAN connection status
    final lanConnectionStatus = await lanCheck.checkConnectivity();

    // If there is no LAN connection, return false
    if (lanConnectionStatus == ConnectivityResult.none) {
      return false;
    }

    // Check the WAN connection status
    final wanConnectionStatus = await wanCheck.hasConnection;

    // Return the result of the WAN connection check
    return wanConnectionStatus;
  }

  /// Generates a continuous stream of full connectivity status including LAN and WAN.
  ///
  /// This getter returns a continuous stream of full connectivity status. It listens
  /// for changes in the LAN connection status and WAN connection status. If there is
  /// no LAN connection, it yields `false`. Otherwise, it yields the WAN connection
  /// status changes.
  Stream<bool> get fullConnectivityStream async* {
    // Listen for changes in the LAN connection status
    await for (final lanChange in lanCheck.onConnectivityChanged) {
      // If there is no LAN connection, yield false
      if (lanChange == ConnectivityResult.none) {
        yield false;
        continue;
      }

      // Listen for changes in the WAN connection status and map the event to a boolean
      final wanChange = wanCheck.onStatusChange.map(
        (event) => event == InternetConnectionStatus.connected,
      );

      // Yield the WAN connection status changes
      yield* wanChange;
    }
  }
}
