// Import necessary packages
import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Create a global instance of Talker for logging messages.
final talker = Talker(
  logger: TalkerLogger(
    // Define the output method for logging messages
    output: (String message) => message.split('\n').forEach(debugPrintSynchronously),
    // Configure logger settings such as colors, log level, and maximum line width
    settings: TalkerLoggerSettings(
      colors: {
        // Configure color for verbose log messages
        LogLevel.verbose: AnsiPen()..cyan(),
        // Configure color for info log messages
        LogLevel.info: AnsiPen()..white(),
      },
      // Set the log level to debug
      level: LogLevel.debug,
      // Set the maximum line width for log messages
      maxLineWidth: 120,
    ),
  ),
);
