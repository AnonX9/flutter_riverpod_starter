import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_starter/clients/talker.dart';
import 'package:flutter_riverpod_starter/utils/sizer/sizer.dart';

import '../constants.dart';

/// A class responsible for monitoring and managing the connection status.
class ConnectionStatusListener {
  // This creates the single instance by calling the `_internal` constructor
  static final _singleton = ConnectionStatusListener._internal();

  // Private constructor to prevent direct instantiation
  ConnectionStatusListener._internal();

  // This tracks if the "No Internet" snackbar has been shown
  bool hasShownNoInternet = false;

  // Connectivity Plus instance
  final Connectivity _connectivity = Connectivity();

  // This is what's used to retrieve the instance through the app
  static ConnectionStatusListener getInstance() => _singleton;

  // This tracks the current connection status
  bool hasConnection = false;

  // This is how we'll allow subscribing to connection changes
  StreamController<bool> connectionChangeController =
      StreamController<bool>.broadcast();

  // This stream allows us to listen to connection changes
  Stream<bool> get connectionChange => connectionChangeController.stream;

  /// This method is called whenever the connection status changes
  /// It checks the connection status and sends out an update to all listeners
  void _connectionChange(List<ConnectivityResult>? result) {
    checkConnection();
  }

  /// This method checks the connection status
  /// It returns a Future<bool> that will be true if there is a connection and false otherwise
  Future<bool> checkConnection() async {
    // Store the previous connection status
    bool previousConnection = hasConnection;

    try {
      // Try to lookup the IP address of google.com
      final result = await InternetAddress.lookup('google.com');
      // If the IP address is not empty, there is a connection
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      // If there is a SocketException, there is no connection
      hasConnection = false;
    }

    // If the connection status has changed, send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }

  /// This method sets up the connection change listener
  /// It listens to Connectivity Plus's Stream and checks the connection status out of the gate
  Future<void> initialize() async {
    // Listen to Connectivity Plus's Stream
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    // Check the connection status
    await checkConnection();
  }

  /// This method cleans up the connection change listener
  /// It closes the StreamController
  void dispose() {
    connectionChangeController.close();
  }
}

/// Updates the connectivity status and displays a snackbar accordingly.
///
/// This function takes in a [hasConnection] boolean value and a [connectionStatus] object
/// of type [ConnectionStatusListener]. It checks if there is a connection or not and
/// updates the [connectionStatus] accordingly. If there is no connection, it sets
/// [hasShownNoInternet] to true, displays an "Offline !" message, and shows a snackbar
/// with the message "offline". If there is a connection and [hasShownNoInternet] is true,
/// it sets [hasShownNoInternet] to false, displays an "Online !" message, and shows a
/// snackbar with the message "online".
void updateConnectivity(
  dynamic hasConnection,
  ConnectionStatusListener connectionStatus,
) {
  if (!hasConnection) {
    // If there is no connection, set hasShownNoInternet to true and show a snackbar
    connectionStatus.hasShownNoInternet = true;
    talker
        .info("Offline !"); // Log a message indicating that the user is offline
    showSnackBar("offline"); // Show a snackbar with the message "offline"
  } else {
    if (connectionStatus.hasShownNoInternet) {
      // If there is a connection and hasShownNoInternet is true, set hasShownNoInternet to false
      // and show a snackbar
      connectionStatus.hasShownNoInternet = false;
      talker
          .info("Online !"); // Log a message indicating that the user is online
      showSnackBar("online"); // Show a snackbar with the message "online"
    }
  }
}

/// Displays a snackbar with the provided message and styling.
///
/// The [msg] parameter is the message to be displayed in the snackbar.
/// It can be either "online" or "offline".
void showSnackBar(String msg) {
  // Determine if the message is for offline or online status
  bool offline = (msg == "offline");

  // Set the background color and icon based on the status
  MaterialColor? bgColor = offline ? Colors.red : null;
  IconData icon = offline ? Icons.sync_disabled : Icons.sync;

  // Set the text color based on the status
  Color color = offline ? Colors.white : Colors.black;

  // Create the SnackBar with the appropriate styling
  final SnackBar snackBar = SnackBar(
    backgroundColor: bgColor, // Set the background color
    behavior: SnackBarBehavior.floating, // Set the behavior
    margin: EdgeInsets.only(bottom: 40.h), // Set the margin
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the content
      children: [
        Icon(
          // Display the appropriate icon
          icon,
          size: 18,
          color: color,
        ),
        Text(
          // Display the message
          'You are $msg',
          style: TextStyle(color: color),
        ),
      ],
    ),
  );

  // Remove any existing snackbar before displaying the new one
  if (networkSnackbarKey.currentState!.mounted) {
    networkSnackbarKey.currentState?.removeCurrentSnackBar();
  }

  // Show the snackbar
  networkSnackbarKey.currentState?.showSnackBar(snackBar);
}

/// Initializes the listener for no internet connection.
///
/// This function initializes the listener for changes in the internet connection
/// status. It first gets an instance of the [ConnectionStatusListener] using
/// [ConnectionStatusListener.getInstance]. Then it awaits the initialization of
/// the [connectionStatus] using [connectionStatus.initialize]. If there is no
/// connection, it calls [updateConnectivity] with [false] and the [connectionStatus].
/// Finally, it listens for changes in the connection status using
/// [connectionStatus.connectionChange.listen] and calls [updateConnectivity] with
/// the event and the [connectionStatus]. It also logs a message using [talker.info].
Future<void> initNoInternetListener() async {
  // Get an instance of ConnectionStatusListener
  var connectionStatus = ConnectionStatusListener.getInstance();

  // Initialize the connection status
  await connectionStatus.initialize();

  // If there is no connection, update the connectivity status
  if (!connectionStatus.hasConnection) {
    updateConnectivity(false, connectionStatus);
  }

  // Listen for changes in the connection status
  connectionStatus.connectionChange.listen((event) {
    // Log the event
    print("initNoInternetListener $event");

    // Update the connectivity status with the event
    updateConnectivity(event, connectionStatus);
  });

  // Log a message indicating that the connection status listeners are initialized
  talker.info("Connection Status Listeners initialized !");
}
