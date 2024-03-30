import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_starter/clients/talker.dart';
import 'package:flutter_riverpod_starter/utils/sizer/sizer.dart';

import '../constants.dart';

/// A class responsible for monitoring and managing the connection status.
class ConnectionStatusListener {
  // This creates the single instance by calling the `_internal` constructor specified below
  static final _singleton = ConnectionStatusListener._internal();

  ConnectionStatusListener._internal();

  bool hasShownNoInternet = false;

  // Connectivity Plus instance
  final Connectivity _connectivity = Connectivity();

  // This is what's used to retrieve the instance through the app
  static ConnectionStatusListener getInstance() => _singleton;

  // This tracks the current connection status
  bool hasConnection = false;

  // This is how we'll allow subscribing to connection changes
  StreamController connectionChangeController = StreamController.broadcast();

  Stream get connectionChange => connectionChangeController.stream;

  // Flutter Connectivity's listener
  void _connectionChange(List<ConnectivityResult>? result) {
    checkConnection();
  }

  // The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    // The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }

  // Hook into Connectivity Plus's Stream to listen for changes
  // And check the connection status out of the gate
  Future<void> initialize() async {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    await checkConnection();
  }

  // A clean-up method to close our StreamController
  // Because this is meant to exist through the entire application life cycle this isn't really an issue
  void dispose() {
    connectionChangeController.close();
  }
}

/// Updates the connectivity status and displays a snackbar accordingly.
void updateConnectivity(
  dynamic hasConnection,
  ConnectionStatusListener connectionStatus,
) {
  if (!hasConnection) {
    connectionStatus.hasShownNoInternet = true;
    talker.info("Offline !");
    showSnackBar("offline");
  } else {
    if (connectionStatus.hasShownNoInternet) {
      connectionStatus.hasShownNoInternet = false;
      talker.info("Online !");
      showSnackBar("online");
    }
  }
}

/// Displays a snackbar with the provided message and styling.
void showSnackBar(String msg) {
  bool offline = (msg == "offline");
  MaterialColor? bgColor = offline ? Colors.red : null;
  IconData icon = offline ? Icons.sync_disabled : Icons.sync;
  Color color = offline ? Colors.white : Colors.black;

  final SnackBar snackBar = SnackBar(
    backgroundColor: bgColor,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: 40.h),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        Text(
          'You are $msg',
          style: TextStyle(color: color),
        ),
      ],
    ),
  );

  if (networkSnackbarKey.currentState!.mounted)
    networkSnackbarKey.currentState?.removeCurrentSnackBar();
  networkSnackbarKey.currentState?.showSnackBar(snackBar);
}

/// Initializes the listener for no internet connection.
Future<void> initNoInternetListener() async {
  var connectionStatus = ConnectionStatusListener.getInstance();
  await connectionStatus.initialize();
  if (!connectionStatus.hasConnection) {
    updateConnectivity(false, connectionStatus);
  }
  connectionStatus.connectionChange.listen((event) {
    print("initNoInternetListener $event");
    updateConnectivity(event, connectionStatus);
  });

  talker.info("Connection Status Listeners initialized !");
}
