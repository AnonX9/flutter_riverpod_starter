import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A standard error widget to display when an error occurs.
class StandardErrorWidget extends ConsumerWidget {
  const StandardErrorWidget(
    this.error,
    this.stackTrace, {
    super.key,
    this.message,
    this.icon,
  });

  /// The error object that caused the error.
  final Object? error;

  /// The stack trace associated with the error.
  final StackTrace stackTrace;

  /// The optional message to display along with the error.
  final String? message;

  /// The optional icon to display for the error.
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon ??
              Icons
                  .sentiment_very_dissatisfied), // Display the error icon or default icon
          Text(message ??
              'Something went wrong..'), // Display the error message or default message
        ],
      ),
    );
  }
}
